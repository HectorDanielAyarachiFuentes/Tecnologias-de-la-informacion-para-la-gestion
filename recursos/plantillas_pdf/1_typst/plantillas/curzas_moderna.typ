// ==========================================
// PLANTILLA 2: CURZAS MODERNA (Tech Teal & Charcoal)
// ==========================================

#let primary = rgb("#0f766e")       // Teal profundo
#let accent = rgb("#0284c7")        // Azul cian vibrante
#let text-main = rgb("#111827")     // Gris noche
#let text-muted = rgb("#4b5563")    // Gris intermedio
#let bg-card = rgb("#f0fdf4")       // Menta suave premium
#let border-subtle = rgb("#ccfbf1") // Bordes cian suaves

// Componente Callout
#let callout(title, body) = [
  #v(5pt)
  #block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: (left: 3.5pt + primary, rest: 0.5pt + rgb("#e2e8f0")),
    inset: (x: 12pt, y: 9pt),
    radius: (right: 6pt),
    [
      #text(weight: "bold", fill: primary, size: 8.5pt, tracking: 0.06em)[⚡ #upper(str(title))] \
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
    fill: rgb("#f1f5f9"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: (x: 9pt, y: 6.5pt),
    radius: 5pt,
    [
      #box(
        fill: if user_role == "Usuario" { rgb("#e0f2fe") } else { rgb("#ccfbf1") },
        inset: (x: 5pt, y: 2pt),
        radius: 3pt,
        text(weight: "bold", fill: primary, size: 8pt)[#user_role]
      )
      #h(6pt)
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
    fill: rgb("#0f172a"),
    stroke: 0.5pt + rgb("#334155"),
    inset: (x: 10pt, y: 9pt),
    radius: 6pt,
    [
      #if title != "" [
        #text(weight: "bold", fill: rgb("#38bdf8"), size: 7.5pt)[#upper(str(title))] \
        #v(3pt)
      ]
      #set text(font: "Consolas", size: 6.2pt, fill: rgb("#f1f5f9"))
      #set par(leading: 0.48em, justify: false)
      #raw(content_str, block: true)
    ]
  )
  #v(4pt)
]

// Función Principal del Documento
#let reporte_moderno(
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
  set text(font: "Roboto", fallback: true, size: 9.8pt, fill: text-main, lang: "es")
  set par(justify: true, leading: 0.65em)

  show heading.where(level: 1): it => [
    #v(14pt)
    #box(
      fill: rgb("#ccfbf1"),
      inset: (x: 8pt, y: 4pt),
      radius: 4pt,
      text(weight: "bold", size: 11pt, fill: primary)[#it.body]
    )
    #v(6pt)
  ]

  show heading.where(level: 2): it => [
    #v(9pt)
    #text(weight: "bold", size: 10pt, fill: accent)[#it.body]
    #v(4pt)
  ]

  show heading.where(level: 3): it => [
    #v(6pt)
    #text(weight: "semibold", size: 9.2pt, fill: primary)[#it.body]
    #v(3pt)
  ]

  // Portada
  page(
    paper: "a4",
    margin: (x: 2.4cm, top: 3.2cm, bottom: 2.5cm),
    header: none,
    footer: none
  )[
    #text(size: 11pt, weight: "bold", fill: primary)[#upper(str(materia))] \
    #v(2pt)
    #text(size: 9.5pt, weight: "medium", fill: text-muted)[#institucion]
    
    #v(10pt)
    #line(length: 100%, stroke: 1.5pt + primary)
    #v(30pt)
    
    #box(
      fill: rgb("#0f766e"),
      inset: (x: 9pt, y: 4pt),
      radius: 12pt,
      text(size: 8pt, weight: "bold", fill: white, tracking: 0.08em)[PLANTILLA MODERNA · TEAL TECH]
    )
    
    #v(16pt)
    
    #block(width: 100%)[
      #set par(justify: false)
      #text(size: 23pt, weight: "bold", fill: primary)[#titulo]
    ]
    
    #v(8pt)
    #text(size: 12.5pt, fill: text-muted, weight: "regular")[#subtitulo]
    
    #v(25pt)
    
    #if proposito != "" [
      #callout("PROPÓSITO DE LA ACTIVIDAD")[#proposito]
    ]
    
    #v(25pt)
    
    #rect(
      width: 100%,
      fill: rgb("#f8fafc"),
      stroke: 0.8pt + rgb("#cbd5e1"),
      radius: 8pt,
      inset: (x: 16pt, y: 14pt)
    )[
      #grid(
        columns: (175pt, 1fr),
        row-gutter: 11pt,
        text(size: 8.8pt, weight: "bold", fill: primary)[ESTUDIANTE(S)],
        text(size: 9.2pt, weight: "semibold", fill: text-main)[#estudiantes.join("\n")],
        
        text(size: 8.8pt, weight: "bold", fill: primary)[FECHA DE ENTREGA],
        text(size: 9.2pt, fill: text-main)[#fecha],
        
        text(size: 8.8pt, weight: "bold", fill: primary)[MATERIA / CONTEXTO],
        text(size: 9.2pt, fill: text-main)[#materia]
      )
    ]
    
    #align(bottom + center)[
      #text(size: 8.5pt, fill: text-muted)[Viedma, Río Negro — República Argentina]
    ]
  ]

  counter(page).update(1)

  set page(
    paper: "a4",
    margin: (x: 2.2cm, top: 2.3cm, bottom: 2.3cm),
    header: [
      #grid(
        columns: (1fr, auto),
        text(size: 8.5pt, fill: text-muted)[#titulo],
        text(size: 8.5pt, fill: primary, weight: "bold")[UNCo · CURZAS]
      )
      #v(3pt)
      #line(length: 100%, stroke: 0.6pt + primary)
    ],
    footer: [
      #line(length: 100%, stroke: 0.4pt + rgb("#cbd5e1"))
      #v(3pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        text(size: 8.5pt, fill: text-muted)[#materia],
        text(size: 8.5pt, fill: primary, weight: "bold")[
          #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
        ]
      )
    ]
  )

  body
}
