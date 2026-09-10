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
            Diseñar e implementar un sistema de gestión visual y colaborativa en Trello adaptado a la vida universitaria y, de manera específica, al ciclo de vida integral de las actividades prácticas de la materia *Tecnología de la Información para la Gestión (TIG)* en CURZAS - UNCo. Se modela el flujo de trabajo completo desde la recepción de consignas en soporte digital hasta la redacción automatizada bajo el paradigma *Docs-as-Code*, la compilación a PDF, la publicación en foros institucionales y la retroalimentación docente.
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

#v(8pt)
#outline(
  title: none,
  indent: 1.5em,
)
#v(16pt)

// ==============================================================================
// 1. INTRODUCCIÓN Y CONTEXTUALIZACIÓN ACADÉMICA
// ==============================================================================
= 1. Introducción y Contextualización Académica

La gestión del tiempo y la organización de tareas en el ámbito universitario representan factores determinantes para el rendimiento académico y la reducción de la carga cognitiva en los estudiantes de educación superior. En la carrera de Administración y en el área de la gestión de tecnologías de la información, el manejo simultáneo de múltiples materias, guías de trabajos prácticos, investigaciones de campo y entregas en plataforma exige herramientas que trasciendan las agendas tradicionales en papel o los listados estáticos.

#callout([
  #text(weight: "bold", fill: primary)[Principios de la Metodología Kanban Aplicada a la Universidad:]
  - *Visibilidad Total:* Representación gráfica e inmediata del estado de todas las actividades académicas.
  - *Limitación del Trabajo en Proceso (WIP):* Reducción de la multitarea ineficiente focalizando el esfuerzo en tareas prioritarias.
  - *Gestión del Flujo (Flow Management):* Seguimiento continuo desde la recepción del requerimiento hasta la entrega evaluada.
  - *Colaboración Transparente:* Asignación clara de responsabilidades en trabajos grupales y comunicación centralizada.
])

En este marco, la herramienta **Trello** (basada en tarjetas y tableros visuales Kanban) se integra con el flujo metodológico de la cátedra *Tecnología de la Información para la Gestión (TIG)* del **CURZAS - Universidad Nacional del Comahue**. En esta materia, la producción documental sigue estándares profesionales de *Docs-as-Code* (documentación como código utilizando Typst, control de versiones y compilación automática desatendida). Por ello, el tablero Trello diseñado no se limita a un simple recordatorio de tareas, sino que constituye el **centro de comando y trazabilidad** de todas las actividades prácticas del cuatrimestre.

// ==============================================================================
// 2. ARQUITECTURA Y DISEÑO DEL TABLERO DE TRELLO
// ==============================================================================
= 2. Arquitectura y Diseño del Tablero en Trello

El tablero principal ha sido denominado **"TIG - Gestión Académica & Ciclo de Consignas (CURZAS)"**, personalizado con un fondo sobrio e institucional para favorecer la concentración visual. La arquitectura del tablero está estructurada en **7 listas secuenciales** que representan fielmente las fases operativas de la vida académica del estudiante.

#v(6pt)

#figure(
  image("imagenes/trello_real_board.png", width: 100%),
  caption: [Captura real del Tablero Kanban "TIG - Gestión Académica & Ciclo de Consignas (CURZAS)" confeccionado en Trello en vivo.],
)

#v(10pt)

== 2.1. Estructura de Listas del Flujo de Trabajo

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { primary } else if calc.even(y) { bg-card } else { white },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  stroke: 0.4pt + border-subtle,
  
  text(weight: "bold", fill: white)[Lista / Estado],
  text(weight: "bold", fill: white)[Fase del Ciclo],
  text(weight: "bold", fill: white)[Descripción y Propósito Operativo],

  [00. 📚 Recursos e Ideas], [Base de Conocimiento], [Repositorio central de enlaces a entornos virtuales, modelos `.typ`, manual de estilo `AGENTS.md` y accesos a asistentes de IA.],
  [01. 📥 Consignas Recibidas], [Ingreso / Requerimiento], [Almacenamiento e inspección de trabajos prácticos asignados por los profesores en formato `.docx` o `.pdf` (ej: `Actividad 5.docx`).],
  [02. 📋 Por Realizar (Backlog)], [Planificación / Prioridad], [Desglose de tareas aceptadas con fechas límite asignadas, división entre integrantes de grupo y checklist inicial.],
  [03. ⚙️ En Proceso (Typst)], [Desarrollo Activo], [Fase de investigación, procesamiento de datos y redacción bajo el estándar *Docs-as-Code* con auto-compilación a PDF.],
  [04. 🔍 En Revisión & QA], [Control de Calidad], [Verificación cruzada de consignas, formato institucional (logo CURZAS, paginación `Página X de Y`), ortografía y biblio.],
  [05. 🚀 Entregado en Foro], [Publicación / Entrega], [Subida de archivos PDF/Word, generación de enlace público de Trello y video explicativo grabado para el foro virtual.],
  [06. ✅ Evaluado & Concluido], [Cierre / Feedback], [Archivo definitivo tras la corrección del docente, registro de notas obtenidas y comentarios de retroalimentación.],
)

== 2.2. Sistema de Etiquetas Cromáticas (Priorización y Clasificación)

Para gestionar la urgencia y el tipo de contenido de un solo vistazo, se configuró una taxonomía cromática estandarizada:

