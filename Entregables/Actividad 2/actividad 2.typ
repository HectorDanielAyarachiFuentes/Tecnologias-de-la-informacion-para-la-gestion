// ==========================================
// CONFIGURACIÓN DE DOCUMENTO Y ESTILOS
// ==========================================
#set document(
  title: "De los documentos al orden de mérito - Informe de Evaluación",
  author: "Hector Daniel Ayarachi Fuentes",
)

#set text(font: "Arial", size: 9.8pt, fill: rgb("#1f2933"), lang: "es")
#set par(justify: true, leading: 0.7em)

// Paleta de colores
#let primary = rgb("#153e5c")       // Azul petróleo institucional
#let teal-accent = rgb("#176b67")   // Verde azulado
#let orange-accent = rgb("#c1741f") // Naranja terracota
#let text-main = rgb("#1f2933")     // Texto principal
#let text-muted = rgb("#4b6575")    // Texto secundario
#let border-subtle = rgb("#b7c9d6") // Borde suave
#let bg-card = rgb("#fdf6ee")       // Fondo cálido para destacados

// Componentes de Estilo
#let h1(body) = text(size: 20pt, fill: primary, weight: "bold", block(below: 8pt, body))
#let h2(body) = block(
  above: 20pt,
  below: 10pt,
  stroke: (bottom: 1.2pt + border-subtle),
  inset: (bottom: 4pt),
  text(size: 13pt, fill: primary, weight: "bold", body),
)
#let h3(body) = block(above: 12pt, below: 5pt, text(size: 10.5pt, fill: rgb("#28536b"), weight: "bold", body))

#let callout(body, bg, border-color, left-border-color) = block(
  width: 100%,
  fill: rgb(bg),
  stroke: (
    top: 0.8pt + rgb(border-color),
    right: 0.8pt + rgb(border-color),
    bottom: 0.8pt + rgb(border-color),
    left: 4.5pt + rgb(left-border-color),
  ),
  inset: (x: 11pt, y: 9pt),
  radius: (right: 4pt),
  above: 10pt,
  below: 12pt,
  body,
)

#let summary(body) = callout(body, "fdf6ee", "b7c9d6", "c1741f")
#let consigna-box(body) = callout(body, "f0f6fa", "b7c9d6", "153e5c")

#let nota(body) = block(
  width: 100%,
  fill: rgb("eef6f4"),
  stroke: (left: 4pt + teal-accent),
  inset: (x: 10pt, y: 8pt),
  radius: (right: 4pt),
  above: 9pt,
  below: 11pt,
  text(size: 9.2pt, body),
)

#let paso(n, t) = block(
  width: 100%,
  fill: primary,
  inset: (top: 6pt, bottom: 6pt, left: 10pt, right: 10pt),
  radius: 4pt,
  above: 18pt,
  below: 9pt,
  [
    #text(fill: white.darken(15%), size: 8pt, tracking: 0.12em, weight: "bold", upper(n))\
    #v(-3pt)
    #text(fill: white, size: 11.5pt, weight: "bold", t)
  ],
)

#let codeblock(body) = block(
  width: 100%,
  fill: rgb("f7f9fa"),
  stroke: 0.8pt + rgb("9eb1bb"),
  inset: (x: 9pt, y: 7pt),
  radius: 3pt,
  above: 6pt,
  below: 9pt,
  text(font: "Consolas", size: 7.8pt, body),
)

#let tag-ok(body) = box(fill: rgb("e6f4ea"), inset: (x: 4.5pt, y: 2pt), radius: 3pt, text(fill: rgb("137333"), weight: "bold", size: 7.8pt, body))
#let tag-no(body) = box(fill: rgb("fce8e6"), inset: (x: 4.5pt, y: 2pt), radius: 3pt, text(fill: rgb("c5221f"), weight: "bold", size: 7.8pt, body))
#let tag-warn(body) = box(fill: rgb("fef7e0"), inset: (x: 4.5pt, y: 2pt), radius: 3pt, text(fill: rgb("b06000"), weight: "bold", size: 7.8pt, body))

// Formato de celdas de tablas (sin justificación forzada para evitar espacios estirados)
#show table.cell: set par(justify: false, leading: 0.5em)
#show table.cell: set text(size: 8.8pt)

