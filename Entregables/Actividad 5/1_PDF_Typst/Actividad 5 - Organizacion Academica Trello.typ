// ==============================================================================
// UNIVERSIDAD NACIONAL DEL COMAHUE - CURZAS
// TECNOLOGÍA DE LA INFORMACIÓN PARA LA GESTIÓN (TIG)
// ACTIVIDAD 5 - TRABAJO PRÁCTICO: ORGANIZACIÓN ACADÉMICA CON TRELLO
// AUTOR: Hector Daniel Ayarachi Fuentes
// ==============================================================================

#set document(
  title: "Actividad 5 - Organización Académica con Trello",
  author: ("Hector Daniel Ayarachi Fuentes"),
)

// Configuración tipográfica y de párrafos según estándares institucionales
#set text(font: "Arial", size: 9.8pt, fill: rgb("#1f2933"), lang: "es")
#set par(justify: true, leading: 0.68em)

// Paleta cromática oficial (AGENTS.md)
#let primary = rgb("#153e5c")        // Azul petróleo institucional
#let teal-accent = rgb("#0e6873")    // Teal institucional
#let orange-accent = rgb("#c1741f")  // Terracota / Acento
#let text-main = rgb("#1f2933")      // Texto principal
#let text-muted = rgb("#4b6575")     // Texto secundario
#let border-subtle = rgb("#b7c9d6")  // Borde suave
#let bg-card = rgb("#f2f7f7")        // Fondo suave teal
#let bg-alert = rgb("#fdf2e9")       // Fondo cálido naranja

// Componentes de estilo
#show heading.where(level: 1): it => block(
  above: 20pt,
  below: 10pt,
  stroke: (bottom: 1.5pt + teal-accent),
  inset: (bottom: 5pt),
  text(size: 13.5pt, fill: primary, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 14pt,
  below: 7pt,
  text(size: 11pt, fill: teal-accent, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 10pt,
  below: 5pt,
  text(size: 9.8pt, fill: rgb("#28536b"), weight: "bold", it.body),
)

#let callout(body, bg: "f2f7f7", border-color: "b7c9d6", left-color: "0e6873") = block(
  width: 100%,
  fill: rgb(bg),
  stroke: (
    top: 0.6pt + rgb(border-color),
    right: 0.6pt + rgb(border-color),
    bottom: 0.6pt + rgb(border-color),
    left: 4.5pt + rgb(left-color),
  ),
  inset: (x: 12pt, y: 10pt),
  radius: (right: 4pt),
  above: 10pt,
  below: 12pt,
  body,
)

#let nota(body) = block(
  width: 100%,
  fill: rgb("fdf6ee"),
  stroke: (left: 4pt + orange-accent, rest: 0.6pt + border-subtle),
  inset: (x: 11pt, y: 8pt),
  radius: (right: 3pt),
  above: 9pt,
  below: 11pt,
  text(size: 9.2pt, body),
)

#show table.cell: set par(justify: false, leading: 0.55em)
#show table.cell: set text(size: 8.7pt)

