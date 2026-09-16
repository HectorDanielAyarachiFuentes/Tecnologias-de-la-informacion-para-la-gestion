#import "curzas_ejecutiva.typ": *

#show: doc => reporte_ejecutivo(
  titulo: "EJEMPLO 1: ESTILO EJECUTIVO MINIMALISTA",
  subtitulo: "Demostración de Plantilla Reutilizable para Informes de Laboratorio",
  proposito: "Demostrar la reducción drástica de código y consumo de recursos mediante la reutilización de módulos de diseño en Typst.",
  estudiantes: ("Hector Daniel Ayarachi Fuentes", "Alejandra Diaz"),
  fecha: "14 de Agosto de 2026",
  materia: "Tecnología de la Información para la Gestión",
  doc
)

= ESTACIÓN 1: Demostración de Reutilización
== Importación Directa del Módulo

#callout("Materiales Utilizados")[
  - Plantilla base: `curzas_ejecutiva.typ`
  - Reducción de código: De ~1,000 líneas a menos de 40 líneas de texto plano.
]

=== 1. Simulación de Interacción

#dialogue("Usuario", [¿Cómo funciona el módulo reutilizable en Typst?])
#dialogue("Asistente", [Simplemente se importa con `#import "curzas_ejecutiva.typ": *` en la primera línea.])

=== 2. Ejemplo de Código CSV / Registro

#code_box("VISTA DE CSV GENERADO", "\"id_registro\",\"nombre_completo\",\"email\",\"estado\"\n\"P-001\",\"Ana Silva\",\"ana.silva@example.org\",\"APROBADO\"")
