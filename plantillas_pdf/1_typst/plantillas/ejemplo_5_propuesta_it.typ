#import "curzas_propuesta_it.typ": *

#show: doc => propuesta_it(
  titulo: "MODERNIZACIÓN DE INFRAESTRUCTURA Y REPORTES TI",
  subtitulo: "Propuesta Técnica para la Automatización de Documentos Administrativos",
  cliente: "Secretaría Administrativa CURZAS",
  autor: "Equipo de Gestión de TI",
  fecha: "17 de Agosto de 2026",
  materia: "Tecnología de la Información para la Gestión",
  doc
)

= 1. Resumen del Proyecto
El presente proyecto contempla la sustitución de plantillas de oficina tradicionales por un motor de compilación tipográfica basado en **Typst**.

= 2. Matriz de Evaluación de Riesgos

#matriz_riesgo((
  ("Incompatibilidad de Fuentes", "Baja", "Media", "Instalar tipografías estándar en servidor"),
  ("Resistencia al cambio", "Media", "Alta", "Capacitación en marcado liviano Typst"),
  ("Falla de Conectividad Cache", "Baja", "Baja", "Uso de plantillas locales offline en la carpeta plantillas/")
))

= 3. Presupuesto Estimado

#presupuesto_table(
  (
    ("Desarrollo de Plantillas Locales (.typ)", "3", "$ 150.000", "$ 450.000"),
    ("Integración Scripting Python", "1", "$ 200.000", "$ 200.000"),
    ("Capacitación al Personal", "1", "$ 100.000", "$ 100.000")
  ),
  "$ 750.000"
)