// ==============================================================================
// 1. CARÁTULA INSTITUCIONAL (PORTADA)
// ==============================================================================
#page(
  paper: "a4",
  margin: (x: 2cm, top: 2.3cm, bottom: 2.2cm),
  header: none,
  footer: none,
)[
  #grid(
    columns: (12pt, 1fr),
    gutter: 20pt,
    [
      #rect(
        width: 100%,
        height: 96%,
        fill: teal-accent,
        radius: 2pt,
      )
    ],
    [
      #v(8pt)
      // Logotipo oficial de CURZAS en tamaño destacado
      #image("../../../Logotipo de curzas/CURZAS.png", width: 135pt)
      
      #v(14pt)
      // Barra de acento naranja
      #rect(
        width: 100%,
        height: 4pt,
        fill: orange-accent,
        radius: 1pt,
      )
      
      #v(20pt)
      
      // Título Principal de la Actividad
      #text(size: 20pt, weight: "bold", fill: primary)[
        ORGANIZACIÓN ACADÉMICA CON TRELLO
      ]
      
      #v(8pt)
      
      // Subtítulo
      #text(size: 12.5pt, fill: text-muted, style: "italic")[
        Gestión Integral de Proyectos Universitarios y Modelo de Ciclo de Vida de Consignas mediante Metodología Kanban · Actividad 5
      ]
      
      #v(24pt)
      
      // Cuadro de Propósito y Enfoque Metodológico
      #block(
        width: 100%,
        fill: bg-card,
        stroke: (left: 4.5pt + teal-accent, rest: 0.6pt + border-subtle),
        inset: (x: 13pt, y: 11pt),
        radius: (right: 4pt),
        [
          #text(weight: "bold", fill: primary, size: 8.8pt, tracking: 0.08em)[PROPÓSITO Y SÍNTESIS DE LA ACTIVIDAD]\
          #v(4pt)
          #text(size: 9.1pt, fill: text-main)[
            Diseñar e implementar un sistema de gestión visual y colaborativa en Trello adaptado a la vida universitaria y, de manera específica, al ciclo de vida integral de todas las actividades prácticas de la materia *Tecnología de la Información para la Gestión (TIG)* en CURZAS - UNCo. Se modela el flujo de trabajo completo desde la recepción e inventariado de consignas oficiales (Actividades 1 a 5) hasta la redacción automatizada bajo el paradigma *Docs-as-Code*, el stack tecnológico (Typst, Quarto, Python), la estructura de carpetas institucional, la compilación a PDF, el control de calidad (QA), la publicación en foros con debate colaborativo y la evaluación docente final.
          ]
        ],
      )
      
      #v(50pt)
      
      // Metadatos institucionales y autoría
      #block(
        width: 100%,
        stroke: (top: 0.7pt + border-subtle),
        inset: (top: 16pt),
        [
          #grid(
            columns: (170pt, 1fr),
            row-gutter: 12pt,
            text(size: 8.8pt, weight: "bold", fill: text-muted)[INSTITUCIÓN EDUCATIVA:],
            text(size: 9.2pt, weight: "semibold", fill: primary)[CURZAS · Universidad Nacional del Comahue],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ESPACIO CURRICULAR:],
            text(size: 9.2pt, fill: text-main)[Tecnología de la Información para la Gestión (TIG)],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ACTIVIDAD:],
            text(size: 9.2pt, fill: text-main)[Actividad Práctica 5 · Organización Académica con Trello],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ESTUDIANTE / AUTOR:],
            text(size: 9.5pt, weight: "bold", fill: primary)[Hector Daniel Ayarachi Fuentes],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[FECHA DE PRESENTACIÓN:],
            text(size: 9.2pt, fill: text-main)[10 de Septiembre de 2026],
          )
        ],
      )
    ],
  )
]

// ==============================================================================
// 2. CONFIGURACIÓN DEL CUERPO (DESDE PÁGINA 2)
// ==============================================================================
#counter(page).update(1)

#set page(
  paper: "a4",
  margin: (x: 2cm, top: 2.3cm, bottom: 2.2cm),
  header: [
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 8pt, fill: rgb("#627d91"), weight: "semibold")[CURZAS · Tecnología de la Información para la Gestión],
      text(size: 8pt, fill: rgb("#627d91"))[Actividad 5 · Organización con Trello],
    )
    #v(-4pt)
    #line(length: 100%, stroke: 0.5pt + border-subtle)
  ],
  footer: [
    #line(length: 100%, stroke: 0.5pt + border-subtle)
    #v(-2pt)
    #grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      text(size: 8pt, fill: rgb("#627d91"))[Organización Académica con Trello],
      image("../../../Logotipo de curzas/CURZAS.png", height: 12pt),
      text(size: 8pt, fill: rgb("#627d91"))[
        #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
      ],
    )
  ],
)

