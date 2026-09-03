// ==========================================
// CONFIGURACIÓN DE DOCUMENTO Y ESTILOS
// ==========================================
#set document(
  title: "Nueve desafíos con un cuaderno de fuentes",
  author: "Hector Daniel Ayarachi Fuentes",
)

#set text(font: "Arial", size: 9.8pt, fill: rgb("#1f2933"), lang: "es")
#set par(justify: true, leading: 0.7em)

// Paleta de colores institucional
#let primary = rgb("#153e5c")       // Azul petróleo institucional
#let teal-accent = rgb("#176b67")   // Verde azulado
#let orange-accent = rgb("#c1741f") // Naranja terracota
#let text-main = rgb("#1f2933")     // Texto principal
#let text-muted = rgb("#4b6575")    // Texto secundario
#let border-subtle = rgb("#b7c9d6") // Borde suave
#let bg-card = rgb("#fdf6ee")       // Fondo cálido para destacados

// Componentes de Estilo
#let h1(body) = text(size: 20pt, fill: primary, weight: "bold", block(below: 8pt, body))
#let h2(body) = block(
  above: 20pt,
  below: 10pt,
  stroke: (bottom: 1.2pt + border-subtle),
  inset: (bottom: 4pt),
  text(size: 13pt, fill: primary, weight: "bold", body),
)
#let h3(body) = block(above: 12pt, below: 5pt, text(size: 10.5pt, fill: rgb("#28536b"), weight: "bold", body))

#let callout(body, bg, border-color, left-border-color) = block(
  width: 100%,
  fill: rgb(bg),
  stroke: (
    top: 0.8pt + rgb(border-color),
    right: 0.8pt + rgb(border-color),
    bottom: 0.8pt + rgb(border-color),
    left: 4.5pt + rgb(left-border-color),
  ),
  inset: (x: 11pt, y: 9pt),
  radius: (right: 4pt),
  above: 10pt,
  below: 12pt,
  body,
)

#let summary(body) = callout(body, "fdf6ee", "b7c9d6", "c1741f")
#let consigna-box(body) = callout(body, "f0f6fa", "b7c9d6", "153e5c")

#let nota(body) = block(
  width: 100%,
  fill: rgb("eef6f4"),
  stroke: (left: 4pt + teal-accent),
  inset: (x: 10pt, y: 8pt),
  radius: (right: 4pt),
  above: 9pt,
  below: 11pt,
  text(size: 9.2pt, body),
)

#let paso(n, t) = block(
  width: 100%,
  fill: primary,
  inset: (top: 6pt, bottom: 6pt, left: 10pt, right: 10pt),
  radius: 4pt,
  above: 18pt,
  below: 9pt,
  [
    #text(fill: white.darken(15%), size: 8pt, tracking: 0.12em, weight: "bold", upper(n))\
    #v(-3pt)
    #text(fill: white, size: 11.5pt, weight: "bold", t)
  ],
)

// Formato de celdas de tablas
#show table.cell: set par(justify: false, leading: 0.5em)
#show table.cell: set text(size: 8.8pt)