// ==========================================
// 1. CARÁTULA PRINCIPAL
// ==========================================
#page(
  paper: "a4",
  margin: (x: 2cm, top: 2.5cm, bottom: 2.2cm),
  header: none,
  footer: none,
)[
  #grid(
    columns: (12pt, 1fr),
    gutter: 20pt,
    [
      #rect(
        width: 100%,
        height: 94%,
        fill: teal-accent,
        radius: 2pt,
      )
    ],
    [
      #v(10pt)
      // Logotipo institucional destacado en carátula
      #image("/Logotipo de curzas/CURZAS.png", width: 130pt)
      
      #v(15pt)
      // Barra superior naranja
      #rect(
        width: 100%,
        height: 4.5pt,
        fill: orange-accent,
        radius: 1pt,
      )
      
      #v(22pt)
      
      // Título Principal
      #text(size: 20pt, weight: "bold", fill: primary)[
        DE LOS DOCUMENTOS AL ORDEN DE MÉRITO
      ]
      
      #v(10pt)
      
      // Subtítulo
      #text(size: 13pt, fill: text-muted, style: "italic")[
        Informe de Evaluación de Calidad de Datos, Auditoría y Selección
      ]
      
      #v(30pt)
      
      // Cuadro de Propósito
      #block(
        width: 100%,
        fill: bg-card,
        stroke: (left: 4.5pt + orange-accent, rest: 0.6pt + border-subtle),
        inset: (x: 14pt, y: 12pt),
        radius: (right: 4pt),
        [
          #text(weight: "bold", fill: orange-accent, size: 9pt, tracking: 0.08em)[PROPÓSITO DE LA ACTIVIDAD]\
          #v(4pt)
          #text(size: 9.3pt, fill: text-main)[
            Convertir un conjunto de doce archivos heterogéneos y desestructurados (formularios de texto libre, CVs, cartas de presentación y certificados escaneados/fotografiados) en una matriz de datos normalizada para la toma de decisiones, verificando la autenticidad, consistencia y trazabilidad de los requisitos excluyentes.
          ]
        ],
      )
      
      #v(90pt)
      
      // Metadatos inferiores
      #block(
        width: 100%,
        stroke: (top: 0.6pt + border-subtle),
        inset: (top: 18pt),
        [
          #grid(
            columns: (160pt, 1fr),
            row-gutter: 14pt,
            text(size: 9pt, weight: "bold", fill: text-muted)[ESTUDIANTE / EXPERIMENTADOR:],
            text(size: 9.5pt, weight: "semibold", fill: primary)[Hector Daniel Ayarachi Fuentes],
            
            text(size: 9pt, weight: "bold", fill: text-muted)[FECHA DE ENTREGA:],
            text(size: 9.2pt, fill: text-main)[19 de Agosto de 2026],
            
            text(size: 9pt, weight: "bold", fill: text-muted)[MATERIA / CONTEXTO:],
            text(size: 9.2pt, fill: text-main)[Tecnología de la Información para la Gestión],
          )
        ],
      )
    ],
  )
]

// ==========================================
// 2. CUERPO DEL INFORME Y DESARROLLO
// ==========================================
#counter(page).update(1)

#set page(
  paper: "a4",
  margin: (x: 2cm, top: 2.2cm, bottom: 2.2cm),
  header: [
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 8pt, fill: rgb("7d919f"))[Municipalidad de Puerto Norte · Selección LL-2026-14],
      text(size: 8pt, fill: rgb("7d919f"))[Actividad 2 · Calidad de Datos],
    )
    #v(-4pt)
    #line(length: 100%, stroke: 0.4pt + rgb("b7c9d6"))
  ],
  footer: [
    #line(length: 100%, stroke: 0.4pt + rgb("b7c9d6"))
    #v(-2pt)
    #grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      text(size: 8pt, fill: rgb("7d919f"))[Informe de Evaluación y Trazabilidad],
      image("/Logotipo de curzas/CURZAS.png", height: 13pt),
      text(size: 8pt, fill: rgb("7d919f"))[
        #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
      ],
    )
  ],
)

#h1[De los documentos al orden de mérito]
#text(size: 11pt, fill: text-muted)[Un llamado, cuatro postulantes, doce archivos heterogéneos y una decisión fundamentada]

#v(8pt)

#summary[
  *Resumen Ejecutivo:* A través de una secuencia de 7 pasos guiados por prompts y controles de auditoría, se procesó la documentación de cuatro postulantes para el puesto de *Operador/a de Planta de Tratamiento de Efluentes* de la Municipalidad de Puerto Norte. A continuación, se detalla el trabajo realizado en cada etapa, contrastando el estado inicial (Antes) con el resultado estructurado (Después).
]

#v(6pt)
#h2[Desarrollo Metodológico: Paso a Paso]

// ==========================================
// PASO 1
// ==========================================
#paso("Paso 1", "Limpiar y normalizar el formulario de inscripciones (CSV)")

#consigna-box[
  *Qué pide la consigna:*
  Actuar como responsable de calidad de datos y limpiar el archivo `inscripciones.csv.txt` sin alterar filas:
  + Separar `nombre_completo` en `apellido` y `nombres` con mayúscula inicial y tildes correspondientes.
  + Normalizar `dni` a solo números (sin puntos ni espacios).
  + Estandarizar `correo` a minúsculas.
  + Limpiar `horas_declaradas` y `experiencia_declarada_anios` dejando solo el valor numérico puro.
]

