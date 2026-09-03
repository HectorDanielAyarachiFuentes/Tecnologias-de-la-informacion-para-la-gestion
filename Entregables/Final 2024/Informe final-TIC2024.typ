#set text(font: ("Arial", "Segoe UI"), size: 9.5pt, fill: rgb("#2c3e50"), lang: "es")
#set par(leading: 0.65em)

#set page(
  paper: "a4",
  header: none,
  footer: grid(
    columns: (1fr, auto, 1fr),
    align(left)[Tecnologías de la Información para la Gestión],
    align(center)[#image("../../Logotipo de curzas/CURZAS.png", height: 12pt)],
    align(right)[Página #context counter(page).display()]
  )
)

// Colores institucionales
#let teal = rgb("#0e6873")
#let accent = rgb("#c65911")
#let bg-box = rgb("#f2f7f7")

// ---------------------------------------------------------
// PORTADA
// ---------------------------------------------------------
#align(center)[
  #v(25%)
  #image("../../Logotipo de curzas/CURZAS.png", width: 120pt)
  #v(1cm)
  #text(size: 24pt, weight: "bold", fill: teal)[Informe final-TIC2024]
  #v(0.5cm)
  #text(size: 16pt)[Tecnología de la Información para la Gestión]
  #v(0.5cm)
  #text(size: 14pt)[Complejo Universitario Regional Zona Atlántica y Sur (CURZAS)]
  #v(1cm)
  #text(size: 12pt)[*Autor:* Hector Daniel Ayarachi Fuentes]
  #v(0.5cm)
  #text(size: 12pt)[*Fecha:* 25 de Agosto de 2026]
]
#pagebreak()

// ---------------------------------------------------------
// PÁGINA 1
// ---------------------------------------------------------
= 1. Empleados por Categoría

A continuación se detalla la cantidad de empleados correspondientes a cada categoría:

#v(0.5cm)
#align(center)[
  #table(
    columns: 2,
    fill: (x, y) => if y == 0 { teal } else { none },
    stroke: 0.5pt + teal,
    align: (center, center),
    [*Categoría*], [*Cantidad de Empleados*],
    [Categoría 1], [26],
    [Categoría 2], [35],
    [Categoría 3], [39]
  )
]

#v(1cm)
#align(center)[
  #image("pie_chart.png", width: 70%)
]

#pagebreak()

// ---------------------------------------------------------
// PÁGINA 2
// ---------------------------------------------------------
= 2. Empleados por Régimen y Categoría

En la siguiente tabla se observa el desglose de empleados clasificados por su régimen de contratación y categoría.

#v(0.5cm)
#align(center)[
  #table(
    columns: 4,
    fill: (x, y) => if y == 0 { teal } else { none },
    stroke: 0.5pt + teal,
    align: (left, center, center, center),
    [*Régimen*], [*Categoría 1*], [*Categoría 2*], [*Categoría 3*],
    [Funcionarios], [15], [14], [20],
    [Personal], [11], [21], [19]
  )
]

#v(1cm)
#align(center)[
  #image("bar_chart.png", width: 80%)
]