// ==============================================================================
// ÍNDICE GENERAL
// ==============================================================================
#block(
  width: 100%,
  stroke: (bottom: 1.5pt + primary),
  inset: (bottom: 4pt),
  text(size: 14pt, fill: primary, weight: "bold")[Índice General],
)

#v(10pt)
#outline(
  title: none,
  indent: 1.5em,
)

#pagebreak()

// ==============================================================================
// 1. INTRODUCCIÓN Y CONTEXTUALIZACIÓN ACADÉMICA
// ==============================================================================
= 1. Introducción y Contextualización Académica

La gestión del tiempo y la organización de tareas en el ámbito universitario representan factores determinantes para el rendimiento académico y la reducción de la carga cognitiva en los estudiantes de educación superior. En la carrera de Administración y en el área de la gestión de tecnologías de la información, el manejo simultáneo de múltiples materias, guías de trabajos prácticos, investigaciones de campo y entregas en plataforma exige herramientas que trasciendan las agendas tradicionales en papel o los listados estáticos.

#callout([
  #text(weight: "bold", fill: primary)[Principios de la Metodología Kanban Aplicada a la Universidad:]
  - *Visibilidad Total:* Representación gráfica e inmediata del estado de todas las actividades académicas.
  - *Limitación del Trabajo en Proceso (WIP):* Reducción de la multitarea ineficiente focalizando el esfuerzo en tareas prioritarias.
  - *Gestión del Flujo (Flow Management):* Seguimiento continuo desde la recepción del requerimiento hasta la evaluación final.
  - *Colaboración Transparente y Debate:* Asignación clara de responsabilidades y participación activa en los foros de debate con compañeros.
])

En este marco, la herramienta **Trello** (basada en tarjetas y tableros visuales Kanban) se integra con el flujo metodológico de la cátedra *Tecnología de la Información para la Gestión (TIG)* del **CURZAS - Universidad Nacional del Comahue**. En esta materia, la producción documental sigue estándares profesionales de *Docs-as-Code* (documentación como código utilizando Typst, control de versiones y compilación automática desatendida). Por ello, el tablero Trello diseñado no se limita a un simple recordatorio de tareas, sino que constituye el **centro de comando y trazabilidad** de todas las actividades prácticas del cuatrimestre (Actividades 1 a 5).

// ==============================================================================
// 2. ARQUITECTURA Y DISEÑO DEL TABLERO DE TRELLO
// ==============================================================================
= 2. Arquitectura y Diseño del Tablero en Trello

El tablero principal ha sido denominado **"TIG - Gestión Académica & Ciclo de Consignas (CURZAS)"**, personalizado con un fondo sobrio e institucional para favorecer la concentración visual. La arquitectura del tablero está estructurada en **7 listas secuenciales** que representan fielmente las fases operativas de la vida académica del estudiante.

#v(6pt)

#figure(
  image("imagenes/trello_real_board.png", width: 100%),
  caption: [Captura en vivo del Tablero Kanban "TIG - Gestión Académica & Ciclo de Consignas (CURZAS)" en Trello con sus 7 listas operativas y las consignas de las Actividades 1 a 5 visiblemente integradas.],
)

#v(10pt)

== 2.1. Estructura de Listas del Flujo de Trabajo (Ciclo Real CURZAS)

