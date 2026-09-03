// ==========================================
// PLANTILLA 1: CURZAS EJECUTIVA (Minimalista & Elegante)
// ==========================================

#let primary = rgb("#0f2d59")       // Azul marino profundo
#let accent = rgb("#c89632")        // Dorado elegante
#let text-main = rgb("#1f2937")     // Gris carbón
#let text-muted = rgb("#6b7280")    // Gris suave
#let bg-card = rgb("#f8fafc")       // Fondo neutro premium
#let border-subtle = rgb("#e2e8f0") // Bordes sutiles

// Componente Callout
#let callout(title, body) = [
  #v(5pt)
  #block(
    width: 100%,
    fill: bg-card,
    stroke: (left: 3pt + primary, rest: 0.5pt + border-subtle),
    inset: (x: 12pt, y: 9pt),
    radius: (right: 4pt),
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
    fill: bg-card,
    stroke: 0.5pt + border-subtle,
    inset: (x: 9pt, y: 6.5pt),
    radius: 4pt,
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
    fill: rgb("#1e293b"),
    stroke: 0.5pt + rgb("#0f172a"),
    inset: (x: 9pt, y: 8pt),
    radius: 4pt,
    [
      #if title != "" [
        #text(weight: "bold", fill: accent, size: 7.5pt)[#upper(str(title))] \
        #v(3pt)
      ]
      #set text(font: "Consolas", size: 6.2pt, fill: rgb("#f8fafc"))
      #set par(leading: 0.48em, justify: false)
      #raw(content_str, block: true)
    ]
  )
  #v(4pt)
]

// Función Principal del Documento
#let reporte_ejecutivo(
  titulo: "TÍTULO DEL INFORME",
  subtitulo: "Subtítulo o Descripción General",
  proposito: "",
  materia: "Tecnología de la Información para la Gestión",
  institucion: "COMPLEJO UNIVERSITARIO REGIONAL ZONA ATLÁNTICA Y SUR (CURZAS)",
  estudiantes: ("Estudiante 1", "Estudiante 2"),
  fecha: "14 de Agosto de 2026",
  body
) = {
  // Configuración de texto
  set text(font: "Segoe UI", size: 9.8pt, fill: text-main, lang: "es")
  set par(justify: true, leading: 0.65em)

  // Estilos de títulos
  show heading.where(level: 1): it => [
    #v(13pt)
    #box(rect(width: 3.5pt, height: 12pt, fill: accent, radius: 1pt))
    #h(6pt)
    #text(weight: "bold", size: 12pt, fill: primary)[#it.body]
    #v(5pt)
  ]

  show heading.where(level: 2): it => [
    #v(9pt)
    #text(weight: "bold", size: 10.2pt, fill: primary)[#it.body]
    #v(4pt)
  ]

  show heading.where(level: 3): it => [
    #v(6pt)
    #text(weight: "semibold", size: 9.3pt, fill: primary)[#it.body]
    #v(3pt)
  ]

  // Portada
  page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3.2cm, bottom: 2.5cm),
    header: none,
    footer: none
  )[
    #text(size: 11pt, weight: "bold", fill: primary, tracking: 0.05em)[#upper(str(materia))] \
    #v(2pt)
    #text(size: 9.5pt, weight: "medium", fill: accent)[#institucion]
    
    #v(12pt)
    #line(length: 100%, stroke: 0.6pt + border-subtle)
    #v(30pt)
    
    #box(
      fill: rgb("#eef2ff"),
      inset: (x: 8pt, y: 4pt),
      radius: 3pt,
      text(size: 8.5pt, weight: "bold", fill: primary, tracking: 0.06em)[PLANTILLA EJECUTIVA · CURZAS]
    )
    
    #v(14pt)
    
    #block(width: 100%)[
      #set par(justify: false)
      #text(size: 22pt, weight: "bold", fill: primary)[#titulo]
    ]
    
    #v(8pt)
    #text(size: 13pt, fill: text-muted, weight: "regular")[#subtitulo]
    
    #v(30pt)
    
    #if proposito != "" [
      #callout("PROPÓSITO DE LA ACTIVIDAD")[#proposito]
    ]
    
    #v(30pt)
    
    #rect(
      width: 100%,
      fill: bg-card,
      stroke: 0.5pt + border-subtle,
      radius: 6pt,
      inset: (x: 16pt, y: 14pt)
    )[
      #grid(
        columns: (175pt, 1fr),
        row-gutter: 11pt,
        text(size: 8.8pt, weight: "bold", fill: text-muted)[ESTUDIANTE(S)],
        text(size: 9.2pt, weight: "semibold", fill: text-main)[#estudiantes.join("\n")],
        
        text(size: 8.8pt, weight: "bold", fill: text-muted)[FECHA DE ENTREGA],
        text(size: 9.2pt, fill: text-main)[#fecha],
        
        text(size: 8.8pt, weight: "bold", fill: text-muted)[MATERIA / CONTEXTO],
        text(size: 9.2pt, fill: text-main)[#materia]
      )
    ]
    
    #align(bottom + center)[
      #text(size: 8.5pt, fill: text-muted)[Viedma, Río Negro — República Argentina]
    ]
  ]

  // Configuración de páginas de contenido
  counter(page).update(1)

  set page(
    paper: "a4",
    margin: (x: 2.2cm, top: 2.3cm, bottom: 2.3cm),
    header: [
      #grid(
        columns: (1fr, auto),
        text(size: 8.5pt, fill: text-muted)[#titulo],
        text(size: 8.5pt, fill: accent, weight: "bold")[UNCo · CURZAS]
      )
      #v(3pt)
      #line(length: 100%, stroke: 0.4pt + border-subtle)
    ],
    footer: [
      #line(length: 100%, stroke: 0.3pt + border-subtle)
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