*1. Entrada (Antes: CSV crudo con inconsistencias de formato):*
#codeblock(raw("Marca temporal,Nombre y apellido,DNI,Correo electrónico,Localidad,Formación específica realizada,Horas acreditadas,Años de experiencia,CV,Carta de presentación,Certificado
10/08/2026 9:14:22,marina ochoa,28.114.507,marina.ochoa@example.org,Puerto Norte,Operación de plantas de tratamiento de efluentes,160,4 años,cv-ochoa.pdf,carta-ochoa.pdf,certificado-ochoa.pdf
10/08/2026 11:02:47,VILLALBA ERNESTO,30.442.118,E.VILLALBA@EXAMPLE.ORG,Puerto Norte,Tratamiento de efluentes industriales,150 hs,3 años,cv-villalba.pdf,carta-villalba.pdf,certificado-villalba.pdf
11/08/2026 8:41:09,Lucia  Ferreyra,27983664,lucia.ferreyra@example.org,Villa Alturas,Gestión Ambiental y Sustentabilidad,200 horas,5 años,cv-ferreyra.pdf,carta-ferreyra.pdf,certificado-ferreyra.jpg
11/08/2026 19:55:31,hugo SANDOVAL,33.201.945,hugo.sandoval@example.org,Puerto Norte,Operación y control de plantas potabilizadoras,120,2 años,cv-sandoval.pdf,carta-sandoval.pdf,certificado-sandoval.png"))

*2. Procedimiento realizado (Qué hicimos):*
- Se aislaron apellidos y nombres resolviendo mayúsculas arbitrarias (`VILLALBA ERNESTO`) y espacios dobles (`Lucia  Ferreyra`).
- Se depuraron los caracteres no numéricos de los DNI para posibilitar cruces relacionales unívocos.
- Se suprimieron cadenas como `"hs"`, `"horas"` y `"años"` para permitir cálculos matemáticos y comparaciones directas.

#v(4pt)
*3. Resultado (Después: Tabla en celdas limpias y ordenadas):*

