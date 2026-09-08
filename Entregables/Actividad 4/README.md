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

## 🛠️ Compilación Automática (Cero Comandos)

### 1. Modo Automático en Segundo Plano (Sin Escribir Comandos)
El compilador dual vigila permanentemente tanto el archivo Typst (`.typ`) como el archivo Quarto (`.qmd`). **Solo debes editar y presionar `Ctrl + S`**:
* **Typst $\rightarrow$ PDF:** Se actualiza al instante en `1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.pdf` (~0.15s).
* **Quarto $\rightarrow$ DOCX:** Se compila con `plantilla_academica.docx` a `2_Word_Quarto/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.docx` (~2.5s).
* **Arranque automático:** Se inicia solo al abrir la carpeta en el editor (configurado en `.vscode/settings.json`).
* **Protección ante bloqueo de Word:** Si el `.docx` está abierto en Word, el compilador emite un aviso sonoro suave y se actualiza automáticamente al momento de cerrar Word.
* **Lanzador manual (opcional):** Doble clic en `INICIAR_COMPILADOR.bat` en la raíz (sin abrir terminales).

### 2. Compilación Manual (Bajo Demanda)
* **Generar el PDF (Typst):**
  ```bash
  python -c "import typst; typst.compile('Entregables/Actividad 4/1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.typ', output='Entregables/Actividad 4/1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.pdf', root='.')"
  ```
* **Generar el Word (Quarto):**
  ```bash
  quarto render "Entregables/Actividad 4/2_Word_Quarto/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.qmd"
  ```
