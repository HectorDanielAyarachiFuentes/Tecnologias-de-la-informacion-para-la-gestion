# 📂 Actividad 4 · Estructura de Entregables Separados

Para evitar confusiones entre los dos flujos de trabajo y formatos de salida, los archivos han sido organizados en dos subcarpetas independientes:

---

## 📁 Estructura

```text
Actividad 4/
├── 1_PDF_Typst/       # Entorno de maquetación tipográfica para PDF institucional
│   ├── Actividad 4 - Investigacion Modernizacion Nacion Neuquen.typ
│   └── Actividad 4 - Investigacion Modernizacion Nacion Neuquen.pdf
│
└── 2_Word_Quarto/     # Entorno de procesamiento técnico para formato Microsoft Word (.docx)
    ├── Actividad 4 - Investigacion Modernizacion Nacion Neuquen.qmd
    ├── plantilla_academica.docx
    └── Actividad 4 - Investigacion Modernizacion Nacion Neuquen.docx
```

---

## 🛠️ Comandos de Compilación

### 1. Generar el PDF (Typst)
* **Automático:** Iniciar el monitor con `python plantillas_pdf/1_typst/auto_compilar_typst.py` (se compila solo al guardar con Ctrl + S).
* **Manual:**
  ```bash
  python -c "import typst; typst.compile('Entregables/Actividad 4/1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.typ', output='Entregables/Actividad 4/1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.pdf', root='.')"
  ```

### 2. Generar el Word (Quarto)
* **Manual desde la raíz:**
  ```bash
  quarto render "Entregables/Actividad 4/2_Word_Quarto/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.qmd"
  ```
