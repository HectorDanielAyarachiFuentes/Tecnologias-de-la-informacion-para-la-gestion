"""
⚡ Auto-Compilador Inteligente Dual (Typst + Quarto)
==================================================
Monitorea en tiempo real y compila automáticamente:
  • Typst (.typ)   -> PDF (.pdf)  [Instantáneo vía librería typst nativa]
  • Quarto (.qmd)  -> Word (.docx) / PDF / HTML [Vía CLI Quarto con estilos y plantillas]

Características avanzadas:
  - Detección de archivos bloqueados por Microsoft Word / Adobe Acrobat (evita fallos silenciosos).
  - Espera automática de liberación: compila apenas el usuario cierra el archivo en Word.
  - Sincronización inteligente al iniciar (verifica qué documentos faltan o están desactualizados).
  - Debounce (300 ms) para evitar lecturas incompletas en guardados rápidos.
  - Alertas visuales con colores ANSI, marcas de tiempo y pesos de archivo.
  - Retroalimentación auditiva suave en Windows (beep de éxito / alerta).
"""

import os
import sys
import time
import subprocess
import shutil
import ctypes
import threading
import argparse
from datetime import datetime

# Activar soporte de secuencias ANSI en Windows (CMD / PowerShell)
if sys.platform == "win32":
    os.system("")

# Códigos de color ANSI para feedback visual de alto impacto
CLR_RESET = "\033[0m"
CLR_BOLD = "\033[1m"
CLR_DIM = "\033[2m"
CLR_RED = "\033[91m"
CLR_GREEN = "\033[92m"
CLR_YELLOW = "\033[93m"
CLR_BLUE = "\033[94m"
CLR_MAGENTA = "\033[95m"
CLR_CYAN = "\033[96m"
CLR_WHITE = "\033[97m"

# Carpetas excluidas de la supervisión
EXCLUDE_DIRS = {'.git', '.vscode', '.gemini', 'typst_bin', '__pycache__', '.quarto', 'node_modules', 'scratch'}

# Detección de motores disponibles
HAVE_TYPST = False
try:
    import typst
    HAVE_TYPST = True
except ImportError:
    pass

QUARTO_CMD = shutil.which("quarto")
if not QUARTO_CMD and sys.platform == "win32":
    # Probar rutas comunes de Quarto en Windows
    common_quarto_paths = [
        os.path.expandvars(r"%LOCALAPPDATA%\Programs\Quarto\bin\quarto.cmd"),
        os.path.expandvars(r"%ProgramFiles%\Quarto\bin\quarto.cmd"),
    ]
    for qp in common_quarto_paths:
        if os.path.isfile(qp):
            QUARTO_CMD = qp
            break

# Configuración global
ENABLE_SOUND = True

def reproducir_sonido(tipo="success"):
    """Emite un sonido de notificación no intrusivo en segundo plano."""
    if not ENABLE_SOUND or sys.platform != "win32":
        return
    def _beep():
        try:
            import winsound
            if tipo == "success":
                winsound.MessageBeep(winsound.MB_ICONASTERISK)
            elif tipo == "warn":
                winsound.MessageBeep(winsound.MB_ICONEXCLAMATION)
            elif tipo == "error":
                winsound.MessageBeep(winsound.MB_ICONHAND)
        except Exception:
            pass
    threading.Thread(target=_beep, daemon=True).start()

def is_file_locked(filepath):
    """
    Detecta si un archivo está actualmente bloqueado para escritura por otra aplicación
    (como Microsoft Word o Adobe Acrobat Reader).
    """
    if not os.path.exists(filepath):
        return False
    if sys.platform == "win32":
        GENERIC_WRITE = 0x40000000
        OPEN_EXISTING = 3
        FILE_ATTRIBUTE_NORMAL = 0x80
        INVALID_HANDLE_VALUE = ctypes.c_void_p(-1).value
        handle = ctypes.windll.kernel32.CreateFileW(
            filepath,
            GENERIC_WRITE,
            0,  # Exclusivo: falla si otro proceso lo tiene abierto sin compartir escritura
            None,
            OPEN_EXISTING,
            FILE_ATTRIBUTE_NORMAL,
            None
        )
        if handle == -1 or handle == INVALID_HANDLE_VALUE:
            err = ctypes.GetLastError()
            # 32: ERROR_SHARING_VIOLATION, 5: ERROR_ACCESS_DENIED
            if err in (5, 32):
                return True
            return False
        ctypes.windll.kernel32.CloseHandle(handle)
        return False
    else:
        try:
            with open(filepath, 'a+b'):
                pass
            return False
        except (PermissionError, OSError):
            return True