- 🔴 **Rojo (Prioridad Crítica / Urgente):** Vencimiento en menos de 48 horas o entregas parciales obligatorias.
- 🟡 **Amarillo (Prioridad Media):** Trabajos prácticos en fase regular de desarrollo.
- 🟢 **Verde (Finalizado / Aprobado):** Tareas completadas satisfactoriamente y respaldadas.
- 🔵 **Azul (Docs-as-Code / Typst):** Tareas que involucran maquetación técnica o desarrollo de scripts en Python.
- 🟣 **Violeta (Trabajo Grupal / Colaborativo):** Actividades que requieren coordinación de 3-4 integrantes.
- 🟠 **Naranja (Foro / Video Explicativo):** Tareas asociadas a la producción multimedia o participación activa en plataforma.

== 2.3. Gestión de Miembros, Colaboración y Notificaciones

Con el fin de fomentar la colaboración efectiva entre los participantes del grupo de trabajo:
1. **Asignación de Miembros:** Cada tarjeta posee responsables asignados explícitamente (`@hectordanielayarachifuentes`), garantizando el compromiso sobre entregables específicos.
2. **Comentarios y Menciones:** Utilización de comentarios en tarjetas para debates técnicos, links a borradores y menciones directas para resolver bloqueos de redacción.
3. **Fechas de Vencimiento y Alertas:** Configuración de fechas límites (Due Dates) sincronizadas con recordatorios automáticos de Trello enviando notificaciones push 24 horas antes del cierre de entregas.

// ==============================================================================
// 3. SIMULACIÓN PRÁCTICA: CICLO DE VIDA DE LA ACTIVIDAD 5
// ==============================================================================
= 3. Simulación Práctica: Ciclo de Vida Completo de la Actividad 5

A modo de demostración directa de la operatividad del tablero, se presenta el seguimiento paso a paso de la tarjeta correspondiente a la presente entrega: **"Actividad 5: Organización Académica con Trello"**.

== 3.1. Detalle de la Tarjeta y Checklist Interactivas

#figure(
  image("imagenes/trello_card_actividad5.jpg", width: 85%),
  caption: [Detalle de la tarjeta "Actividad 5: Organización Académica con Trello" desplegada en la lista 05. Entregado en Foro, con la checklist completada al 100%, miembros asignados y adjuntos vinculados.],
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
        #text(size: 8.8pt, fill: text-muted)[Ubicación actual: 05. 🚀 Entregado en Foro]\
        #v(4pt)
        *Etiquetas:* #text(fill: rgb("#b91c1c"))[■ Urgente] · #text(fill: rgb("#0284c7"))[■ Typst] · #text(fill: rgb("#7c3aed"))[■ Grupal]\
        *Asignados:* Hector Daniel Ayarachi Fuentes y Grupo\
        *Fecha Límite:* 10 de Septiembre de 2026, 23:59hs
      ],
      [
        #text(weight: "bold", size: 9.5pt, fill: primary)[Adjuntos Vinculados:]\
        - `Actividad 5.docx` (Consigna oficial)
        - `Actividad 5 - Organizacion Academica Trello.typ`
        - `Actividad 5 - Organizacion Academica Trello.pdf`
        - Link público al tablero Trello
      ]
    )
  ]
)

#v(8pt)

#callout([
  #text(weight: "bold", fill: primary)[Checklist Integrada de Avance ("Desarrollo Actividad 5"):]
  - [x] **Subtarea 1:** Descargar y examinar la consigna oficial `Actividad 5.docx`.
  - [x] **Subtarea 2:** Diseñar el flujo Kanban de 7 listas en el tablero de Trello.
  - [x] **Subtarea 3:** Configurar etiquetas cromáticas, miembros y fechas de vencimiento.
  - [x] **Subtarea 4:** Redactar el informe académico oficial en formato Typst (`.typ`).
  - [x] **Subtarea 5:** Compilar automáticamente el documento a PDF bajo pautas de `AGENTS.md`.
  - [x] **Subtarea 6:** Elaborar el guion detallado para la presentación en video del grupo.
  - [x] **Subtarea 7:** Publicar el hilo oficial en el foro de CURZAS con informe, link y video.
], bg: "f4f9f9", border-color: "0e6873")

== 3.2. Representación Esquemática del Flujo Recibida $->$ Evaluada

```text
[ 01. Consignas Recibidas ] ──► Lectura de Actividad 5.docx
           │
           ▼
[ 02. Por Realizar ]        ──► Creación de tarjeta, etiquetas y checklist
           │
           ▼
[ 03. En Proceso (Typst) ]  ──► Edición Docs-as-Code & auto-compilación PDF
           │
           ▼
[ 04. En Revisión & QA ]    ──► Control de logo CURZAS, pautas y ortografía
           │
           ▼
[ 05. Entregado en Foro ]   ──► Publicación de PDF, Enlace Trello y Video
           │
           ▼
[ 06. Evaluado & Concluido] ──► Devolución docente y registro de nota
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
  [0:30 - 1:15], [2. El Problema Afrontado], [Explicación de la dispersión de tareas universitarias y la necesidad de gestionar el ciclo de vida de los trabajos prácticos de manera ordenada.],
  [1:15 - 2:30], [3. Demostración Trello], [Recorrido en vivo por las 7 listas del tablero, mostrando la tarjeta de la *Actividad 5*, uso de etiquetas, subtareas y adjuntos.],
  [2:30 - 3:00], [4. Conclusión y Valor], [Reflexión sobre el impacto de Kanban en la vida universitaria y profesional. Agradecimiento y cierre.],
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
