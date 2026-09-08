# 🤖 Reglas de Comportamiento del Agente (Agent Rules)

Este archivo define la estructura, estándares y pautas operativas obligatorias para cualquier IA o asistente que trabaje en este repositorio.

---

## 🏛️ 1. Contexto del Proyecto
* **Materia:** Tecnología de la Información para la Gestión (TIG).
* **Institución:** Complejo Universitario Regional Zona Atlántica y Sur (CURZAS).
* **Enfoque técnico:** *Docs-as-Code* (documentación gestionada como código), automatización con Python y redacción tipográfica con **Typst**.

---

## 📂 2. Estructura de Directorios Obligatoria

```text
Tecnologias de la informacion para la gestion/
├── Actividad - Propuesta/   # Insumos, consignas oficiales y borradores por actividad
│   ├── Actividad 1/
│   └── Actividad 2/
├── Entregables/             # ÚNICA FUENTE DE LA VERDAD para versiones finales (.typ y .pdf)
│   ├── Actividad 1/
│   └── Actividad 2/
├── Material/                # Documentación de lectura y referencia (solo lectura)
├── plantillas_pdf/          # Motores de exportación y plantillas reutilizables
│   └── 1_typst/             # Sistema Typst y auto-compilador (auto_compilar_typst.py)
└── pruebas/                 # Zona de aislamiento para pruebas y scripts temporales
```

---

## 📄 3. Estándar para Documentos y Reportes (Typst y Quarto)

1. **Formatos Oficiales:**
   * **Typst (`.typ`):** Formato principal para entregas académicas, informes y reportes maquetados directamente a **PDF (`.pdf`)**.
   * **Quarto (`.qmd`):** Formato utilizado para actividades que requieran entrega en **Microsoft Word (`.docx`)** con maquetación académica (`plantilla_academica.docx`).
2. **Sincronización:** Cada vez que se cree o edite un archivo `.typ` o `.qmd`, se debe compilar y actualizar su `.pdf` o `.docx` correspondiente en la carpeta `Entregables/`.
3. **Estilo Visual e Institucional:**
   * **Tipografía:** *Arial* o *Segoe UI*, tamaño base `9.5pt` a `10pt`, interlineado `0.65em` a `0.7em`.
   * **Paleta de Colores:**
     * Color Primario (Teal institucional): `#0e6873` / `#153e5c`
     * Acento / Alertas: `#c65911` / `#c1741f`
     * Texto Principal: `#2c3e50` / `#1f2933`
     * Texto Secundario: `#787878` / `#646464`
     * Fondos de Cajas: `#f2f7f7` / `#fdf2e9`
   * **Componentes:** Usar cajas destacadas (`callout`), tablas limpias con cabecera en color primario y pie de página con paginación `Página X de Y`.
4. **Fidelidad al Diseño de Referencia:** Se debe respetar rigurosamente el diseño, estructura visual, encabezados, colores, márgenes y tipografía del PDF de la consigna o documento base al que se haga referencia en cada actividad.
5. **Carátula y Paginación Obligatoria:**
   * **Carátula / Portada:** Todo documento debe incluir una portada inicial con el título de la actividad/consigna, materia (TIG - CURZAS), nombre del autor (**Hector Daniel Ayarachi Fuentes**) y fecha de entrega.
   * **Sin Numeración en Portada:** La carátula no debe mostrar encabezado ni número de página (`header: none, footer: none`).
   * **Numeración desde la 2ª Página:** La numeración de páginas debe figurar visible a partir de la segunda página (cuerpo del documento) con el formato `Página X de Y`.
6. **Integración Obligatoria del Logotipo de CURZAS (`Logotipo de curzas/CURZAS.png`):**
   * **En la Carátula:** Debe figurar el logotipo oficial en tamaño grande y destacado en la portada (`width: 110pt` a `140pt`).
   * **En el Pie de Página:** Debe incluirse en el centro del pie de página, entre el texto informativo de la izquierda y la numeración de la derecha, en tamaño reducido pero nítido y visible (`height: 12pt` a `15pt`).

---

## ⚡ 3.1. Auto-Compilación Dual en Segundo Plano (Regla de CERO COMANDOS)

* **REGLA ESTRICTA PARA EL AGENTE:** **Bajo ninguna circunstancia se debe exigir o pedir al usuario que escriba comandos manuales en la terminal para compilar.** El flujo debe ser 100% automático, transparente y desatendido.
* **Mecanismo de Observación (`auto_compilar_typst.py`):** El motor [plantillas_pdf/1_typst/auto_compilar_typst.py](file:///c:/Users/Ramoncito/.antigravity-ide/Tecnologias%20de%20la%20informacion%20para%20la%20gestion/plantillas_pdf/1_typst/auto_compilar_typst.py) vigila continuamente tanto archivos `.typ` como `.qmd`.
* **Disparo Automático:** Cada vez que se guarda un cambio (<kbd>Ctrl</kbd> + <kbd>S</kbd>):
  * Los archivos `.typ` se compilan inmediatamente a `.pdf` (vía `typst.compile`, ~0.15s).
  * Los archivos `.qmd` se compilan a `.docx` (vía Quarto CLI, ~2.5s).
* **Arranque Automático en el Editor:** Está configurado en `.vscode/tasks.json` (`runOn: folderOpen`) y `.vscode/settings.json` (`"task.allowAutomaticTasks": "on"`). Al abrir el espacio de trabajo en el IDE, el auto-compilador se inicia solo en segundo plano.
* **Tolerancia a Bloqueos de Windows:** Si un archivo `.docx` o `.pdf` está abierto en Microsoft Word o Adobe Acrobat, el compilador detecta el bloqueo mediante Win32 API (`CreateFileW`), notifica con sonido suave y recompila automáticamente en cuanto el usuario cierra el documento, sin abortar ni generar errores.

---

## 🧹 4. Higiene y Mantenimiento del Repositorio

* **Prohibido ensuciar la raíz:** Nunca crear scripts temporales, volcados de texto o archivos de prueba (`test_*.py`, `temp_*.typ`, `dump.txt`) en el directorio raíz.
* **Uso de `pruebas/`:** Cualquier prueba intermedia o script desechable debe ubicarse en `pruebas/` y limpiarse cuando ya no sea necesario.
* **Archivos pesados:** No duplicar ejecutables binarios pesados (ej. `typst.exe`) en carpetas de entregables; utilizar las librerías instaladas en el entorno Python (`import typst`).

---

## 💬 5. Comunicación y Respuestas

* **Idioma:** Español neutro/argentino, profesional y pedagógico.
* **Concisión:** Explicaciones claras, enlaces directos a archivos (`[nombre](file:///...)`) y confirmación de compilaciones exitosas.
