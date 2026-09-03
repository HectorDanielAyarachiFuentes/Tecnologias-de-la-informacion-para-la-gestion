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

## 📄 3. Estándar para Documentos y Reportes (Typst)

1. **Formato Principal:** Todas las entregas académicas, informes y reportes deben redactarse en **Typst (`.typ`)** y compilarse a **PDF (`.pdf`)**.
2. **Sincronización:** Cada vez que se cree o edite un archivo `.typ`, se debe compilar y actualizar su `.pdf` correspondiente en la carpeta `Entregables/`.
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

## 🧹 4. Higiene y Mantenimiento del Repositorio

* **Prohibido ensuciar la raíz:** Nunca crear scripts temporales, volcados de texto o archivos de prueba (`test_*.py`, `temp_*.typ`, `dump.txt`) en el directorio raíz.
* **Uso de `pruebas/`:** Cualquier prueba intermedia o script desechable debe ubicarse en `pruebas/` y limpiarse cuando ya no sea necesario.
* **Archivos pesados:** No duplicar ejecutables binarios pesados (ej. `typst.exe`) en carpetas de entregables; utilizar las librerías instaladas en el entorno Python (`import typst`).

---

## 💬 5. Comunicación y Respuestas

* **Idioma:** Español neutro/argentino, profesional y pedagógico.
* **Concisión:** Explicaciones claras, enlaces directos a archivos (`[nombre](file:///...)`) y confirmación de compilaciones exitosas.
