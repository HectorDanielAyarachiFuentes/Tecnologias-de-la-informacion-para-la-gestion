# ⚡ Auto-Compilador Dual Unificado: Typst + Quarto

Este módulo contiene el motor de compilación automática en tiempo real para generar documentos académicos y reportes ejecutivos tanto en **PDF (Typst)** como en **Word (Quarto)**.

---

## 🪄 Modo 100% Automático (Sin Escribir Comandos)

El sistema vigila en segundo plano todos los documentos del repositorio. **No requiere escribir comandos en consola**:
* Al editar un archivo **`.typ`** y presionar **`Ctrl + S`**, se compila inmediatamente a **`.pdf`** (~0.15s).
* Al editar un archivo **`.qmd`** (Quarto) y presionar **`Ctrl + S`**, se compila automáticamente a **`.docx`** con la plantilla académica institucional (~2.5s).

### 🚀 Arranque y Funcionamiento
1. **Inicio Automático en el IDE:** Al abrir el proyecto en Antigravity IDE / VS Code, el proceso se lanza automáticamente en segundo plano (`.vscode/settings.json`).
2. **Lanzador Manual (Opcional):** Si se desea ejecutar fuera del editor, basta con hacer doble clic en `INICIAR_COMPILADOR.bat` en la raíz del repositorio.
3. **Detección de Bloqueos de Windows:** Si Microsoft Word o Adobe Acrobat tienen el archivo abierto, el motor no se detiene; emite un sonido suave y reintenta compilar en cuanto se cierra la aplicación.

---

## 📌 Ejecución Manual Específica (Solo si se requiere)

```bash
# Ejecutar el monitor dual:
python plantillas_pdf/1_typst/auto_compilar_typst.py

# Compilar un Typst puntual:
python -c "import typst; typst.compile('ruta/archivo.typ', output='ruta/archivo.pdf', root='.')"

# Renderizar un Quarto puntual:
quarto render "ruta/archivo.qmd"
```

