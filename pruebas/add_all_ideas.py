import os
import re

typst_file = r'Entregables\Actividad asincronica 2\Actividad asincronica 2.typ'
txt_file = r'Entregables\Actividad asincronica 2\data\idea 1.txt'

with open(txt_file, 'r', encoding='utf-8') as f:
    transcript = f.read()

# Replace **** with bold speaker indicators
transcript = transcript.replace('****', '**[Locutor]**')

with open(typst_file, 'r', encoding='utf-8') as f:
    content = f.read()

# Find the start of the SECCIÓN DE IDEAS ADICIONALES (OPCIONALES)
start_marker = "// ==========================================\n// SECCIÓN DE IDEAS ADICIONALES (OPCIONALES)\n// =========================================="
start_idx = content.find(start_marker)

if start_idx == -1:
    print("Could not find the start marker.")
    exit(1)

# Keep the content up to the start marker
base_content = content[:start_idx]

# Define the new content
new_content = """// ==========================================
// SECCIÓN DE IDEAS ADICIONALES (OPCIONALES)
// ==========================================

// Definición de bloques para ideas
#let idea-header(num, title) = rect(
  width: 100%,
  fill: rgb("#faf8fc"),
  stroke: 1.5pt + rgb("#493466"),
  inset: (x: 16pt, y: 14pt),
  radius: 2pt,
  [
    #text(fill: rgb("#7a6894"), size: 9pt, tracking: 1.2pt)[IDEA #num · CUADERNO NUEVO] \\
    #v(4pt)
    #text(fill: rgb("#493466"), size: 15pt, weight: "bold")[#title]
  ]
)

#let mirar(body) = block(
  width: 100%,
  fill: rgb("#faf8fd"),
  stroke: (left: 4pt + rgb("#7a5c9e"), top: 1pt + rgb("#c3b3d8"), right: 1pt + rgb("#c3b3d8"), bottom: 1pt + rgb("#c3b3d8")),
  inset: 12pt,
  radius: (right: 4pt),
  body
)

// Bloque de cierre (violeta oscuro)
#rect(
  width: 100%,
  fill: rgb("#493466"),
  inset: 16pt,
  radius: 2pt,
  [
    #text(fill: white, size: 11pt, weight: "bold")[Hasta acá llega la actividad.] 
    #text(fill: white, size: 11pt)[Con los nueve desafíos y la participación en el foro, está completa. Lo que sigue no se entrega, no se corrige y no hace falta hacerlo.]
    
    #v(8pt)
    #text(fill: white, size: 11pt)[Son seis ideas para explorar, para quien tenga ganas de seguir. Cada una arranca con un cuaderno nuevo, aparte del que armaste, y toca algo que la actividad no llegó a cubrir. Hacé una, hacé tres, o ninguna.]
  ]
)

#v(15pt)

// ------------------------------------------
// IDEA 1
// ------------------------------------------
#idea-header("1", "Un cuaderno hecho de videos")

*Para qué sirve.* Convertir capacitaciones, jornadas o charlas grabadas en material consultable. Es el uso que más rápido convierte horas de video en algo que se puede citar.

+ Creá un cuaderno nuevo. Llamalo como el tema que vayas a trabajar.
+ Buscá en YouTube *uno o dos videos públicos que tengan subtítulos*, sobre algo de tu campo: una charla de gestión pública, una capacitación en recursos humanos, una explicación de un procedimiento. Pegá el enlace como fuente.
+ *Hacé clic sobre la fuente cargada.* Mirá qué hay adentro.
+ Preguntá al chat el prompt de abajo.
+ Después generá, sobre ese material: un *resumen*, una *presentación*, una *infografía*, y el *informe* que te parezca más útil de los tipos que ofrezca.

#align(right)[
  #rect(stroke: 1pt + border-subtle, radius: 4pt, inset: 8pt)[*Copiar prompt*]
]
#rect(
  width: 100%,
  fill: rgb("#f8f9fa"),
  stroke: 1pt + border-subtle,
  inset: 12pt,
  [
    #set text(font: "Courier New", size: 9.5pt)
    Sobre el video cargado, respondé tres cosas: \\
    \\
    1. Qué se explica, paso a paso. \\
    2. Qué advertencias o salvedades hace quien expone. \\
    3. Describí lo que se ve en pantalla alrededor del minuto 5: los \\
       gráficos, las capturas o las imágenes que muestra.
  ]
)

#v(10pt)
#mirar[
  *Qué mirar.* Al abrir la fuente no vas a ver el video: vas a ver *la transcripción*. Eso es todo lo que el cuaderno tiene.
  
  Por eso la pregunta 3 es la que importa. *No la puede responder*: nadie le mostró la pantalla, solo le dieron las palabras. Si igual te describe gráficos, los inventó a partir de lo que se dice.
  
  Las preguntas 1 y 2 sí las contesta bien, porque eso se dice en voz alta.
  
  *La consecuencia para el trabajo:* un video cargado como fuente es un texto. Todo lo que la persona mostró y no dijo —una tabla en pantalla, un organigrama, un formulario— *no está*. Y si el video no tiene subtítulos, directamente no se puede cargar.
]

#v(10pt)
#text(size: 9.5pt)[
  _Utilizá la siguiente transcripción como fuente para tu nuevo cuaderno (Idea 1):_
]

#block(
  width: 100%,
  fill: rgb("#fcfcfc"),
  stroke: 1pt + border-subtle,
  inset: 12pt,
  radius: 2pt,
  [
    #set text(size: 8.5pt, fill: rgb("#333333"), leading: 0.6em)
    #set par(justify: true)
    
""" + transcript + """
  ]
)

#v(20pt)

// ------------------------------------------
// IDEA 2
// ------------------------------------------
#pagebreak()
#idea-header("2", "Un cuaderno compartido con el equipo")

*Para qué sirve.* Es la primera forma práctica de compartir conocimiento dentro de una oficina: en vez de mandar quince archivos por correo, se comparte un cuaderno donde ya se puede preguntar.

+ Creá un cuaderno nuevo y cargale material *público o ficticio*: normativa descargada de un sitio oficial, guías, manuales. Todavía no cargues nada interno.
+ Abrí las opciones de *compartir* y recorré lo que ofrece: compartir el cuaderno completo, compartir solo el chat, o compartir un artefacto suelto.
+ Compartilo con una persona de confianza y pedile que te cuente *qué ve*.
+ Probá también compartir *un solo artefacto* y compará qué acceso da cada opción.

#mirar[
  *Qué mirar.* Cuando compartís el cuaderno completo, la otra persona accede a *todas las fuentes cargadas y a todo lo generado*, no solo a lo que vos estabas mirando. Es la diferencia con mandar un archivo.
  
  Si tu cuenta es institucional, es probable que *solo puedas compartir dentro del mismo dominio*. Eso no es una limitación: es la razón por la que un cuaderno institucional puede contener lo que uno personal no.
  
  *La idea para llevarse.* Un «cuaderno de la oficina» con circulares, instructivos y criterios acordados hace que el conocimiento deje de depender de quién esté ese día. Es el uso que más ordena el trabajo cotidiano y el que menos se arma.
  
  *Y la regla que va antes:* lo que se comparte deja de estar bajo tu control. Qué entra en un cuaderno compartido se acuerda antes de compartirlo, no después.
]

#v(20pt)

// ------------------------------------------
// IDEA 3
// ------------------------------------------
#idea-header("3", "Una fuente que cambia sola")

*Para qué sirve.* Descubrir qué pasa cuando la fuente es un documento vivo, que otras personas editan. Es el experimento más corto de esta lista y el que más sorprende.

+ Creá en tu Drive una *planilla* con cinco filas de datos inventados. Por ejemplo: código de actividad, nombre y cantidad de inscriptos.
+ Creá un cuaderno nuevo y conectá *esa planilla de Drive* como fuente.
+ Preguntá: _«¿Cuántas filas de datos hay y cuáles son?»_. Anotá la respuesta.
+ *Andá a la planilla y agregá dos filas más.* Guardá.
+ Volvé al cuaderno y *hacé la misma pregunta, sin tocar nada más*.
+ Ahora buscá la opción de *sincronizar o actualizar* esa fuente, usala, y volvé a preguntar.

#mirar[
  *Qué mirar.* En el paso 5, lo más probable es que te siga respondiendo *cinco filas*. Recién después de sincronizar aparecen las siete.
  
  *Por qué pasa.* La fuente no es la planilla: es *una copia de la planilla en el momento en que la cargaste*. El vínculo con Drive sirve para poder actualizarla, no para que se actualice sola.
  
  *La consecuencia para el trabajo.* Si el cuaderno de tu oficina tiene conectado un procedimiento que alguien modificó la semana pasada, seguís consultando la versión vieja y nada te avisa. Conviene *anotar en el nombre de cada fuente la fecha en que se cargó*, y volver a sincronizar antes de una consulta que importe.
  
  Probá lo mismo con un documento de texto en vez de una planilla, y fijate si se comporta igual.
]

#v(20pt)

// ------------------------------------------
// IDEA 4
// ------------------------------------------
#idea-header("4", "El cuaderno en el celular")

*Para qué sirve.* Capturar material en el momento: una cartelera, un instructivo pegado en la pared, una planilla en papel, la página de un manual que alguien te presta.

+ Instalá la aplicación en tu teléfono. Según la cuenta, aparece como NotebookLM o como Gemini Notebook.
+ Creá un cuaderno nuevo desde el celular.
+ Usá la opción de *escanear o tomar una foto* y capturá algo real y sin datos personales: la página de un libro, un formulario en blanco, un afiche informativo.
+ *Abrí la fuente que quedó cargada* y leé qué extrajo.
+ Preguntá algo puntual que figure en el documento, y comprobalo con tus ojos.
+ Probá con algo difícil: una tabla, letra chica, o una fotocopia despareja.

#mirar[
  *Qué mirar.* El reconocimiento de texto impreso suele ser bueno. Donde se cae es en *tablas* —las columnas se mezclan— y en fotos torcidas o con sombra.
  
  *El hábito es el mismo de siempre:* abrir la fuente y mirar qué entró. En el celular es más tentador saltearlo, porque la foto se ve bien en la pantalla y uno supone que el texto también.
  
  *Para qué conviene usarlo.* Para capturar en el momento algo que después vas a consultar, no para digitalizar en serio. Si el documento importa, escanealo bien desde una computadora.
]

#v(20pt)

// ------------------------------------------
// IDEA 5
// ------------------------------------------
#pagebreak()
#idea-header("5", "El cuaderno de guardia")

*Para qué sirve.* Que el conocimiento operativo de un área no dependa de quién esté ese día. Es una idea de diseño más que un ejercicio de herramienta.

Pensá en un área que conozcas —donde trabajás, donde hiciste una práctica, o una que te imagines— y armá el cuaderno que le haría falta a alguien que entra a cubrir una licencia mañana.

+ Escribí primero, en papel o en un documento, *las diez preguntas* que esa persona va a hacer en su primera semana.
+ Recién después decidí qué fuentes harían falta para responderlas.
+ Armá el cuaderno con lo que puedas conseguir en versión pública o ficticia.
+ Probá las diez preguntas y anotá cuáles quedaron sin responder.

#mirar[
  *Qué mirar.* Las preguntas que quedaron sin responder son el verdadero resultado: señalan *qué conocimiento de esa oficina no está escrito en ningún lado* y vive solo en la cabeza de alguien.
  
  Empezar por las preguntas y no por los documentos cambia todo el resultado. Si armás el cuaderno primero, terminás con lo que había a mano; si empezás por las preguntas, terminás con una lista de lo que falta.
]

#v(20pt)

// ------------------------------------------
// IDEA 6
// ------------------------------------------
#idea-header("6", "Tu propio material, con criterio")

*Para qué sirve.* Es el paso que sigue a toda esta actividad, y el único que hay que dar con cuidado. Hasta acá trabajamos con material ficticio a propósito.

Antes de cargar el primer documento real, pasalo por estas seis preguntas:

+ ¿Es necesario para lo que quiero hacer, o lo cargo por las dudas?
+ ¿Está vigente?
+ ¿Contiene datos personales o sensibles de alguien?
+ ¿Puedo anonimizarlo, o cargar solo la sección que necesito?
+ ¿Tengo autorización para usarlo en esta herramienta?
+ Si mañana este cuaderno se comparte por error, ¿qué pasa?

#mirar[
  *Qué mirar.* La sexta pregunta es la que ordena las otras cinco. Un cuaderno se comparte con un clic, y lo que entró alguna vez sigue adentro.
  
  *El material de riesgo cero para empezar* es el que ya es público: normativa descargada de un sitio oficial, manuales, guías, material de capacitación. Con eso se aprende la herramienta completa sin exponer nada.
  
  *Lo que no va* mientras no haya una definición institucional: legajos, evaluaciones de desempeño, informes médicos, denuncias, y cualquier expediente con personas identificables.
]

#v(20pt)
#align(center)[
  #text(fill: text-muted, size: 8pt)[_La Municipalidad de Puerto Norte, su reglamento, sus actas, su registro y su resolución son ficticios y fueron preparados con fines educativos._]
]
"""

with open(typst_file, 'w', encoding='utf-8') as f:
    f.write(base_content + new_content)

print("Updated perfectly with all ideas.")