#table(
  columns: (1.3fr, 1.7fr, 3fr),
  fill: (x, y) => if y == 0 { primary } else if calc.even(y) { bg-card } else { white },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  stroke: 0.4pt + border-subtle,
  
  text(weight: "bold", fill: white)[Lista / Estado],
  text(weight: "bold", fill: white)[Fase del Ciclo],
  text(weight: "bold", fill: white)[Descripción y Propósito Operativo],

  [00. 📚 Recursos, Plantillas & IA], [Base de Conocimiento], [Repositorio central de enlaces a entornos virtuales, modelos `.typ`, manual de estilo `AGENTS.md`, logo CURZAS y motor `auto_compilar_typst.py`.],
  [01. 📥 Consignas Recibidas], [Ingreso / Requerimiento], [Almacenamiento e inventariado de consignas asignadas por los profesores en soporte digital (`Actividades 1, 2, Asincrónica 3, 4 y 5`).],
  [02. 📋 Planificación & Análisis], [Backlog / Prioridad], [Desglose de tareas aceptadas con fechas límite asignadas, división entre integrantes de grupo y checklist inicial.],
  [03. ⚙️ En Desarrollo (Typst)], [Desarrollo Activo], [Fase de investigación, procesamiento de datos y redacción bajo el estándar *Docs-as-Code* con auto-compilación a PDF.],
  [04. 🔍 Revisión Exhaustiva & QA], [Control de Calidad — Revisión Humana], [Etapa 100% humana y manual: el responsable del trabajo revisa de forma íntegra y minuciosa el documento antes de cualquier entrega. Se analiza el cumplimiento de la consigna, la coherencia del contenido, el formato institucional (logo CURZAS, paginación `Página X de Y`, tipografía Arial/Segoe), la ortografía y las referencias bibliográficas. Si bien implica una lectura activa y meticulosa de todo el material, el proceso es ágil: la validación completa de un trabajo práctico toma aproximadamente *10 minutos*. En caso de detectarse observaciones, la tarjeta regresa a «03. En Desarrollo» para corrección antes de avanzar.],
  [05. 🚀 Entregado en Foro & Debate], [Publicación / Interacción], [Subida de informe PDF, link de Trello y video explicativo al foro de CURZAS, con participación activa y debate entre compañeros.],
  [06. ✅ Evaluado & Concluido], [Cierre / Feedback], [Archivo definitivo tras la corrección del docente, registro de notas obtenidas (Actividades 1 a 4 con 10/10) y comentarios de retroalimentación.],
)

== 2.2. Detalle de Consignas Recibidas e Inventariadas (Lista 01)

En la lista **`01. 📥 Consignas Recibidas (CURZAS)`** se registran y sintetizan las actividades prácticas correspondientes al programa de la materia:

#table(
  columns: (1.5fr, 4.5fr),
  fill: (x, y) => if y == 0 { teal-accent } else if calc.even(y) { bg-card } else { white },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  stroke: 0.4pt + border-subtle,
  
  text(weight: "bold", fill: white)[Tarjeta de Consigna],
  text(weight: "bold", fill: white)[Resumen del Propósito y Alcance Temático],

  [Consigna Actividad 1], [Diseño y evaluación de prompts estructurados aplicados a la ingeniería de contexto e Inteligencia Artificial Generativa para la gestión universitaria.],
  [Consigna Actividad 2], [Procesamiento automatizado de postulaciones, currículums vitae, cartas de intención y actas de inscripción en concursos de selección de personal.],
  [Consigna Actividad Asincrónica 3], [Construcción de un asistente virtual inteligente basado en reglamentos institucionales, resolución de consultas y automatización de actas de comité.],
  [Consigna Actividad 4], [Investigación y estudio comparativo entre el Observatorio de la Administración Pública del INAP (Nación) y la Secretaría de Modernización de la Ciudad de Neuquén.],
  [Consigna Actividad 5], [Diseño e implementación de un tablero Kanban visual con 7 fases operativas en Trello para organizar la vida universitaria y el ciclo de trabajos prácticos.],
)

== 2.3. Stack Tecnológico y Flujo Interno de Carpetas (Docs-as-Code)

Para la ejecución técnica de las actividades prácticas de TIG se utiliza un conjunto integrado de tecnologías modernas y una arquitectura de directorios estandarizada:

