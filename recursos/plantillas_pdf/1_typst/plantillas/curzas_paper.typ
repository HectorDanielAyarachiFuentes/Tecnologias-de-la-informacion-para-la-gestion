// ==========================================
// PLANTILLA LOCAL 6: CURZAS PAPER / ARTÍCULO CIENTÍFICO
// ==========================================

#let primary = rgb("#1e293b")       // Gris pizarra oscuro
#let accent = rgb("#2563eb")        // Azul académico
#let text-main = rgb("#0f172a")     // Carbón profundo
#let text-muted = rgb("#64748b")    // Gris neutro

#let articulo_curzas(
  titulo: "TÍTULO DEL ARTÍCULO CIENTÍFICO O ENSAYO ACADÉMICO",
  autores: ("Autor 1", "Autor 2"),
  afiliacion: "Complejo Universitario Regional Zona Atlántica y Sur (CURZAS) — UNCo",
  materia: "Tecnología de la Información para la Gestión",
  resumen: "",
  palabras_clave: (),
  fecha: "2026",
  body
) = {
  set text(font: "Times New Roman", size: 10pt, fill: text-main, lang: "es")
  set par(justify: true, leading: 0.58em, first-line-indent: 1em)

  show heading.where(level: 1): it => [
    #v(10pt)
    #set align(center)
    #text(weight: "bold", size: 10pt, fill: primary)[#upper(it.body)]
    #v(4pt)
  ]

  show heading.where(level: 2): it => [
    #v(8pt)
    #text(weight: "bold", style: "italic", size: 9.5pt, fill: primary)[#it.body]
    #v(3pt)
  ]

  set page(
    paper: "a4",
    margin: (x: 2cm, top: 2.2cm, bottom: 2.2cm),
    header: [
      #grid(
        columns: (1fr, auto),
        text(size: 8pt, style: "italic", fill: text-muted)[#materia — CURZAS UNCo],
        text(size: 8pt, fill: text-muted)[#fecha]
      )
      #v(2pt)
      #line(length: 100%, stroke: 0.4pt + text-muted)
    ],
    footer: [
      #align(center)[
        #text(size: 8.5pt, fill: text-muted)[#context counter(page).display("1")]
      ]
    ]
  )

  // Cabecera a 1 Columna (Título + Autores + Resumen)
  align(center)[
    #text(size: 16pt, weight: "bold", fill: primary)[#titulo]
    #v(8pt)
    #text(size: 10pt, weight: "semibold")[#autores.join(", ")] \
    #v(2pt)
    #text(size: 8.5pt, style: "italic", fill: text-muted)[#afiliacion]
    #v(12pt)
  ]

  if resumen != "" [
    #block(
      width: 100%,
      fill: rgb("#f8fafc"),
      stroke: 0.4pt + rgb("#cbd5e1"),
      inset: 10pt,
      radius: 3pt,
      [
        #set par(first-line-indent: 0pt, leading: 0.55em)
        #text(size: 8.8pt, weight: "bold", fill: primary)[Resumen—]
        #text(size: 8.8pt, style: "italic")[#resumen]
        
        #if palabras_clave.len() > 0 [
          \ #v(4pt)
          #text(size: 8.5pt, weight: "bold", fill: primary)[Palabras Clave—]
          #text(size: 8.5pt)[#palabras_clave.join(", ")]
        ]
      ]
    )
    #v(12pt)
  ]

  // Cuerpo a 2 Columnas
  columns(2, gutter: 14pt)[
    #body
  ]
}
