# ⚡ Generador y Compilador Automático de Typst a PDF

Este módulo contiene el sistema de compilación de **Typst** para generar documentos académicos y reportes ejecutivos con sintaxis simple tipo Markdown.

---

## 🪄 Modo Automático en Tiempo Real (Recomendado)

Cada vez que editas cualquier archivo `.typ` en el proyecto y presionas **`Ctrl + S`**, el sistema **detecta el cambio y compila el PDF al instante de forma 100% automática**.

### 🚀 Cómo iniciar el Modo Automático:

**Opción 1 (Doble clic):**
Ejecuta el archivo `iniciar_modo_automatico.bat`.

**Opción 2 (Terminal):**
```bash
python auto_compilar_typst.py
```

---

## 📌 Compilación Manual (A demanda)

Si prefieres compilar un archivo puntual sin dejar el observador activo:

```bash
python generar_con_typst.py
```
O directamente desde Python en cualquier script:
```python
import typst
typst.compile("mi_documento.typ", output="mi_documento.pdf")
```
