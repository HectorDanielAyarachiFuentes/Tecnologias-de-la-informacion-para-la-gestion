// ==========================================
// PLANTILLA 3: CURZAS CLÁSICA (Universitaria & Formal)
// ==========================================

#let primary = rgb("#7f1d1d")       // Borgoña universitario
#let accent = rgb("#b45309")        // Bronce dorado
#let text-main = rgb("#1c1917")     // Sepia oscuro
#let text-muted = rgb("#57534e")    // Gris cálido
#let bg-card = rgb("#fffbeb")       // Crema sutil tradicional
#let border-subtle = rgb("#fde68a") // Bordes dorados suaves

// Componente Callout
#let callout(title, body) = [
  #v(5pt)
  #block(
    width: 100%,
    fill: bg-card,
    stroke: (left: 3pt + primary, rest: 0.5pt + border-subtle),
    inset: (x: 12pt, y: 9pt),
    radius: (right: 3pt),
    [
      #text(weight: "bold", fill: primary, size: 8.5pt, tracking: 0.08em)[#upper(str(title))] \
      #v(3pt)
      #text(size: 9.2pt, fill: text-main)[#body]
    ]
  )
  #v(5pt)
]

// Componente Diálogo
#let dialogue(user_role, body) = [
  #v(2.5pt)
  #block(
    width: 100%,
    fill: rgb("#fafaf9"),
    stroke: 0.5pt + rgb("#e7e5e4"),
    inset: (x: 9pt, y: 6.5pt),
    radius: 3pt,
    [
      #text(weight: "bold", fill: primary, size: 8.8pt)[#user_role:]
      #h(4pt)
      #text(size: 9pt, fill: text-main)[#body]
    ]
  )
  #v(2.5pt)
]

// Componente Código CSV / Prompt
#let code_box(title, content_str) = [
  #v(4pt)
  #block(
    width: 100%,
    fill: rgb("#27272a"),
    stroke: 0.5pt + rgb("#3f3f46"),
    inset: (x: 9pt, y: 8pt),
    radius: 4pt,
    [
      #if title != "" [
        #text(weight: "bold", fill: accent, size: 7.5pt)[#upper(str(title))] \
        #v(3pt)
      ]
      #set text(font: "Consolas", size: 6.2pt, fill: rgb("#fafafa"))
      #set par(leading: 0.48em, justify: false)
      #raw(content_str, block: true)
    ]
  )
  #v(4pt)
]

// Función Principal del Documento
#let reporte_clasico(
  titulo: "TÍTULO DEL INFORME",
  subtitulo: "Subtítulo o Descripción General",
  proposito: "",
  materia: "Tecnología de la Información para la Gestión",
  institucion: "COMPLEJO UNIVERSITARIO REGIONAL ZONA ATLÁNTICA Y SUR (CURZAS)",
  estudiantes: ("Estudiante 1", "Estudiante 2"),
  fecha: "14 de Agosto de 2026",
  body
) = {
  set document(title: titulo, author: estudiantes)
  set text(font: "Georgia", fallback: true, size: 9.8pt, fill: text-main, lang: "es")
  set par(justify: true, leading: 0.7em)

  show heading.where(level: 1): it => [
    #v(14pt)
    #line(length: 100%, stroke: 0.8pt + primary)
    #v(3pt)
    #text(weight: "bold", size: 12pt, fill: primary)[#upper(it.body)]
    #v(3pt)
    #line(length: 100%, stroke: 0.4pt + accent)
    #v(6pt)
  ]

  show heading.where(level: 2): it => [
    #v(9pt)
    #text(weight: "bold", size: 10.2pt, fill: primary)[#it.body]
    #v(4pt)
  ]

  show heading.where(level: 3): it => [
    #v(6pt)
    #text(weight: "semibold", size: 9.3pt, fill: accent)[#it.body]
    #v(3pt)
  ]

  // Portada Clásica
  page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3.2cm, bottom: 2.5cm),
    header: none,
    footer: none
  )[
    #align(center)[
      #text(size: 12pt, weight: "bold", fill: primary, tracking: 0.08em)[#upper(str(materia))] \
      #v(3pt)
      #text(size: 9.5pt, weight: "regular", fill: text-muted)[#upper(str(institucion))]
      
      #v(15pt)
      #line(length: 60%, stroke: 1pt + primary)
      #v(40pt)
      
      #text(size: 22pt, weight: "bold", fill: primary)[#titulo] \
      #v(10pt)
      #text(size: 13pt, fill: text-muted)[#subtitulo]
      
      #v(35pt)
      
      #if proposito != "" [
        #align(left)[#callout("PROPÓSITO DE LA ACTIVIDAD")[#proposito]]
      ]
      
      #v(35pt)
      
      #rect(
        width: 90%,
        fill: bg-card,
        stroke: 0.6pt + border-subtle,
        radius: 4pt,
        inset: (x: 16pt, y: 14pt)
      )[
        #align(left)[
          #grid(
            columns: (160pt, 1fr),
            row-gutter: 11pt,
            text(size: 8.8pt, weight: "bold", fill: primary)[ESTUDIANTE(S)],
            text(size: 9.2pt, weight: "semibold", fill: text-main)[#estudiantes.join("\n")],
            
            text(size: 8.8pt, weight: "bold", fill: primary)[FECHA DE ENTREGA],
            text(size: 9.2pt, fill: text-main)[#fecha],
            
            text(size: 8.8pt, weight: "bold", fill: primary)[MATERIA / CONTEXTO],
            text(size: 9.2pt, fill: text-main)[#materia]
          )
        ]
      ]
      
      #align(bottom + center)[
        #text(size: 8.5pt, fill: text-muted)[Viedma, Río Negro — República Argentina]
      ]
    ]
  ]

  counter(page).update(1)

  set page(
    paper: "a4",
    margin: (x: 2.3cm, top: 2.4cm, bottom: 2.4cm),
    header: [
      #grid(
        columns: (1fr, auto),
        text(size: 8.5pt, fill: text-muted)[#titulo],
        text(size: 8.5pt, fill: primary, weight: "bold")[UNCo · CURZAS]
      )
      #v(3pt)
      #line(length: 100%, stroke: 0.5pt + primary)
    ],
    footer: [
      #line(length: 100%, stroke: 0.4pt + border-subtle)
      #v(3pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        text(size: 8.5pt, fill: text-muted)[#materia],
        text(size: 8.5pt, fill: text-muted)[
          #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
        ]
      )
    ]
  )

  body
}