// ==========================================
// 1. CARÁTULA PRINCIPAL
// ==========================================
#page(
  paper: "a4",
  margin: (x: 2cm, top: 2.5cm, bottom: 2.2cm),
  header: none,
  footer: none,
)[
  #grid(
    columns: (12pt, 1fr),
    gutter: 20pt,
    [
      #rect(
        width: 100%,
        height: 94%,
        fill: teal-accent,
        radius: 2pt,
      )
    ],
    [
      #v(10pt)
      // Logotipo institucional destacado en carátula
      #image("/Logotipo de curzas/CURZAS.png", width: 130pt)
      
      #v(15pt)
      // Barra superior naranja
      #rect(
        width: 100%,
        height: 4.5pt,
        fill: orange-accent,
        radius: 1pt,
      )
      
      #v(22pt)
      
      // Título Principal
      #text(size: 20pt, weight: "bold", fill: primary)[
        NUEVE DESAFÍOS CON UN CUADERNO DE FUENTES
      ]
      
      #v(10pt)
      
      // Subtítulo
      #text(size: 13pt, fill: text-muted, style: "italic")[
        Actividad Asincrónica 2
      ]
      
      #v(30pt)
      
      // Cuadro de Propósito
      #block(
        width: 100%,
        fill: bg-card,
        stroke: (left: 4.5pt + orange-accent, rest: 0.6pt + border-subtle),
        inset: (x: 14pt, y: 12pt),
        radius: (right: 4pt),
        [
          #text(weight: "bold", fill: orange-accent, size: 9pt, tracking: 0.08em)[PROPÓSITO DE LA ACTIVIDAD]\
          #v(4pt)
          #text(size: 9.3pt, fill: text-main)[
            Aprender a manejar un cuaderno de IA sobre documentación de trabajo, y comprobar cada resultado mediante nueve desafíos independientes que utilizan como base documentos de recursos humanos ficticios de la Municipalidad de Puerto Norte.
          ]
        ],
      )
      
      #v(90pt)
      
      // Metadatos inferiores
      #block(
        width: 100%,
        stroke: (top: 0.6pt + border-subtle),
        inset: (top: 18pt),
        [
          #grid(
            columns: (160pt, 1fr),
            row-gutter: 14pt,
            text(size: 9pt, weight: "bold", fill: text-muted)[ESTUDIANTE / EXPERIMENTADOR:],
            text(size: 9.5pt, weight: "semibold", fill: primary)[Hector Daniel Ayarachi Fuentes],
            
            text(size: 9pt, weight: "bold", fill: text-muted)[FECHA DE ENTREGA:],
            text(size: 9.2pt, fill: text-main)[20 de Agosto de 2026],
            
            text(size: 9pt, weight: "bold", fill: text-muted)[MATERIA / CONTEXTO:],
            text(size: 9.2pt, fill: text-main)[Tecnología de la Información para la Gestión],
          )
        ],
      )
    ],
  )
]

// ==========================================
// 2. CUERPO DEL INFORME Y DESARROLLO
// ==========================================
#counter(page).update(1)

#set page(
  paper: "a4",
  margin: (x: 2cm, top: 2.2cm, bottom: 2.2cm),
  header: [
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 8pt, fill: rgb("7d919f"))[Tecnología de la Información para la Gestión · CURZAS],
      text(size: 8pt, fill: rgb("7d919f"))[Actividad Asincrónica 2 · Cuaderno de Fuentes],
    )
    #v(-4pt)
    #line(length: 100%, stroke: 0.4pt + rgb("b7c9d6"))
  ],
  footer: [
    #line(length: 100%, stroke: 0.4pt + rgb("b7c9d6"))
    #v(-2pt)
    #grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      text(size: 8pt, fill: rgb("7d919f"))[Informe de Resolución de Desafíos],
      image("/Logotipo de curzas/CURZAS.png", height: 13pt),
      text(size: 8pt, fill: rgb("7d919f"))[
        #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
      ],
    )
  ],
)

#h1[Nueve Desafíos con un Cuaderno de Fuentes]
#text(size: 11pt, fill: text-muted)[Resolución de los ejercicios de auditoría y análisis documental]

#v(8pt)

#summary[
  *Resumen del Proceso:* Se detallan a continuación los resultados obtenidos tras someter el corpus documental (reglamento, acta, manual, certificado, resolución escaneada y registro de inscripciones) a distintas consultas y procesamientos mediante NotebookLM. El objetivo principal fue verificar la precisión, trazabilidad e integridad de las respuestas dadas por la IA sobre una base de datos específica.
]

#v(6pt)
#h2[Desarrollo Metodológico: Paso a Paso]

// ==========================================
// DESAFÍO 1
// ==========================================
#paso("Desafío 1", "Armar el cuaderno y mirar qué entró")

#consigna-box[
  *Objetivo:* Cargar los cinco documentos principales (`reglamento-capacitacion.pdf`, `manual-inscripciones.pdf`, `acta-comite-2026-08-04.pdf`, `registro-capacitaciones.csv` y `certificado-sandoval.png`) y verificar qué extrajo el sistema de ellos.
]

*Resultado de la verificación:*
- Al revisar el reglamento, se pudo observar que la IA extrajo correctamente el texto completo, incluyendo sus artículos del 1 al 15.
- Al revisar `certificado-sandoval.png`, el contenido extraído fue incompleto. El sistema no logró detectar la carga horaria porque la imagen adjunta está cortada horizontalmente en su mitad inferior, revelando una limitación que afectará respuestas futuras si no se tiene en cuenta este defecto documental.

// ==========================================
// DESAFÍO 2
// ==========================================
#paso("Desafío 2", "La fuente que engaña")

#consigna-box[
  *Objetivo:* Evaluar el comportamiento del sistema al procesar `resolucion-214-escaneada.pdf` pidiéndole el monto asignado y la partida.
]