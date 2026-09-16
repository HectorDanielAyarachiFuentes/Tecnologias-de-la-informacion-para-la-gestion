// ==========================================
// PLANTILLA LOCAL 4: CURZAS PRESENTACIÓN (SLIDES 16:9)
// ==========================================

#let primary = rgb("#0f2d59")       // Azul marino profundo
#let accent = rgb("#009688")        // Verde azulado tech
#let text-main = rgb("#1f2937")     // Gris carbón
#let text-muted = rgb("#6b7280")    // Gris suave
#let bg-slide = rgb("#ffffff")      // Blanco puro
#let bg-card = rgb("#f8fafc")       // Gris muy suave para tarjetas
#let border-subtle = rgb("#e2e8f0") // Bordes finos

// Componente Tarjeta de Diapositiva
#let slide_card(title, body) = [
  #v(4pt)
  #block(
    width: 100%,
    fill: bg-card,
    stroke: 0.5pt + border-subtle,
    inset: 12pt,
    radius: 6pt,
    [
      #text(weight: "bold", fill: primary, size: 10pt)[#title] \
      #v(4pt)
      #text(size: 9pt, fill: text-main)[#body]
    ]
  )
  #v(4pt)
]

// Función de Diapositiva Individual
#let slide(title: "", body) = {
  page(
    paper: "presentation-16-9",
    margin: (x: 1.5cm, top: 1.5cm, bottom: 1.2cm),
    fill: bg-slide,
    header: [
      #if title != "" [
        #grid(
          columns: (1fr, auto),
          text(size: 14pt, weight: "bold", fill: primary)[#title],
          text(size: 8.5pt, weight: "bold", fill: accent)[CURZAS · PRESENTACIÓN]
        )
        #v(3pt)
        #line(length: 100%, stroke: 1pt + accent)
      ]
    ],
    footer: [
      #line(length: 100%, stroke: 0.4pt + border-subtle)
      #v(2pt)
      #grid(
        columns: (1fr, auto),
        text(size: 8pt, fill: text-muted)[Tecnología de la Información para la Gestión],
        text(size: 8pt, fill: text-muted)[#context counter(page).display("1")]
      )
    ],
    [
      #v(8pt)
      #body
    ]
  )
}

// Función Principal de la Presentación
#let presentacion_curzas(
  titulo: "TÍTULO DE LA PRESENTACIÓN",
  subtitulo: "Subtítulo o Resumen Ejecutivo",
  materia: "Tecnología de la Información para la Gestión",
  institucion: "UNCo · CURZAS",
  expositores: ("Expositor 1", "Expositor 2"),
  fecha: "2026",
  slides_content
) = {
  set text(font: "Segoe UI", size: 10pt, fill: text-main, lang: "es")

  // Portada de la Presentación
  page(
    paper: "presentation-16-9",
    margin: (x: 2cm, y: 1.8cm),
    fill: primary,
    header: none,
    footer: none
  )[
    #align(center + horizon)[
      #text(size: 10pt, weight: "bold", fill: accent, tracking: 0.12em)[#upper(institucion)]
      #v(10pt)
      #text(size: 24pt, weight: "bold", fill: rgb("#ffffff"))[#titulo]
      #v(8pt)
      #text(size: 14pt, fill: rgb("#cbd5e1"))[#subtitulo]
      #v(20pt)
      #line(length: 40%, stroke: 1.5pt + accent)
      #v(20pt)
      #text(size: 10pt, weight: "medium", fill: rgb("#f8fafc"))[Expositores: #expositores.join(" · ")]
      #v(4pt)
      #text(size: 9pt, fill: rgb("#94a3b8"))[#materia — #fecha]
    ]
  ]

  slides_content
}