def parse_qmd_output_target(qmd_path):
    """
    Analiza el encabezado YAML del documento .qmd para determinar el archivo de salida exacto
    y el formato configurado (docx, pdf, html).
    """
    directory = os.path.dirname(qmd_path)
    base_name = os.path.splitext(os.path.basename(qmd_path))[0]
    ext = ".docx"  # Formato predeterminado para entregables de la cátedra
    custom_name = None

    try:
        with open(qmd_path, 'r', encoding='utf-8', errors='ignore') as f:
            in_yaml = False
            in_format = False
            for line in f:
                stripped = line.strip()
                if stripped == "---":
                    if not in_yaml:
                        in_yaml = True
                        continue
                    else:
                        break
                if in_yaml:
                    if stripped.startswith("output-file:"):
                        val = stripped.split(":", 1)[1].strip().strip('"\'')
                        if val:
                            custom_name = val
                    elif stripped.startswith("format:"):
                        in_format = True
                    elif in_format and ":" in stripped:
                        fmt_cand = stripped.split(":", 1)[0].strip()
                        if fmt_cand in ("docx", "pdf", "html"):
                            ext = f".{fmt_cand}"
    except Exception:
        pass

    if custom_name:
        if not os.path.isabs(custom_name):
            return os.path.abspath(os.path.join(directory, custom_name)), ext.replace(".", "")
        return custom_name, ext.replace(".", "")
    return os.path.abspath(os.path.join(directory, base_name + ext)), ext.replace(".", "")

def compilar_typst(typ_path, root_dir):
    """Compila un archivo Typst (.typ) a PDF."""
    if not HAVE_TYPST:
        print(f"{CLR_RED}❌ Error: La librería 'typst' no está disponible.{CLR_RESET}")
        return False

    file_name = os.path.basename(typ_path)
    pdf_path = os.path.splitext(typ_path)[0] + ".pdf"
    hora = datetime.now().strftime("%H:%M:%S")

    # Verificar bloqueo de archivo en Adobe Reader u otro visor
    if is_file_locked(pdf_path):
        print(f"\n[{hora}] {CLR_YELLOW}⚠️  [ARCHIVO BLOQUEADO]{CLR_RESET} '{os.path.basename(pdf_path)}' está abierto en un lector de PDF (ej. Adobe Acrobat).")
        print(f"         👉 Por favor ciérralo o desbloquéalo para que Typst pueda actualizarlo.")
        reproducir_sonido("warn")
        return "LOCKED"

    t0 = time.time()
    try:
        typst.compile(typ_path, output=pdf_path, root=root_dir)
        elapsed = time.time() - t0
        size_kb = os.path.getsize(pdf_path) / 1024
        print(f"[{hora}] {CLR_CYAN}⚡ [TYPST]{CLR_RESET} {CLR_GREEN}¡Compilación exitosa!{CLR_RESET} ({elapsed:.2f}s)")
        print(f"         📄 Salida: {CLR_BOLD}{os.path.basename(pdf_path)}{CLR_RESET} ({size_kb:.1f} KB)")
        print(f"         📍 Ruta: {pdf_path}")
        reproducir_sonido("success")
        return True
    except Exception as e:
        error_msg = str(e).strip()
        if "cannot compile empty" in error_msg.lower():
            return False
        print(f"\n[{hora}] {CLR_RED}⚠️  [TYPST ERROR]{CLR_RESET} Error al compilar '{file_name}':")
        print(f"{CLR_RED}{error_msg}{CLR_RESET}\n")
        reproducir_sonido("error")
        return False

