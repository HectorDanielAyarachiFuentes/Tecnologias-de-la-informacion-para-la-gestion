#import "curzas_paper.typ": *

#show: doc => articulo_curzas(
  titulo: "Evaluación Comparativa de Motores Tipográficos en la Gestión de Documentos Universitarios",
  autores: ("Hector Daniel Ayarachi Fuentes", "Alejandra Diaz"),
  afiliacion: "Complejo Universitario Regional Zona Atlántica y Sur (CURZAS)",
  materia: "Tecnología de la Información para la Gestión",
  resumen: "Este artículo analiza la eficiencia del motor Typst frente a procesadores de texto tradicionales en entornos de gestión universitaria. Se evalúan métricas de velocidad de generación, peso de archivos en disco y facilidad de mantenimiento de maquetas corporativas.",
  palabras_clave: ("Typst", "Gestión Documental", "Automatización", "PDF Native"),
  fecha: "Agosto 2026",
  doc
)

= Introducción
La generación masiva de documentos administrativos en instituciones de educación superior demanda herramientas eficaces.

= Metodología
Se implementaron seis tipos de plantillas locales escritas en Typst dentro del directorio del proyecto.

== Renderizado Python
Utilizando la librería `typst` para Python, se ejecutó la compilación sin necesidad de llamadas web externas.

= Resultados
Los tiempos de renderizado promediaron menos de 100 milisegundos por documento de 5 páginas.

= Conclusión
La adopción de módulos `.typ` en almacenamiento local garantiza independencia de red y compilación instantánea.