#table(
  columns: (0.9fr, 1.1fr, 0.9fr, 2.4fr, 2.7fr, 0.6fr, 0.6fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if row == 0 { rgb("e7eef3") } else { none },
  inset: (x: 6pt, y: 5.5pt),
  [#text(weight: "bold", fill: primary)[Apellido]],
  [#text(weight: "bold", fill: primary)[Nombres]],
  [#text(weight: "bold", fill: primary)[DNI]],
  [#text(weight: "bold", fill: primary)[Correo]],
  [#text(weight: "bold", fill: primary)[Formación Declarada]],
  [#text(weight: "bold", fill: primary)[Hs.]],
  [#text(weight: "bold", fill: primary)[Años]],

  [Ochoa], [Marina Elisa], [28114507], [marina.ochoa\@example.org], [Op. plantas tratamiento efluentes], [160], [4],
  [Villalba], [Ernesto], [30442118], [e.villalba\@example.org], [Tratamiento efluentes industriales], [150], [3],
  [Ferreyra], [Lucía], [27983664], [lucia.ferreyra\@example.org], [Gestión Ambiental y Sustentabilidad], [200], [5],
  [Sandoval], [Hugo Alberto], [33201945], [hugo.sandoval\@example.org], [Op. y control plantas potabilizadoras], [120], [2],
)

#pagebreak()

// ==========================================
// PASO 2
// ==========================================
#paso("Paso 2", "Extraer experiencia laboral desde los Currículums (CVs)")

#consigna-box[
  *Qué pide la consigna:*
  Analizar los cuatro currículums (`cv-*.pdf`) y generar una tabla normalizada con: `apellido, nombres, dni, puesto_actual, lugar, desde, hasta, anios_experiencia, otros_cursos`.
  - Calcular la antigüedad desde la fecha de inicio hasta *agosto de 2026* (fecha del llamado) en años y meses.
  - Registrar con estricto criterio `NA` (no figura) o `ILEGIBLE` (no se lee con certeza).
]

*1. Procedimiento realizado (Qué hicimos):*
- Se examinaron minuciosamente los cuatro documentos PDF.
- Se calculó la antigüedad real a la fecha de corte (agosto 2026): Ochoa (4 años y 5 meses), Villalba (3 años y 2 meses), Ferreyra (5 años y 4 meses) y Sandoval (2 años y 9 meses).
- Se identificó que *Marina Elisa Ochoa* acreditó el curso deseable de *Seguridad en espacios confinados (24 h)*.

#v(4pt)
*2. Resultado (Después: Estructura tabular de experiencia):*

#table(
  columns: (0.9fr, 0.9fr, 1.5fr, 1.8fr, 1.2fr, 1.3fr, 2.3fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if row == 0 { rgb("e7eef3") } else { none },
  inset: (x: 6pt, y: 5.5pt),
  [#text(weight: "bold", fill: primary)[Apellido]],
  [#text(weight: "bold", fill: primary)[DNI]],
  [#text(weight: "bold", fill: primary)[Puesto Actual]],
  [#text(weight: "bold", fill: primary)[Lugar / Instalación]],
  [#text(weight: "bold", fill: primary)[Período]],
  [#text(weight: "bold", fill: primary)[Antigüedad]],
  [#text(weight: "bold", fill: primary)[Otros Cursos]],

  [Ochoa], [28114507], [Operadora de planta], [Planta Sur · Puerto Norte], [03/2022 a la fecha], [4 años y 5 meses], [Espacios confinados (24 h, 2024)],
  [Villalba], [30442118], [Operario de manten.], [Red de agua · Puerto Norte], [06/2023 a la fecha], [3 años y 2 meses], [Licencia de conducir cat. B],
  [Ferreyra], [27983664], [Asistente técnica], [Dir. Ambiente · Villa Alturas], [04/2021 a la fecha], [5 años y 4 meses], [Manejo avanzado planillas],
  [Sandoval], [33201945], [Operario de manten.], [Planta Norte · Puerto Norte], [11/2023 a la fecha], [2 años y 9 meses], [Primeros auxilios (16 h, 2025)],
)

#v(10pt)

// ==========================================
// PASO 3
// ==========================================
#paso("Paso 3", "Extraer disponibilidad y motivos de las Cartas de Presentación")

#consigna-box[
  *Qué pide la consigna:*
  Extraer de `carta-*.pdf` las columnas `apellido, nombres, dni, disponibilidad, motivo_declarado`. Transcribir el motivo de forma textual y literal, sin resumir ni interpretar.
]

#table(
  columns: (1fr, 0.9fr, 2.2fr, 3.5fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if row == 0 { rgb("e7eef3") } else { none },
  inset: (x: 6pt, y: 5.5pt),
  [#text(weight: "bold", fill: primary)[Postulante]],
  [#text(weight: "bold", fill: primary)[DNI]],
  [#text(weight: "bold", fill: primary)[Disponibilidad Declarada]],
  [#text(weight: "bold", fill: primary)[Motivo Textual']],

  [Ochoa, Marina], [28114507], [Turnos rotativos, incl. fines de semana], [Seguir trabajando en el mismo campo con más responsabilidad.],
  [Villalba, Ernesto], [30442118], [Turno mañana; con aviso previo rota], [Pasar de mantenimiento de red a operación de planta.],
  [Ferreyra, Lucía], [27983664], [Jornada completa, sin turnos nocturnos], [Aplicar la formación ambiental en una tarea operativa.],
  [Sandoval, Hugo], [33201945], [Turnos rotativos], [Crecer dentro de la planta donde ya trabaja.],
)

#pagebreak()

// ==========================================
// PASO 4
// ==========================================
#paso("Paso 4", "Auditar y extraer datos de los Certificados de Formación")

#consigna-box[
  *Qué pide la consigna:*
  Auditar los 4 certificados adjuntos presentados en formatos desparejos y extraer: `archivo, nombre_en_certificado, dni, curso, horas_certificadas, entidad, anio, expediente`.
  - *Regla de oro:* No completar datos a partir del formulario. Si la imagen no exhibe el dato o está incompleta, asentar estrictamente `ILEGIBLE`.
]

*1. Entrada (Heterogeneidad y problemas de procedencia documental):*
- `certificado-ochoa.pdf`: Documento digital íntegro.
- `certificado-villalba.pdf`: Documento escaneado en escala de grises.
- `certificado-ferreyra.jpg`: Fotografía inclinada sobre superficie de madera.
- `certificado-sandoval.png`: Captura de pantalla mutilada/cortada horizontalmente en su mitad inferior.

*2. Procedimiento realizado (Qué hicimos):*
- Se verificó minuciosamente la procedencia y legibilidad de cada documento.
- Se detectó que `certificado-sandoval.png` carece de la parte inferior donde figura la carga horaria, año y expediente; por ende, se asentó `ILEGIBLE`.
- Se verificó que en `certificado-villalba.pdf` la entidad certificó únicamente *80 horas*, revelando una inconsistencia con lo declarado en el formulario inicial.

#v(4pt)
*3. Resultado (Después: Matriz de auditoría de certificados):*

#table(
  columns: (1.3fr, 1.8fr, 0.8fr, 1.8fr, 0.7fr, 1.1fr, 0.9fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if row == 0 { rgb("e7eef3") } else { none },
  inset: (x: 6pt, y: 5.5pt),
  [#text(weight: "bold", fill: primary)[Archivo]],
  [#text(weight: "bold", fill: primary)[Curso Acreditado]],
  [#text(weight: "bold", fill: primary)[Hs. Real]],
  [#text(weight: "bold", fill: primary)[Entidad Emisora]],
  [#text(weight: "bold", fill: primary)[Año]],
  [#text(weight: "bold", fill: primary)[Expediente]],
  [#text(weight: "bold", fill: primary)[Estado]],

  [`cert.-ochoa.pdf`], [Op. Plantas Tratamiento Efluentes], [160], [Inst. Prov. Form. Técnica], [2023], [IPFT-2023-0447], [#tag-ok[Completo]],
  [`cert.-villalba.pdf`], [Tratamiento Efluentes Industriales], [80], [Centro Capacitación Ribera], [2022], [CCR-22-1180], [#tag-ok[Completo]],
  [`cert.-ferreyra.jpg`], [Gestión Ambiental y Sustentabilidad], [200], [Univ. Provincial Extensión], [2024], [UP-EXT-2024-3391], [#tag-ok[Completo]],
  [`cert.-sandoval.png`], [Op. y Control Pl. Potabilizadoras], [#text(fill: red, weight: "bold")[ILEGIBLE]], [Inst. Prov. Form. Técnica], [#text(fill: red)[ILEG.]], [#text(fill: red)[ILEGIBLE]], [#tag-warn[Cortado]],
)

#nota[
  *Hallazgo crítico:* Un proceso de selección asistido no debe adivinar ni autocompletar información. El caso de Sandoval demuestra cómo la calidad del archivo adjunto condiciona el resultado administrativo.
]

#pagebreak()

// ==========================================
// PASO 5
// ==========================================
#paso("Paso 5", "Fusionar las cuatro tablas (Consolidación de datos)")

#consigna-box[
  *Qué pide la consigna:*
  Actuar como responsable de consolidación de datos:
  + Unificar las 4 tablas generadas en los pasos previos en una sola mediante el `DNI` como clave unívoca.
  + Conservar por separado las columnas declaradas en el formulario y las documentadas en los adjuntos.
  + Mantener estrictamente los valores `NA` e `ILEGIBLE`.
  + Generar una sección explícita de *Diferencias entre lo declarado y lo documentado*.
]

*1. Entrada:* Las cuatro matrices de datos normalizadas obtenidas en los Pasos 1, 2, 3 y 4.

*2. Procedimiento realizado (Qué hicimos):*
- Se realizó un cruce relacional (JOIN) utilizando el número de DNI como identificador único para evitar confusiones por variaciones en la escritura de los nombres.
- Se preservaron en columnas paralelas las horas y experiencia declaradas frente a las acreditadas.
- Se contrastaron ambos campos detectando discrepancias documentales críticas.

#v(4pt)
*3. Resultado (Tabla Consolidada y Registro de Diferencias):*

#table(
  columns: (1fr, 0.9fr, 1.6fr, 0.9fr, 1.4fr, 1.4fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if row == 0 { rgb("e7eef3") } else { none },
  inset: (x: 6pt, y: 5.5pt),
  [#text(weight: "bold", fill: primary)[Postulante]],
  [#text(weight: "bold", fill: primary)[DNI]],
  [#text(weight: "bold", fill: primary)[Formación Certificada]],
  [#text(weight: "bold", fill: primary)[Hs. Decl. / Real]],
  [#text(weight: "bold", fill: primary)[Exp. Decl. / Real]],
  [#text(weight: "bold", fill: primary)[Disponibilidad]],

  [Ochoa, Marina], [28114507], [Op. Trat. Efluentes], [160 / 160], [4a / 4a 5m], [Rotativos / Fines de sem.],
  [Villalba, Ernesto], [30442118], [Trat. Efluentes Ind.], [150 / *80*], [3a / 3a 2m], [Turno mañana (rotativo)],
  [Ferreyra, Lucía], [27983664], [Gestión Ambiental], [200 / 200], [5a / 5a 4m], [Jornada completa (s/noc)],
  [Sandoval, Hugo], [33201945], [Op. Potabilizadoras], [120 / *ILEGIBLE*], [2a / 2a 9m], [Turnos rotativos],
)

#v(4pt)
*Diferencias identificadas entre lo declarado y lo documentado:*
- *Ernesto Villalba:* Declaró 150 horas en el formulario, pero su certificado prueba únicamente 80 horas (inconsistencia de -70 horas).
- *Hugo Alberto Sandoval:* Declaró 120 horas en el formulario, pero su archivo adjunto no permite constatar la carga horaria por encontrarse truncado.

#pagebreak()

// ==========================================
// PASO 6
// ==========================================
#paso("Paso 6", "Evaluar requisitos excluyentes, puntuar y ordenar")

#consigna-box[
  *Qué pide la consigna:*
  Actuar como responsable del proceso de selección y evaluar la matriz consolidada:
  + Asignar a cada requisito (`R1`, `R2`, `R3`) uno de tres valores: `SÍ`, `NO` o `NO SE PUEDE DETERMINAR`.
  + Determinar el resultado: `ADMITIDO` (tres SÍ), `NO ADMITIDO` (al menos un NO), o `PENDIENTE DE DOCUMENTACIÓN` (si hay algún NO SE PUEDE DETERMINAR y ningún NO).
  + Generar tres listas independientes: *Orden de Mérito*, *Pendientes* y *No Admitidos*.
]

*1. Procedimiento realizado (Qué hicimos):*
- Se aplicó la regla de que la formación ambiental generalista no satisface `R1`.
- Se validó que las horas computables para `R2` son exclusivamente las del certificado oficial (mínimo 120 hs).
- Se utilizó el curso de *Seguridad en espacios confinados* de Ochoa como factor preferencial de ponderación.

#v(4pt)
*2. Resultado (Matriz de Dictamen y Listas Clasificadas):*

#table(
  columns: (1.1fr, 0.8fr, 1.3fr, 0.9fr, 0.6fr, 0.6fr, 0.6fr, 1.2fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if row == 0 { rgb("e7eef3") } else { none },
  inset: (x: 5pt, y: 5pt),
  [#text(weight: "bold", fill: primary)[Postulante]],
  [#text(weight: "bold", fill: primary)[DNI]],
  [#text(weight: "bold", fill: primary)[Formación]],
  [#text(weight: "bold", fill: primary)[Hs. Cert.]],
  [#text(weight: "bold", fill: primary)[R1]],
  [#text(weight: "bold", fill: primary)[R2]],
  [#text(weight: "bold", fill: primary)[R3]],
  [#text(weight: "bold", fill: primary)[Dictamen]],

  [Ochoa, Marina], [28114507], [Op. Trat. Efluentes], [160 hs], [#tag-ok[SÍ]], [#tag-ok[SÍ]], [#tag-ok[SÍ]], [#tag-ok[ADMITIDA]],
  [Villalba, Ernesto], [30442118], [Trat. Efluentes Ind.], [80 hs], [#tag-ok[SÍ]], [#tag-no[NO]], [#tag-ok[SÍ]], [#tag-no[NO ADMITIDO]],
  [Ferreyra, Lucía], [27983664], [Gestión Ambiental], [200 hs], [#tag-no[NO]], [#tag-ok[SÍ]], [#tag-no[NO]], [#tag-no[NO ADMITIDA]],
  [Sandoval, Hugo], [33201945], [Op. Potabilizadoras], [ILEGIBLE], [#tag-ok[SÍ]], [#tag-warn[S/D]], [#tag-ok[SÍ]], [#tag-warn[PENDIENTE]],
)

#v(4pt)
*Clasificación de Postulantes:*
- *ORDEN DE MÉRITO:* 1° Marina Elisa Ochoa (Única admitida · 160 hs certificadas · 4a 5m de experiencia · Curso en espacios confinados).
- *PENDIENTES DE DOCUMENTACIÓN:* Hugo Alberto Sandoval (Requiere subsanar certificado de formación cortado).
- *NO ADMITIDOS:* Ernesto Villalba (Incumple R2: acredita 80 hs) y Lucía Ferreyra (Incumple R1 y R3: formación y experiencia no operativas).

#v(10pt)

// ==========================================
// PASO 7
// ==========================================
#paso("Paso 7", "Elaborar el Informe Final de Evaluación")

#consigna-box[
  *Qué pide la consigna:*
  Redactar el acta de selección / informe formal dirigido a la Secretaría de Servicios Sanitarios, estructurado en cinco secciones: Qué se evaluó, Cómo se evaluó, Resultados, Lo que no se pudo verificar y Recomendación administrativa, cerrando con la cláusula legal obligatoria.
]

*1. Versión en Markdown puro (Lista para copiar y pegar):*

#codeblock(raw(
"# Informe de evaluación · Llamado LL-2026-14

## Qué se evaluó
Se recibieron cuatro postulaciones para el puesto de Operador/a de Planta de Tratamiento de Efluentes (Marina Elisa Ochoa, Ernesto Villalba, Lucía Ferreyra y Hugo Alberto Sandoval). Cada persona presentó formulario de inscripción, currículum vitae, carta de presentación y certificado de formación.

## Cómo se evaluó
Se contrastó la documentación contra los tres requisitos excluyentes del llamado:
1. R1: Formación específica en operación de plantas de tratamiento de efluentes o potabilizadoras (la formación ambiental general no la reemplaza).
2. R2: Al menos 120 horas acreditadas en el certificado oficial (no se computan las horas declaradas en el formulario).
3. R3: Al menos 2 años de experiencia en operación o mantenimiento de plantas.
D1 (Deseable): Curso de seguridad en espacios confinados para desempate.

## Resultados
- ORDEN DE MÉRITO:
  1. Marina Elisa Ochoa (DNI 28.114.507): ADMITIDA. Cumple R1, R2 (160 hs certificadas en certificado-ochoa.pdf) y R3 (4 años y 5 meses como operadora en Planta Sur). Aporta curso deseable de espacios confinados.
- PENDIENTES DE DOCUMENTACIÓN:
  - Hugo Alberto Sandoval (DNI 33.201.945): PENDIENTE. Cumple R1 y R3, pero la carga horaria en certificado-sandoval.png es ILEGIBLE por encontrarse cortada la imagen.
- NO ADMITIDOS:
  - Ernesto Villalba (DNI 30.442.118): NO ADMITIDO. No cumple R2 (acredita 80 hs en certificado-villalba.pdf frente a 120 hs requeridas).
  - Lucía Ferreyra (DNI 27.983.664): NO ADMITIDA. No cumple R1 (formación general en Gestión Ambiental) ni R3 (experiencia técnica municipal, no en plantas).

## Lo que no se pudo verificar
- Carga horaria, año y expediente de Hugo Alberto Sandoval por imagen truncada en certificado-sandoval.png. Se requiere solicitar copia íntegra del certificado.

## Recomendación
Intimar a Hugo Alberto Sandoval a presentar su certificado completo en un plazo de 48 horas hábiles para resolver su admisibilidad. De no subsanar o no alcanzar las 120 horas, adjudicar la vacante a quien encabeza el orden de mérito: Marina Elisa Ochoa.

Este documento ordena evidencia y no reemplaza la decisión del área."
))

#v(6pt)
*2. Versión Formal Diagramada (Para archivo y firma institucional):*

#block(
  width: 100%,
  stroke: 1.2pt + border-subtle,
  inset: (x: 14pt, y: 12pt),
  fill: rgb("ffffff"),
  radius: 4pt,
)[
  #text(size: 14pt, weight: "bold", fill: primary)[Informe de Evaluación · Llamado LL-2026-14]
  #v(-2pt)
  #text(size: 8.5pt, fill: text-muted)[Elevado a: Secretaría de Servicios Sanitarios · Municipalidad de Puerto Norte]
  
  #h3[1. Qué se evaluó]
  Se auditaron cuatro (4) postulaciones para el cargo de *Operador/a de Planta de Tratamiento de Efluentes*. Cada postulante presentó formulario, currículum vitae, carta de presentación y certificado de formación específica.

  #h3[2. Cómo se evaluó]
  Se aplicaron estrictamente los tres requisitos excluyentes del llamado:
  - *R1 (Excluyente):* Formación específica en plantas de efluentes o potabilizadoras (la formación ambiental generalista no es equivalente).
  - *R2 (Excluyente):* Mínimo de 120 horas acreditadas *en certificado oficial* (las horas declaradas en formulario carecen de validez por sí solas).
  - *R3 (Excluyente):* Mínimo de 2 años de experiencia comprobable en operación o mantenimiento de plantas.
  - *D1 (Deseable):* Curso de seguridad en espacios confinados como criterio preferencial de desempate.

  #h3[3. Resultados del Proceso]

  *A. ORDEN DE MÉRITO (Postulantes Admitidos)*
  + *1° Puesto: Marina Elisa Ochoa (DNI 28.114.507)*
    - *Dictamen:* #tag-ok[ADMITIDA]
    - *Fundamentación:* Cumple todos los requisitos excluyentes. Acredita 160 horas en `certificado-ochoa.pdf` (superando las 120 hs exigidas) y 4 años y 5 meses de experiencia como operadora en Planta Sur. Aporta curso deseable en espacios confinados (24 hs).

  *B. PENDIENTES DE DOCUMENTACIÓN*
  - *Hugo Alberto Sandoval (DNI 33.201.945)*
    - *Dictamen:* #tag-warn[PENDIENTE DE DOCUMENTACIÓN]
    - *Fundamentación:* Cumple R1 y R3, pero la carga horaria en `certificado-sandoval.png` se encuentra ilegible por estar cortada la imagen. No puede ingresar al orden de mérito hasta su subsanación.

  *C. NO ADMITIDOS*
  - *Ernesto Villalba (DNI 30.442.118):* #tag-no[NO ADMITIDO] — Incumple R2. Su certificado (`certificado-villalba.pdf`) solo acredita 80 horas (mínimo: 120 hs).
  - *Lucía Ferreyra (DNI 27.983.664):* #tag-no[NO ADMITIDA] — Incumple R1 (formación generalista en Gestión Ambiental) e incumple R3 (experiencia técnica en oficina ambiental, no en plantas).

  #h3[4. Lo que no se pudo verificar]
  - Carga horaria exacta, año y número de expediente del certificado de *Hugo Alberto Sandoval*.

  #h3[5. Recomendación Administrativa]
  Se recomienda intimar formalmente a Hugo Alberto Sandoval a aportar copia completa y legible de su certificado en un plazo de 48 horas hábiles. En caso de no subsanar o no alcanzar las 120 horas, se procederá a la adjudicación del puesto a favor de *Marina Elisa Ochoa*.

  #v(8pt)
  #line(length: 100%, stroke: 0.5pt + rgb("7d919f"))
  #text(size: 8pt, fill: text-muted)[
    *Nota legal:* Este informe ordena y audita la evidencia técnica y documental recopilada y no sustituye la decisión administrativa final de la Secretaría.
  ]
]

#pagebreak()

// ==========================================
// ANTES DE CERRAR: CONTROLES Y PUESTA EN COMÚN
// ==========================================
#h2[Antes de cerrar · Los tres controles y la puesta en común]

#h3[1. Los Tres Controles de Calidad de Datos]

#consigna-box[
  *1. PROCEDENCIA Y AUDITORÍA* \
  *¿Cada dato de la tabla dice de qué archivo salió?* \
  Sí. La totalidad de los registros de la matriz final cuentan con trazabilidad explícita hacia su archivo fuente (`cv-*.pdf`, `carta-*.pdf`, `certificado-*.*` o formulario de origen). Ningún dato carece de respaldo documental auditable.
]

#summary[
  *2. MUESTREO ALEATORIO (3 Celdas verificadas contra el original)*
  - *Muestra 1 (Horas de Ernesto Villalba):* Se cotejó la celda de 80 horas abriendo `certificado-villalba.pdf`. Se confirmó fehacientemente que la constancia oficial del *Centro de Capacitación Ribera* indica *Carga horaria: 80 horas*, probando que lo declarado en el formulario (150 hs) era inexacto.
  - *Muestra 2 (Cursos deseables de Marina Ochoa):* Se revisó `cv-ochoa.pdf` en la sección *Otros datos*, confirmando la acreditación literal de *Curso de seguridad en espacios confinados (24 h, 2024)*.
  - *Muestra 3 (Horas de Hugo Sandoval):* Se abrió `certificado-sandoval.png`. La imagen concluye abruptamente luego de la línea *Operación y Control de Plantas Potabilizadoras*, corroborando que la carga horaria es efectivamente *ILEGIBLE* por corte del archivo.
]

#nota[
  *3. LO QUE NO SE PUDO DETERMINAR (NA vs. ILEGIBLE)* \
  *Regla epistemológica:* Una tabla completada al 100% sin ningún `NA` ni `ILEGIBLE`, construida a partir de documentos tan heterogéneos, no es un indicador de calidad sino de *alucinación o autocompletado indebido*. El registro de `ILEGIBLE` en Sandoval es la garantía de que el sistema no inventó información.
]

#v(8pt)
#h3[2. Respuestas para la Puesta en Común]

#table(
  columns: (1fr, 2.8fr),
  stroke: 0.5pt + border-subtle,
  fill: (col, row) => if col == 0 { rgb("e7eef3") } else { none },
  inset: (x: 7pt, y: 6.5pt),
  [#text(weight: "bold", fill: primary)[Pregunta Guía]],
  [#text(weight: "bold", fill: primary)[Respuesta Fundamentada]],

  [¿Cuántas celdas quedaron en `NA` y cuántas en `ILEGIBLE`?],
  [Quedaron *0 celdas en NA* (los campos requeridos existían en todos los perfiles) y *3 celdas en ILEGIBLE* correspondientes a las horas, año y expediente en `certificado-sandoval.png` debido al corte físico de la imagen.],

  [¿Encontraste diferencias entre lo declarado y lo documentado?],
  [Sí, dos diferencias sustanciales: \
   1) *Ernesto Villalba:* Declaró 150 hs en formulario pero su certificado solo acredita 80 hs (-70 hs de diferencia). \
   2) *Hugo Sandoval:* Declaró 120 hs, pero su certificado no permite constatar ninguna cifra.],

  [¿Alguno de los certificados se resistió más? ¿Por qué?],
  [El `certificado-sandoval.png`. Al ser una captura de pantalla mal encuadrada que omitió la mitad inferior del certificado, impidió validar el cumplimiento de R2 y obligó a clasificarlo como PENDIENTE.],

  [¿Qué campo del formulario habría ahorrado la mitad del trabajo del Paso 1?],
  [El campo *Nombre y apellido*. Al haberse diseñado como texto libre único, permitió entradas desordenadas (mayúsculas, minúsculas, dobles espacios o invertir orden de nombre/apellido). Si se hubiesen definido dos campos separados obligatorios (*"Apellido"* y *"Nombres"*), se habría automatizado el 50% de la limpieza inicial.],
)

#v(10pt)
#h3[3. Lo que no hacemos hoy (Conclusión)]

#nota[
  *La IA no reemplaza la decisión humana:* Esta matriz no decide a quién contratar; ordena, audita y valida evidencia documental para que una persona responsable tome la decisión informada. 

  De cuatro postulaciones, tres pudieron resolverse con certeza (1 admitida y 2 rechazadas) y una quedó en suspenso (*Hugo Sandoval*), no por falta de capacidad o idoneidad laboral de la persona, sino exclusivamente por *cómo llegó un archivo adjunto*.
]