#table(
  columns: (1.5fr, 4.5fr),
  fill: (x, y) => if y == 0 { primary } else if calc.even(y) { bg-card } else { white },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  stroke: 0.4pt + border-subtle,
  
  text(weight: "bold", fill: white)[Tecnología / Herramienta],
  text(weight: "bold", fill: white)[Función y Aplicación en el Trabajo Práctico],

  [Typst (`.typ`)], [Sistema de maquetación tipográfica nativo para la generación directa e instantánea de informes académicos en PDF de alta calidad.],
  [Quarto (`.qmd`)], [Plataforma de publicación científica utilizada en actividades con entregas requeridas en Microsoft Word (`.docx`).],
  [Python & Auto-Compilador], [Motor de observación en segundo plano (`auto_compilar_typst.py`) que compila automáticamente al guardar (<kbd>Ctrl</kbd> + <kbd>S</kbd>) y resuelve bloqueos en Adobe/Word.],
  [Antigravity IDE & Agente IA], [Entorno de desarrollo asistido por IA configurado bajo las reglas institucionales `AGENTS.md` para maquetación e investigación.],
  [Trello & Git / GitHub], [Gestión de proyectos visuales con Kanban, control de versiones y trazabilidad completa del ciclo de vida académico.],
)

#v(6pt)

```text
Tecnologias de la informacion para la gestion/
├── Actividad - Propuesta/   # Insumos y consignas oficiales (Actividades 1 a 5)
├── Entregables/             # ÚNICA FUENTE DE LA VERDAD para versiones finales (.typ y .pdf)
├── Material/                # Documentación de lectura y referencia (solo lectura)
├── plantillas_pdf/          # Motores Typst y auto-compilador (auto_compilar_typst.py)
└── .agents/rules/AGENTS.md  # Reglas de maquetación y pautas institucionales CURZAS
```

== 2.4. Sistema de Etiquetas Cromáticas (Priorización y Clasificación)

Para gestionar la urgencia y el tipo de contenido de un solo vistazo, se configuró una taxonomía cromática estandarizada:

- 🔴 **Rojo (Prioridad Crítica / Urgente):** Vencimiento en menos de 48 horas o entregas parciales obligatorias.
- 🟡 **Amarillo (Prioridad Media):** Trabajos prácticos en fase regular de desarrollo.
- 🟢 **Verde (Entregado / Concluido):** Tareas subidas al foro o aprobadas.
- 🔵 **Azul (Docs-as-Code / Typst):** Tareas que involucran maquetación técnica o desarrollo de scripts en Python.
- 🟣 **Violeta (Trabajo Grupal / Colaborativo):** Actividades que requieren coordinación de integrantes.
- 🟠 **Naranja (Foro / Video Explicativo):** Tareas asociadas a la producción multimedia o participación activa en plataforma.

// ==============================================================================
// 3. SIMULACIÓN PRÁCTICA: CICLO DE VIDA DE LA ACTIVIDAD 5
// ==============================================================================
= 3. Simulación Práctica: Ciclo de Vida Completo de la Actividad 5

A modo de demostración directa de la operatividad del tablero, se presenta el seguimiento paso a paso de la tarjeta correspondiente a la presente entrega: **"Actividad 5: Organización Académica con Trello"**.

== 3.1. Detalle de la Tarjeta y Checklist Interactivas

#figure(
  image("imagenes/trello_card_actividad5.png", width: 85%),
  caption: [Detalle de la tarjeta "Actividad 5: Organización Académica con Trello (Hector Daniel Ayarachi Fuentes)" desplegada en la lista 05. Entregado en Foro & Debate Colaborativo, con la checklist completada al 100%, miembros asignados y adjuntos vinculados.],
)

#v(8pt)