def compilar_quarto(qmd_path):
    """Compila un archivo Quarto (.qmd) al formato objetivo (ej. DOCX)."""
    if not QUARTO_CMD:
        print(f"{CLR_RED}❌ Error: Quarto CLI no fue detectado en el PATH.{CLR_RESET}")
        return False

    file_name = os.path.basename(qmd_path)
    output_path, fmt = parse_qmd_output_target(qmd_path)
    output_name = os.path.basename(output_path)
    hora = datetime.now().strftime("%H:%M:%S")

    # Verificar si el archivo de salida está bloqueado en Microsoft Word
    if is_file_locked(output_path):
        print(f"\n[{hora}] {CLR_YELLOW}⚠️  [ARCHIVO BLOQUEADO EN WORD]{CLR_RESET} '{output_name}' está abierto en Microsoft Word.")
        print(f"         👉 {CLR_BOLD}Cierra el archivo en Word.{CLR_RESET} ¡Se compilará automáticamente en cuanto lo cierres!")
        reproducir_sonido("warn")
        return "LOCKED"

    print(f"[{hora}] {CLR_MAGENTA}⏳ [QUARTO]{CLR_RESET} Compilando '{file_name}' a {fmt.upper()}...")
    t0 = time.time()
    directory = os.path.dirname(qmd_path)

    try:
        res = subprocess.run(
            [QUARTO_CMD, "render", file_name],
            cwd=directory,
            capture_output=True,
            text=True,
            encoding='utf-8',
            errors='replace'
        )
        elapsed = time.time() - t0

        if res.returncode == 0 and os.path.exists(output_path):
            size_kb = os.path.getsize(output_path) / 1024
            print(f"[{hora}] {CLR_MAGENTA}⚡ [QUARTO]{CLR_RESET} {CLR_GREEN}¡Compilación exitosa!{CLR_RESET} ({elapsed:.1f}s)")
            print(f"         📄 Salida: {CLR_BOLD}{output_name}{CLR_RESET} ({size_kb:.1f} KB)")
            print(f"         📍 Ruta: {output_path}")
            reproducir_sonido("success")
            return True
        else:
            # Revisar si falló por permiso (archivo bloqueado)
            output_err = res.stderr + "\n" + res.stdout
            if "permission denied" in output_err.lower() or "sharing violation" in output_err.lower() or "used by another process" in output_err.lower():
                print(f"\n[{hora}] {CLR_YELLOW}⚠️  [BLOQUEO DE ARCHIVO]{CLR_RESET} '{output_name}' no pudo ser sobrescrito porque Microsoft Word lo tiene bloqueado.")
                print(f"         👉 Cierra el archivo en Word para completar la actualización.")
                reproducir_sonido("warn")
                return "LOCKED"
            print(f"\n[{hora}] {CLR_RED}⚠️  [QUARTO ERROR]{CLR_RESET} Error al compilar '{file_name}':")
            print(f"{CLR_RED}{output_err.strip()}{CLR_RESET}\n")
            reproducir_sonido("error")
            return False
    except Exception as e:
        print(f"\n[{hora}] {CLR_RED}⚠️  [QUARTO ERROR]{CLR_RESET} Error al ejecutar Quarto: {e}")
        reproducir_sonido("error")
        return False

def get_monitored_files(root_dir, watch_typst=True, watch_quarto=True):
    """
    Recorre el directorio y recolecta archivos .typ, .qmd y plantillas de referencia.
    Retorna un diccionario {ruta_absoluta: (mtime, tipo)}
    """
    files_map = {}
    for root, dirs, files in os.walk(root_dir):
        dirs[:] = [d for d in dirs if d not in EXCLUDE_DIRS]
        for f in files:
            full_path = os.path.abspath(os.path.join(root, f))
            ext = os.path.splitext(f)[1].lower()
            try:
                mtime = os.path.getmtime(full_path)
            except OSError:
                continue

            if watch_typst and ext == '.typ':
                files_map[full_path] = (mtime, 'TYPST')
            elif watch_quarto and ext == '.qmd':
                files_map[full_path] = (mtime, 'QUARTO')
            elif watch_quarto and f.lower() in ('plantilla_academica.docx', 'custom-reference.docx'):
                files_map[full_path] = (mtime, 'QUARTO_REF')
    return files_map

