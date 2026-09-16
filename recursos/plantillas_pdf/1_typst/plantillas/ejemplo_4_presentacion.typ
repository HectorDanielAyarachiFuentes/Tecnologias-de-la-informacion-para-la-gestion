#import "curzas_presentacion.typ": *

#show: doc => presentacion_curzas(
  titulo: "SISTEMAS DE INFORMACIÓN GERENCIAL (MIS)",
  subtitulo: "Impacto de la Maquetación Automatizada en la Toma de Decisiones",
  materia: "Tecnología de la Información para la Gestión",
  institucion: "UNCo · CURZAS",
  expositores: ("Hector Daniel Ayarachi Fuentes", "Alejandra Diaz"),
  fecha: "Agosto 2026",
  doc
)

#slide(title: "1. Introducción al Problema")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      #slide_card("Desafío Tradicional", [
        - Generación manual de informes en Word.
        - Tiempos de formato excesivos (~40% del tiempo total).
        - Inconsistencia visual entre áreas.
      ])
    ],
    [
      #slide_card("Solución con Typst", [
        - Compilación ultrarrápida a PDF nativo.
        - Plantillas institucionales reutilizables.
        - Código limpio y control de versiones con Git.
      ])
    ]
  )
]

#slide(title: "2. Arquitectura de Plantillas")[
  #slide_card("Componentes Principales de la Solución", [
    1. *Módulo Base (`.typ`):* Define colores HSL/RGB, reglas de maquetación y tipografía.
    2. *Documento de Trabajo:* Importa el módulo con `#import` y provee únicamente el contenido.
    3. *Pipeline de Automatización:* Python ejecuta `typst.compile()` generando PDFs ejecutivos al instante.
  ])
]