#block(
  width: 100%,
  stroke: (left: 4pt + teal-accent, rest: 0.6pt + border-subtle),
  fill: bg-card,
  inset: 12pt,
  radius: (right: 4pt),
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      [
        #text(weight: "bold", size: 10.5pt, fill: primary)[TARJETA: Actividad 5 - Trello]\
        #text(size: 8.8pt, fill: text-muted)[Ubicación actual: 05. 🚀 Entregado en Foro & Debate]\
        #v(4pt)
        *Etiquetas:* #text(fill: rgb("#0284c7"))[■ Docs-as-Code & Typst] · #text(fill: rgb("#16a34a"))[■ Entregado en Foro]\
        *Asignados:* Hector Daniel Ayarachi Fuentes\
        *Fecha Límite:* 10 de Septiembre de 2026, 23:59hs
      ],
      [
        #text(weight: "bold", size: 9.5pt, fill: primary)[Adjuntos Vinculados:]\
        - `Actividad 5.docx` (Consigna oficial)
        - `Actividad 5 - Organizacion Academica Trello.typ`
        - `Actividad 5 - Organizacion Academica Trello.pdf`
        - `Actividad 5 - Video Explicativo Trello.mp4`
        - `voz_en_off_trello.mp3`
        - Link público al tablero Trello
      ]
    )
  ]
)

#v(8pt)

#callout([
  #text(weight: "bold", fill: primary)[Checklist Integrada de Avance ("Desarrollo Actividad 5"):]
  - [x] **Subtarea 1:** Consigna analizada y desglose de requerimientos realizado (`Actividad 5.docx`).
  - [x] **Subtarea 2:** Estructura del tablero Trello configurada (7 fases del ciclo académico e inventario de Actividades 1 a 5).
  - [x] **Subtarea 3:** Documento Typst maquetado y compilado a PDF bajo pautas institucionales.
  - [x] **Subtarea 4:** Guion técnico y locución de voz en off (IA) generados.
  - [x] **Subtarea 5:** Video explicativo Timelapse (720p) producido en formato MP4.
  - [x] **Subtarea 6:** Entrega en foro institucional CURZAS e interacción colaborativa con compañeros preparada.
], bg: "f4f9f9", border-color: "0e6873")

== 3.2. Representación Esquemática del Flujo Recibida $->$ Evaluada

```text
[ 01. Consignas Recibidas ]        ──► Lectura y descarga de Actividades 1 a 5
           │
           ▼
[ 02. Planificación & Análisis ]   ──► Asignación de tareas, etiquetas y checklist
           │
           ▼
[ 03. En Desarrollo (Typst) ]      ──► Redacción Docs-as-Code & auto-compilación PDF
           │
           ▼
[ 04. Revisión Exhaustiva & QA ]   ──► Revisión 100 % humana y manual (~10 min por TP)
           │                              Verifica consigna, formato, ortografía y biblio.
           │                              Si hay observaciones → regresa a 03. En Desarrollo
           │
           ▼
[ 05. Entregado en Foro & Debate ] ──► Publicación de PDF, video, voz en off y debate con compañeros
           │
           ▼
[ 06. Evaluado & Concluido ]       ──► Corrección docente, registro de nota (10/10) y archivado
```

// ==============================================================================
// 4. RESPUESTAS A LAS PREGUNTAS DE REFLEXIÓN DEL FORO
// ==============================================================================
= 4. Respuestas a las Preguntas de Reflexión del Foro

De acuerdo con lo solicitado explícitamente en la consigna del Trabajo Práctico, se presenta la síntesis de la experiencia del grupo en la adopción e implementación de Trello:

== 4.1. ¿Qué utilidad le encuentran a esta herramienta para la organización académica o profesional?

1. **Claridad Cognitiva y Reducción del Estrés:** Al trasladar todos los compromisos académicos a un soporte visual estructurado, se elimina la incertidumbre respecto a plazos o tareas pendientes, permitiendo al estudiante focalizarse en la ejecución.
2. **Trazabilidad de Proyectos Complejos:** La posibilidad de descomponer trabajos de investigación en subtareas mediante *checklists* permite medir el progreso porcentual real de cada trabajo práctico en lugar de percibirlo como un bloque inabarcable.
3. **Transferibilidad Profesional:** La metodología Kanban utilizada en Trello es exactamente el estándar utilizado en empresas de tecnología, administración pública y gestión de proyectos bajo metodologías ágiles (Scrum/Kanban), lo que prepara al alumno para el entorno laboral real.