def sincronizar_al_inicio(root_dir, watch_typst, watch_quarto):
    """
    Comprueba si existen documentos .typ o .qmd cuyos archivos de salida (.pdf / .docx)
    estén desactualizados o falten, y los compila de inmediato.
    """
    print(f"\n{CLR_CYAN}🔄 [SINCRONIZACIÓN INICIAL]{CLR_RESET} Verificando estado de todos los documentos...")
    files_map = get_monitored_files(root_dir, watch_typst, watch_quarto)
    recompilados = 0

    for path, (_, ftype) in files_map.items():
        if ftype == 'TYPST':
            # Ignorar plantillas base sin contenido ejecutable
            if "plantillas" in path and not os.path.basename(path).startswith("ejemplo_"):
                continue
            pdf_path = os.path.splitext(path)[0] + ".pdf"
            if not os.path.exists(pdf_path) or os.path.getmtime(pdf_path) < os.path.getmtime(path):
                print(f"   ⚙️ Actualizando PDF faltante/desactualizado: {os.path.basename(path)}")
                res = compilar_typst(path, root_dir)
                if res is True:
                    recompilados += 1
        elif ftype == 'QUARTO':
            out_path, _ = parse_qmd_output_target(path)
            if not os.path.exists(out_path) or os.path.getmtime(out_path) < os.path.getmtime(path):
                print(f"   ⚙️ Actualizando DOCX faltante/desactualizado: {os.path.basename(path)}")
                res = compilar_quarto(path)
                if res is True:
                    recompilados += 1

    if recompilados > 0:
        print(f"{CLR_GREEN}✨ Sincronización completada:{CLR_RESET} {recompilados} documento(s) puestos al día.\n")
    else:
        print(f"{CLR_GREEN}✨ Todos los entregables están sincronizados y al día.{CLR_RESET}\n")

