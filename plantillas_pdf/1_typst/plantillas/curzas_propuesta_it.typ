// ==========================================
// PLANTILLA LOCAL 5: CURZAS PROPUESTA IT / GESTIÓN
// ==========================================

#let primary = rgb("#1e1b4b")       // Indigo oscuro ejecutivo
#let accent = rgb("#4f46e5")        // Indigo vibrante
#let text-main = rgb("#1f2937")     // Gris carbón
#let text-muted = rgb("#6b7280")    // Gris secundario
#let bg-card = rgb("#f8fafc")       // Fondo neutro
#let border-subtle = rgb("#e2e8f0") // Bordes finos

// Componente Matriz de Riesgo
#let matriz_riesgo(filas) = [
  #v(4pt)
  #table(
    columns: (1fr, 80pt, 80pt, 1.2fr),
    fill: (col, row) => if row == 0 { primary } else if calc.even(row) { rgb("#f1f5f9") } else { rgb("#ffffff") },
    stroke: 0.5pt + border-subtle,
    align: (left, center, center, left),
    table.header(
      [*Riesgo Identificado*], [*Probabilidad*], [*Impacto*], [*Plan de Mitigación*]
    ),
    ..filas.flatten()
  )
  #v(4pt)
]

// Componente Tabla de Presupuesto
#let presupuesto_table(filas, total) = [
  #v(4pt)
  #table(
    columns: (1fr, 60pt, 80pt, 90pt),
    fill: (col, row) => if row == 0 { accent } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#ffffff") },
    stroke: 0.5pt + border-subtle,
    align: (left, center, right, right),
    table.header(
      [*Item / Concepto*], [*Cant.*], [*P. Unitario*], [*Subtotal*]
    ),
    ..filas.flatten(),
    table.cell(colspan: 3, align: right)[*TOTAL ESTIMADO:*], [*#total*]
  )
  #v(4pt)
]

// Función Principal de la Propuesta
#let propuesta_it(
  titulo: "PROPUESTA DE PROYECTO TI",
  subtitulo: "Especificación Técnica y Plan de Gestión",
  cliente: "Organización / Cliente",
  autor: "Equipo de Consultoría TI",
  fecha: "2026",
  materia: "Tecnología de la Información para la Gestión",
  body
) = {
  set text(font: "Segoe UI", size: 9.5pt, fill: text-main, lang: "es")
  set par(justify: true, leading: 0.65em)

  show heading.where(level: 1): it => [
    #v(14pt)
    #block(
      width: 100%,
      fill: rgb("#e0e7ff"),
      inset: (x: 10pt, y: 6pt),
      radius: 4pt,
      text(weight: "bold", size: 11pt, fill: primary)[#it.body]
    )
    #v(6pt)
  ]

  show heading.where(level: 2): it => [
    #v(10pt)
    #text(weight: "bold", size: 10pt, fill: accent)[#it.body]
    #v(4pt)
  ]

  // Portada
  page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3cm, bottom: 2.5cm),
    header: none,
    footer: none
  )[
    #text(size: 11pt, weight: "bold", fill: accent, tracking: 0.08em)[CURZAS · GESTIÓN DE TI] \
    #text(size: 9pt, fill: text-muted)[#materia]
    
    #v(25pt)
    #line(length: 100%, stroke: 2pt + primary)
    #v(20pt)
    
    #text(size: 22pt, weight: "bold", fill: primary)[#titulo] \
    #v(8pt)
    #text(size: 12pt, fill: text-muted)[#subtitulo]
    
    #v(40pt)
    
    #rect(
      width: 100%,
      fill: bg-card,
      stroke: 0.5pt + border-subtle,
      radius: 6pt,
      inset: 14pt
    )[
      #grid(
        columns: (130pt, 1fr),
        row-gutter: 10pt,
        text(weight: "bold", fill: text-muted)[ORGANIZACIÓN / CLIENTE:], text(weight: "semibold")[#cliente],
        text(weight: "bold", fill: text-muted)[ELABORADO POR:], text(weight: "semibold")[#autor],
        text(weight: "bold", fill: text-muted)[FECHA DE EMISIÓN:], [#fecha]
      )
    ]
    
    #align(bottom + center)[
      #text(size: 8.5pt, fill: text-muted)[Documento de Especificación de Proyecto TI — CURZAS UNCo]
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
        text(size: 8.5pt, fill: accent, weight: "bold")[PROPUESTA TI]
      )
      #v(3pt)
      #line(length: 100%, stroke: 0.5pt + border-subtle)
    ],
    footer: [
      #line(length: 100%, stroke: 0.3pt + border-subtle)
      #v(3pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        text(size: 8.5pt, fill: text-muted)[#materia],
        text(size: 8.5pt, fill: text-muted)[#context counter(page).display("1")]
      )
    ]
  )

  body
}
