"""
Auto-compilador inteligente de Typst a PDF en tiempo real (Modo Automático / Watcher)
Monitorea continuamente cualquier archivo con extensión .typ y genera/actualiza
automáticamente su PDF correspondiente en el mismo instante en que se guarda (Ctrl + S).
"""

import os
import sys
import time
from datetime import datetime

try:
    import typst
except ImportError:
    print("❌ Error: No se encontró la librería 'typst'. Instálala con: pip install typst")
    sys.exit(1)

# Carpetas a excluir de la compilación automática (ej. plantillas base abstractas si no son documentos completos)
EXCLUDE_DIRS = {'.git', '.vscode', '.gemini', 'typst_bin', '__pycache__'}

def get_all_typ_files(root_dir):
    """Encuentra todos los archivos .typ dentro del directorio y subdirectorios."""
    typ_files = {}
    for root, dirs, files in os.walk(root_dir):
        # Filtrar carpetas excluidas
        dirs[:] = [d for d in dirs if d not in EXCLUDE_DIRS]
        for f in files:
            if f.endswith('.typ'):
                full_path = os.path.abspath(os.path.join(root, f))
                try:
                    mtime = os.path.getmtime(full_path)
                    typ_files[full_path] = mtime
                except OSError:
                    pass
    return typ_files

def compilar_archivo(typ_path, root_dir=None):
    """Compila un archivo .typ a su PDF correspondiente."""
    pdf_path = os.path.splitext(typ_path)[0] + ".pdf"
    file_name = os.path.basename(typ_path)
    hora = datetime.now().strftime("%H:%M:%S")
    
    if root_dir is None:
        root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))

    try:
        typst.compile(typ_path, output=pdf_path, root=root_dir)
        size_kb = os.path.getsize(pdf_path) / 1024
        print(f"[{hora}] ⚡ ¡MAGIA AUTOMÁTICA! -> '{file_name}' compilado con éxito ({size_kb:.1f} KB)")
        print(f"         📄 PDF listo: {pdf_path}")
        return True
    except Exception as e:
        error_msg = str(e).strip()
        # Si es una plantilla sin contenido principal, informar suavemente
        if "cannot compile empty" in error_msg.lower():
            return False
        print(f"[{hora}] ⚠️ Error de sintaxis en '{file_name}':")
        print(f"         {error_msg}")
        return False

def iniciar_observador(directorio_raiz=None):
    """Bucle principal de observación y compilación automática."""
    if directorio_raiz is None:
        # Por defecto observa desde la raíz del proyecto para abarcar todas las carpetas
        directorio_raiz = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
    
    print("=" * 70)
    print(" 🚀 MODO AUTOMÁTICO TYPST -> PDF ACTIVADO")
    print(f" 📂 Observando directorio: {directorio_raiz}")
    print(" 👁️  El sistema detectará cualquier cambio en archivos .typ y generará el PDF al instante.")
    print(" 🛑 Presiona Ctrl + C para detener el modo automático.")
    print("=" * 70)

    # Estado previo de tiempos de modificación
    archivos_previos = get_all_typ_files(directorio_raiz)
    
    # Compilar inicialmente todos los archivos encontrados si no tienen PDF o si cambiaron
    print(f"\n🔍 Se detectaron {len(archivos_previos)} archivos .typ en el proyecto.")
    print("✨ Listo y escuchando cambios (Presiona Ctrl + S en cualquier archivo .typ)...\n")

    try:
        while True:
            time.sleep(0.5)  # Chequeo liviano cada medio segundo
            archivos_actuales = get_all_typ_files(directorio_raiz)

            # 1. Detectar archivos modificados
            for ruta, mtime in archivos_actuales.items():
                if ruta not in archivos_previos:
                    # Nuevo archivo .typ creado
                    hora = datetime.now().strftime("%H:%M:%S")
                    print(f"[{hora}] 🆕 Nuevo archivo detectado: {os.path.basename(ruta)}")
                    compilar_archivo(ruta)
                elif mtime > archivos_previos[ruta]:
                    # Archivo modificado
                    compilar_archivo(ruta)

            archivos_previos = archivos_actuales

    except KeyboardInterrupt:
        print("\n\n🛑 Modo automático detenido. ¡Hasta la próxima!")

if __name__ == "__main__":
    # Permite pasar un directorio personalizado por parámetro o usar la raíz
    directorio = sys.argv[1] if len(sys.argv) > 1 else None
    iniciar_observador(directorio)