== 4.2. ¿Qué dificultades tuvieron en el uso de Trello o en la coordinación del grupo?

1. **Mantener la Disciplina de Actualización:** La principal dificultad en los primeros días radicó en la necesidad de que todos los integrantes del grupo mantuvieran las tarjetas al día. Si un miembro avanza en una tarea pero no desplaza la tarjeta en Trello, el tablero pierde fidelidad.
2. **Definición Uniforme de Criterios:** Acordar el nivel de detalle de las tareas requeridas exigió una reunión inicial para no saturar el tablero con tarjetas triviales ni concentrar demasiado trabajo en una sola tarjeta gigante.

== 4.3. ¿Qué sugerencias pueden aportar para mejorar la aplicación de esta herramienta en el ámbito universitario?

1. **Plantillas Institucionales Preconfiguradas:** Que la universidad o la cátedra provea al inicio del cuatrimestre una plantilla de tablero Trello con el calendario oficial de exámenes y entregas ya precargado.
2. **Integración con Entornos Virtuales (Moodle / UNCo):** Promover el uso de *Power-Ups* o automatizaciones que vinculen la publicación de tareas en el campus con la creación automática de tarjetas en las cuentas de los estudiantes.

// ==============================================================================
// 5. GUION PARA EL VIDEO EXPLICATIVO / PRESENTACIÓN DEL FORO
// ==============================================================================
= 5. Guion Estructurado para el Video Explicativo (Foro)

Para cumplir con la modalidad opcional/recomendada del foro, se diseñó la siguiente estructura narrativa para el video de presentación del grupo en formato *timelapse* con voz en off sintética (IA):

#table(
  columns: (1fr, 1.5fr, 3.5fr),
  fill: (x, y) => if y == 0 { primary } else if calc.even(y) { bg-card } else { white },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  stroke: 0.4pt + border-subtle,
  
  text(weight: "bold", fill: white)[Tiempo],
  text(weight: "bold", fill: white)[Bloque del Video],
  text(weight: "bold", fill: white)[Contenido Narrativo y Pantalla Mostrada],

  [0:00 - 0:30], [1. Integrantes e Intro], [Presentación de los miembros del grupo, carrera (*Tecnología de la Información para la Gestión - CURZAS*) y objetivo de la presentación.],
  [0:30 - 1:15], [2. El Problema Afrontado], [Explicación de la dispersión de tareas universitarias y la necesidad de gestionar el ciclo de vida de las consignas 1 a 5 de manera ordenada.],
  [1:15 - 2:30], [3. Demostración Trello], [Recorrido en vivo por las 7 listas del tablero, mostrando el inventario de consignas, el stack tecnológico (Typst, Quarto, Python), la etapa de Revisión Exhaustiva (QA), publicación en foro y debate colaborativo.],
  [2:30 - 3:00], [4. Conclusión y Valor], [Reflexión sobre el impacto de Kanban en la vida universitaria y profesional. Registro de calificaciones y cierre.],
)

// ==============================================================================
// 6. ENLACE DE ACCESO PÚBLICO Y VERIFICACIÓN
// ==============================================================================
= 6. Enlace de Acceso Público y Verificación

#nota([
  *Acceso al Tablero Trello en Vivo:*
  El tablero correspondiente a esta entrega ha sido configurado con permisos de visualización pública en el siguiente enlace:
  #v(3pt)
  #text(weight: "bold", fill: teal-accent)[🔗 https://trello.com/b/wFIZ6b5N/tig-gestion-academica-ciclo-de-consignas-curzas]
  #v(3pt)
  *(Nota: El enlace permite el acceso directo sin restricciones de inicio de sesión para el equipo docente).*
])

#v(20pt)

#align(center)[
  #text(size: 9pt, fill: text-muted, style: "italic")[
    Documento elaborado y maquetado bajo estándares Docs-as-Code en Typst · CURZAS - Universidad Nacional del Comahue (2026)
  ]
]