def iniciar_observador(directorio_raiz=None, watch_typst=True, watch_quarto=True, hacer_sync_inicial=True):
    """Bucle principal del monitor de compilación automática en tiempo real."""
    if directorio_raiz is None:
        directorio_raiz = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))

    print("=" * 72)
    print(f" {CLR_BOLD}🚀 AUTO-COMPILADOR DUAL EN TIEMPO REAL (Typst + Quarto){CLR_RESET}")
    print(f" 📂 Directorio raíz: {CLR_WHITE}{directorio_raiz}{CLR_RESET}")
    print(" 🎯 Motores activos:")
    if watch_typst:
        estado_typ = f"{CLR_GREEN}ACTIVO{CLR_RESET}" if HAVE_TYPST else f"{CLR_RED}NO INSTALADO{CLR_RESET}"
        print(f"    • {CLR_CYAN}[TYPST]{CLR_RESET}  .typ -> .pdf  [{estado_typ}]")
    if watch_quarto:
        estado_qmd = f"{CLR_GREEN}ACTIVO ({QUARTO_CMD}){CLR_RESET}" if QUARTO_CMD else f"{CLR_RED}NO DETECTADO{CLR_RESET}"
        print(f"    • {CLR_MAGENTA}[QUARTO]{CLR_RESET} .qmd -> .docx [{estado_qmd}]")
    print(f" 🛡️  {CLR_YELLOW}Detección de bloqueo:{CLR_RESET} Alerta y espera automática si Word/Acrobat tienen el archivo abierto.")
    sonido_txt = f"{CLR_GREEN}ACTIVADAS{CLR_RESET}" if ENABLE_SOUND else f"{CLR_DIM}DESACTIVADAS{CLR_RESET}"
    print(f" 🔔 Alertas sonoras: {sonido_txt}")
    print(f" 🛑 Presiona {CLR_BOLD}Ctrl + C{CLR_RESET} en cualquier momento para detener.")
    print("=" * 72)

    if hacer_sync_inicial:
        sincronizar_al_inicio(directorio_raiz, watch_typst, watch_quarto)

    archivos_previos = get_monitored_files(directorio_raiz, watch_typst, watch_quarto)
    print(f"👁️  Supervisando {CLR_BOLD}{len(archivos_previos)}{CLR_RESET} archivos activos. Guardá con {CLR_BOLD}Ctrl + S{CLR_RESET} para compilar al instante...\n")

    # Cola de debounce: {ruta: (tiempo_deteccion, ftype)}
    debounce_cola = {}
    DEBOUNCE_SECS = 0.30

    # Archivos esperando desbloqueo en Word o Acrobat: {ruta_origen: (target_path, ftype)}
    bloqueados_esperando = {}

    try:
        while True:
            time.sleep(0.1)
            ahora = time.time()
            archivos_actuales = get_monitored_files(directorio_raiz, watch_typst, watch_quarto)

            # 1. Chequeo de archivos bloqueados: si ya se cerró Word/Acrobat, compilar de inmediato
            if bloqueados_esperando:
                liberados = []
                for src_path, (tgt_path, ftype) in list(bloqueados_esperando.items()):
                    if not is_file_locked(tgt_path):
                        hora = datetime.now().strftime("%H:%M:%S")
                        print(f"\n[{hora}] {CLR_GREEN}🔓 ¡Archivo liberado!{CLR_RESET} '{os.path.basename(tgt_path)}' se cerró. Compilando automáticamente...")
                        liberados.append(src_path)
                        if ftype == 'TYPST':
                            compilar_typst(src_path, directorio_raiz)
                        elif ftype == 'QUARTO':
                            compilar_quarto(src_path)
                for src in liberados:
                    del bloqueados_esperando[src]

            # 2. Detección de cambios y adiciones en archivos supervisados
            for ruta, (mtime, ftype) in archivos_actuales.items():
                if ruta not in archivos_previos:
                    # Archivo nuevo detectado
                    hora = datetime.now().strftime("%H:%M:%S")
                    print(f"[{hora}] 🆕 Archivo detectado: {os.path.basename(ruta)} ({ftype})")
                    debounce_cola[ruta] = (ahora, ftype)
                elif mtime > archivos_previos[ruta][0]:
                    # Archivo modificado
                    debounce_cola[ruta] = (ahora, ftype)

            archivos_previos = archivos_actuales

            # 3. Procesar cola de debounce cuando transcurrió el tiempo mínimo
            procesados = []
            for ruta, (t_detect, ftype) in list(debounce_cola.items()):
                if ahora - t_detect >= DEBOUNCE_SECS:
                    procesados.append(ruta)
                    hora = datetime.now().strftime("%H:%M:%S")

                    if ftype == 'TYPST':
                        print(f"[{hora}] 💾 {CLR_CYAN}[TYPST]{CLR_RESET} Guardado detectado en '{os.path.basename(ruta)}'")
                        res = compilar_typst(ruta, directorio_raiz)
                        if res == "LOCKED":
                            pdf_target = os.path.splitext(ruta)[0] + ".pdf"
                            bloqueados_esperando[ruta] = (pdf_target, 'TYPST')
                    elif ftype == 'QUARTO':
                        print(f"[{hora}] 💾 {CLR_MAGENTA}[QUARTO]{CLR_RESET} Guardado detectado en '{os.path.basename(ruta)}'")
                        res = compilar_quarto(ruta)
                        if res == "LOCKED":
                            tgt_path, _ = parse_qmd_output_target(ruta)
                            bloqueados_esperando[ruta] = (tgt_path, 'QUARTO')
                    elif ftype == 'QUARTO_REF':
                        # Se modificó una plantilla de Word (ej. plantilla_academica.docx)
                        print(f"[{hora}] 🎨 {CLR_MAGENTA}[PLANTILLA WORD MODIFICADA]{CLR_RESET} '{os.path.basename(ruta)}'")
                        # Re-compilar los .qmd del mismo directorio
                        dir_name = os.path.dirname(ruta)
                        for qmd_cand in os.listdir(dir_name):
                            if qmd_cand.endswith(".qmd"):
                                full_qmd = os.path.join(dir_name, qmd_cand)
                                compilar_quarto(full_qmd)

            for ruta in procesados:
                del debounce_cola[ruta]

    except KeyboardInterrupt:
        print(f"\n\n{CLR_YELLOW}🛑 Auto-compilador detenido por el usuario. ¡Hasta la próxima!{CLR_RESET}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Compilador Automático Dual (Typst + Quarto)")
    parser.add_argument("directorio", nargs="?", default=None, help="Directorio a supervisar (por defecto la raíz del repositorio)")
    parser.add_argument("--no-sound", action="store_true", help="Desactiva las alertas sonoras en Windows")
    parser.add_argument("--typst-only", action="store_true", help="Supervisar únicamente archivos Typst (.typ)")
    parser.add_argument("--quarto-only", action="store_true", help="Supervisar únicamente archivos Quarto (.qmd)")
    parser.add_argument("--no-sync", action="store_true", help="Omitir la sincronización de archivos al iniciar")
    args = parser.parse_args()

    if args.no_sound:
        ENABLE_SOUND = False

    w_typ = not args.quarto_only
    w_qmd = not args.typst_only
    do_sync = not args.no_sync

    iniciar_observador(args.directorio, watch_typst=w_typ, watch_quarto=w_qmd, hacer_sync_inicial=do_sync)
