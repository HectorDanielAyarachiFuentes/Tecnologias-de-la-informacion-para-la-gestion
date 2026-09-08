// ==============================================================================
// UNIVERSIDAD NACIONAL DEL COMAHUE - CURZAS
// TECNOLOGÍA DE LA INFORMACIÓN PARA LA GESTIÓN (TIG)
// ACTIVIDAD 4 - INVESTIGACIÓN: POLÍTICAS DE MODERNIZACIÓN (TEMA 2: NACIÓN - NEUQUÉN)
// AUTOR: Hector Daniel Ayarachi Fuentes · Andrea Alejandra Díaz
// ==============================================================================

#set document(
  title: "Actividad 4 - Políticas de Modernización a nivel Nacional y Provincial (Nación - Neuquén)",
  author: ("Hector Daniel Ayarachi Fuentes · Andrea Alejandra Díaz", "Andrea Alejandra Díaz"),
)

// Configuración tipográfica y de párrafos según estándares institucionales
#set text(font: "Arial", size: 9.8pt, fill: rgb("#1f2933"), lang: "es")
#set par(justify: true, leading: 0.68em)

// Paleta cromática oficial (AGENTS.md)
#let primary = rgb("#153e5c")        // Azul petróleo institucional
#let teal-accent = rgb("#0e6873")    // Teal institucional
#let orange-accent = rgb("#c1741f")  // Terracota / Acento
#let text-main = rgb("#1f2933")      // Texto principal
#let text-muted = rgb("#4b6575")     // Texto secundario
#let border-subtle = rgb("#b7c9d6")  // Borde suave
#let bg-card = rgb("#f2f7f7")        // Fondo suave teal
#let bg-alert = rgb("#fdf2e9")       // Fondo cálido naranja

// Componentes de estilo con vinculación al Índice General
#show heading.where(level: 1): it => block(
  above: 20pt,
  below: 10pt,
  stroke: (bottom: 1.5pt + teal-accent),
  inset: (bottom: 5pt),
  text(size: 13.5pt, fill: primary, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 14pt,
  below: 7pt,
  text(size: 11pt, fill: teal-accent, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 10pt,
  below: 5pt,
  text(size: 9.8pt, fill: rgb("#28536b"), weight: "bold", it.body),
)

#let h1(body) = heading(level: 1, body)
#let h2(body) = heading(level: 2, body)
#let h3(body) = heading(level: 3, body)

#let callout(body, bg: "f2f7f7", border-color: "b7c9d6", left-color: "0e6873") = block(
  width: 100%,
  fill: rgb(bg),
  stroke: (
    top: 0.6pt + rgb(border-color),
    right: 0.6pt + rgb(border-color),
    bottom: 0.6pt + rgb(border-color),
    left: 4.5pt + rgb(left-color),
  ),
  inset: (x: 12pt, y: 10pt),
  radius: (right: 4pt),
  above: 10pt,
  below: 12pt,
  body,
)

#let nota(body) = block(
  width: 100%,
  fill: rgb("fdf6ee"),
  stroke: (left: 4pt + orange-accent),
  inset: (x: 11pt, y: 8pt),
  radius: (right: 3pt),
  above: 9pt,
  below: 11pt,
  text(size: 9.2pt, body),
)

#show table.cell: set par(justify: false, leading: 0.55em)
#show table.cell: set text(size: 8.7pt)

// ==============================================================================
// 1. CARÁTULA INSTITUCIONAL (PORTADA)
// ==============================================================================
#page(
  paper: "a4",
  margin: (x: 2cm, top: 2.3cm, bottom: 2.2cm),
  header: none,
  footer: none,
)[
  #grid(
    columns: (12pt, 1fr),
    gutter: 20pt,
    [
      #rect(
        width: 100%,
        height: 96%,
        fill: teal-accent,
        radius: 2pt,
      )
    ],
    [
      #v(8pt)
      // Logotipo oficial de CURZAS en tamaño destacado
      #image("../../../Logotipo de curzas/CURZAS.png", width: 135pt)
      
      #v(14pt)
      // Barra de acento naranja
      #rect(
        width: 100%,
        height: 4pt,
        fill: orange-accent,
        radius: 1pt,
      )
      
      #v(20pt)
      
      // Título Principal de la Actividad
      #text(size: 20pt, weight: "bold", fill: primary)[
        POLÍTICAS DE MODERNIZACIÓN DEL ESTADO
      ]
      
      #v(8pt)
      
      // Subtítulo
      #text(size: 12.5pt, fill: text-muted, style: "italic")[
        Investigación y Estudio Comparativo: Nivel Nacional (INAP) y Jurisdicción Subnacional (Neuquén Capital) · Tema 2
      ]
      
      #v(24pt)
      
      // Cuadro de Propósito y Enfoque Metodológico
      #block(
        width: 100%,
        fill: bg-card,
        stroke: (left: 4.5pt + teal-accent, rest: 0.6pt + border-subtle),
        inset: (x: 13pt, y: 11pt),
        radius: (right: 4pt),
        [
          #text(weight: "bold", fill: primary, size: 8.8pt, tracking: 0.08em)[PROPÓSITO Y SÍNTESIS DE LA ACTIVIDAD]\
          #v(4pt)
          #text(size: 9.1pt, fill: text-main)[
            Investigar, describir y analizar comparativamente las políticas públicas y plataformas digitales de modernización del Estado implementadas por el Gobierno Nacional a través del Observatorio de la Administración Pública del INAP y por la Secretaría de Modernización de la Ciudad de Neuquén. Se examinan las dimensiones de gobierno digital, inclusión tecnológica, simplificación administrativa y gobierno abierto, aplicando rigurosamente los estándares profesionales de estructuración documental, jerarquía de estilos de párrafo e indexación automatizada promovidos en la cátedra.
          ]
        ],
      )
      
      #v(60pt)
      
      // Metadatos institucionales y autoría
      #block(
        width: 100%,
        stroke: (top: 0.7pt + border-subtle),
        inset: (top: 16pt),
        [
          #grid(
            columns: (170pt, 1fr),
            row-gutter: 12pt,
            text(size: 8.8pt, weight: "bold", fill: text-muted)[INSTITUCIÓN EDUCATIVA:],
            text(size: 9.2pt, weight: "semibold", fill: primary)[CURZAS · Universidad Nacional del Comahue],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ESPACIO CURRICULAR:],
            text(size: 9.2pt, fill: text-main)[Tecnología de la Información para la Gestión (TIG)],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ACTIVIDAD / TEMA:],
            text(size: 9.2pt, fill: text-main)[Actividad Práctica 4 · Tema 2: Nación - Neuquén],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ESTUDIANTES / AUTORES:],
            text(size: 9.5pt, weight: "bold", fill: primary)[Hector Daniel Ayarachi Fuentes · Andrea Alejandra Díaz],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[FECHA DE PRESENTACIÓN:],
            text(size: 9.2pt, fill: text-main)[2 de Septiembre de 2026],
          )
        ],
      )
    ],
  )
]

// ==============================================================================
// 2. CONFIGURACIÓN DEL CUERPO (DESDE PÁGINA 2)
// ==============================================================================
#counter(page).update(1)

#set page(
  paper: "a4",
  margin: (x: 2cm, top: 2.3cm, bottom: 2.2cm),
  header: [
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 8pt, fill: rgb("#627d91"), weight: "semibold")[CURZAS · Tecnología de la Información para la Gestión],
      text(size: 8pt, fill: rgb("#627d91"))[Actividad 4 · Tema 2: Nación - Neuquén],
    )
    #v(-4pt)
    #line(length: 100%, stroke: 0.5pt + border-subtle)
  ],
  footer: [
    #line(length: 100%, stroke: 0.5pt + border-subtle)
    #v(-2pt)
    #grid(
      columns: (1fr, auto, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      text(size: 8pt, fill: rgb("#627d91"))[Políticas de Modernización del Estado],
      image("/Logotipo de curzas/CURZAS.png", height: 13pt),
      text(size: 8pt, fill: rgb("#627d91"))[
        #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
      ],
    )
  ],
)

// ==============================================================================
// ÍNDICE GENERAL / TABLA DE CONTENIDOS
// ==============================================================================
#block(
  width: 100%,
  stroke: (bottom: 1.5pt + primary),
  inset: (bottom: 4pt),
  text(size: 14pt, fill: primary, weight: "bold")[Índice General],
)

#v(8pt)
#outline(
  title: none,
  indent: 1.5em,
  depth: 3,
)

#v(14pt)
#pagebreak()

// ==============================================================================
// SECCIÓN 1: INTRODUCCIÓN Y ENFOQUE METODOLÓGICO
// ==============================================================================
#h1[1. Introducción y Enfoque Metodológico]

La transformación digital del sector público constituye uno de los procesos contemporáneos de mayor relevancia para el fortalecimiento de la gobernabilidad democrática, la transparencia institucional y la eficiencia en la asignación de recursos públicos. Lejos de reducirse a la simple digitalización de expedientes físicos o a la adquisición masiva de hardware, la modernización del Estado implica un cambio de paradigma organizacional y cultural en el cual las *Tecnologías de la Información y la Comunicación (TICs)* actúan como habilitadores estratégicos orientados a resolver las demandas ciudadanas con mayor agilidad, cercanía y trazabilidad.

En el marco de la cátedra *Tecnología de la Información para la Gestión (TIG)* del CURZAS (Universidad Nacional del Comahue), el presente informe aborda el **Tema 2** propuesto en las consignas de la Actividad Práctica 4: **Nación - Neuquén**. 

#callout[
  *Objetivo Académico:* Seleccionar el Tema 2, brindar una descripción analítica profunda de los portales gubernamentales de referencia y estructurar una matriz comparativa rigurosa entre las políticas y dimensiones estratégicas de la Administración Pública Nacional y las iniciativas subnacionales implementadas en la ciudad de Neuquén. Asimismo, se incorporan las directrices metodológicas de procesamiento de textos recomendadas institucionalmente (manejo de estilos jerárquicos de párrafo, secciones diferenciadas, automatización de índices y colaboración documental).
]

#v(4pt)
La selección del binomio **Nación - Neuquén** reviste un particular interés para la gestión pública por dos razones fundamentales:
1. **Articulación Multinivel (Federal vs. Local):** Permite contrastar una visión nacional orientada al establecimiento de marcos normativos macro, estándares rectores de interoperabilidad y observatorios de investigación (INAP), frente a una gestión local y municipal orientada a la prestación directa e inmediata de servicios al vecino, la digitalización de trámites territoriales y la construcción de un ecosistema urbano inteligente (*Smart City*).
2. **Contexto Regional Norpatagónico:** Neuquén conforma el epicentro socioeconómico de la cuenca neuquina y la región del Comahue, donde el crecimiento demográfico acelerado demanda una administración municipal capaz de responder con infraestructura digital, agilidad en trámites comerciales y simplificación tributaria.

---

// ==============================================================================
// SECCIÓN 2: DESCRIPCIÓN ANALÍTICA DE LOS PORTALES BASE
// ==============================================================================
#h1[2. Descripción Analítica de los Portales Base]

A partir de los enlaces oficiales provistos en la consigna docente, se procedió a relevar, inspeccionar y categorizar los componentes estructurales, funcionales e informacionales de ambos sitios web.

#h2[2.1. Portal Nacional: Observatorio de la Administración Pública (INAP)]

#text(fill: text-muted, style: "italic")[
  Fuente: Ministerio de Desregulación y Transformación del Estado · Instituto Nacional de la Administración Pública (INAP)\
  Enlace oficial: #link("https://www.argentina.gob.ar/modernizacion/inap/observatorio/lineas-investigacion/modernizacion-del-estado")[argentina.gob.ar/.../modernizacion-del-estado]
]

El portal nacional analizado corresponde a la sección de **Líneas de Investigación en Modernización del Estado** del *Observatorio de la Administración Pública*, organismo dependiente del Instituto Nacional de la Administración Pública (INAP), actualmente bajo la órbita de la Secretaría de Transformación del Estado y Función Pública (Ministerio de Desregulación y Transformación del Estado).

#v(4pt)
A diferencia de un portal transaccional de trámites, este espacio cumple una función eminentemente analítica, conceptual y de monitoreo de políticas públicas. Su propósito medular es brindar una propuesta metodológica de dimensiones e indicadores empíricos que permitan evaluar el avance de la modernización estatal en Argentina. El portal organiza su esquema de trabajo en cuatro dimensiones fundamentales:

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    #block(
      fill: rgb("#f4f8fa"),
      stroke: (left: 3.5pt + primary, rest: 0.5pt + border-subtle),
      inset: 9pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[A. Gobierno Digital]\
        #v(2pt)
        Enfocado en la capacidad del aparato estatal para operar en entornos digitales integrados:
        - *Interoperabilidad:* Capacidad técnica y normativa para que diferentes organismos compartan información sin redundancias.
        - *Coordinación y Cooperación:* Redes interministeriales y federales de gestión pública.
        - *Diseño Institucional:* Mapeo de transacciones, cobertura geográfica y volumen de trámites digitales.
      ]
    )
    #v(6pt)
    #block(
      fill: rgb("#fdf8f4"),
      stroke: (left: 3.5pt + orange-accent, rest: 0.5pt + border-subtle),
      inset: 9pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: orange-accent)[B. País Digital]\
        #v(2pt)
        Orientado a reducir la brecha digital y garantizar la equidad de acceso en el territorio:
        - *Cobertura Geográfica:* Puntos de acceso Wi-Fi público y tendido de conectividad.
        - *Equipamiento e Inclusión:* Ratios de computadoras y dispositivos móviles por habitante.
        - *Nivel de Uso y Digitalización:* Apropiación comunitaria de las tecnologías.
      ]
    )
  ],
  [
    #block(
      fill: rgb("#f4f8fa"),
      stroke: (left: 3.5pt + teal-accent, rest: 0.5pt + border-subtle),
      inset: 9pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: teal-accent)[C. Gobierno Abierto]\
        #v(2pt)
        Centrado en la democratización del acceso a los asuntos públicos:
        - *Relación Estado y Sociedad Civil:* Mecanismos de co-creación y participación ciudadana.
        - *Marcos Normativos:* Cumplimiento de la Carta Iberoamericana de Gobierno Abierto.
        - *Compromisos Internacionales:* Alianza para el Gobierno Abierto (OGP) y estándares de la OCDE.
      ]
    )
    #v(6pt)
    #block(
      fill: rgb("#fdf8f4"),
      stroke: (left: 3.5pt + primary, rest: 0.5pt + border-subtle),
      inset: 9pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[D. Modernización Administrativa]\
        #v(2pt)
        Dirigido a la reingeniería interna y la eficiencia procedimental:
        - *Gestión Documental Electrónica (GDE):* Despapelización de expedientes y actos administrativos.
        - *Trazabilidad Documental:* Métricas sobre cantidad de documentos y firmas electrónicas.
        - *Tiempos de Resolución:* Reducción de plazos en expedientes y simplificación regulatoria.
      ]
    )
  ]
)

#h2[2.2. Portal Subnacional: Secretaría de Modernización (Ciudad de Neuquén)]

#text(fill: text-muted, style: "italic")[
  Fuente: Municipalidad de Neuquén · Secretaría de Modernización\
  Enlace oficial: #link("https://www.neuquencapital.gov.ar/secretaria-de-modernizacion/")[neuquencapital.gov.ar/secretaria-de-modernizacion/]
]

El portal analizado corresponde al área ejecutiva de modernización de la Municipalidad de Neuquén Capital, encabezada por el Secretario Lic. Javier Labrín. A diferencia de la página nacional de investigación del INAP, este portal posee una arquitectura orientada a la **acción operativa, la ventanilla digital y la interacción cotidiana con el vecino**.

La Secretaría de Modernización de Neuquén se organiza orgánicamente en tres áreas operativas fundamentales:
1. **Subsecretaría de Tecnologías:** Responsable de la infraestructura de redes, telecomunicaciones, servidores, ciberseguridad y el soporte técnico del parque informático municipal.
2. **Subsecretaría de Sistemas:** Encargada del diseño, desarrollo, implementación y mantenimiento del software de gestión interna y las plataformas web ciudadanas.
3. **Subsecretaría de Gestión Operativa:** Focalizada en la optimización de procesos administrativos, la coordinación de la ventanilla de atención y la modernización de los circuitos de atención al público.

#v(4pt)
Entre las principales herramientas, sistemas y servicios integrados que expone el portal se destacan:

- **Ecosistema de Trámites Web (`WebLogin Neuquén`):** Plataforma de identidad digital ciudadana mediante la cual se unifica el acceso a trámites esenciales: gestión de la licencia de conducir con cursos teóricos virtuales, liquidación y pago online de tributos municipales, bolsa de empleo (*Impulsa - Red Digital de Empleo*), inscripción a ferias, carnet digital de manipulador de alimentos y registro del cupo laboral trans.
- **Sistema de Información Territorial Urbano de Neuquén (`SITUN`):** Potente plataforma de catastro digital y mapa interactivo georreferenciado que permite a profesionales y vecinos consultar zonificaciones, mensuras, obras particulares y trazados de servicios urbanos.
- **Sistema de Turnos Online:** Plataforma de turnero inteligente para Juzgados de Faltas (N° 1 y N° 2), castraciones y bienestar animal, licencias de conducir y cursos de manipulación segura de alimentos, eliminando filas físicas y ordenando la demanda.
- **Iniciativas Smart City y Ciudad Inteligente:** Gestión de tráfico inteligente con monitoreo en vivo, red de Zonas Wi-Fi públicas gratuitas distribuidas en plazas y balnearios, y la consolidación del **Polo Tecnológico de la Ciudad de Neuquén**, concebido como motor de articulación público-privada para la industria del conocimiento.
- **Transparencia y Normativa Abierta:** Acceso directo al Boletín Oficial Municipal digital y al Digesto de ordenanzas municipales, facilitando la auditoría ciudadana.

---

// ==============================================================================
// SECCIÓN 3: ANÁLISIS COMPARATIVO MULTIDIMENSIONAL
// ==============================================================================
#h1[3. Análisis Comparativo Multidimensional: Nación vs. Neuquén]

Al contrastar ambas plataformas gubernamentales, se evidencia que representan dos eslabones complementarios del federalismo argentino: por un lado, el diseño estratégico y la fijación de estándares a nivel central; por el otro, la ejecución directa de soluciones de proximidad comunitaria.

#v(4pt)
#align(center)[
  #table(
    columns: (115pt, 175pt, 185pt),
    stroke: 0.5pt + border-subtle,
    fill: (col, row) => if row == 0 { primary } else if calc.even(row) { rgb("#f8fafc") } else { white },
    align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
    
    [#text(weight: "bold", fill: white)[Dimensión de Análisis]],
    [#text(weight: "bold", fill: white)[Nivel Nacional (INAP · Nación)]],
    [#text(weight: "bold", fill: white)[Jurisdicción Local (Neuquén Capital)]],
    
    [*Nivel de Gobierno y Misión Institucional*],
    [Nivel federal. Diseña lineamientos, marcos rectores, indicadores estadísticos e investigación de políticas públicas para la Administración Pública Nacional (APN).],
    [Nivel municipal / subnacional. Ejecución directa, prestación de servicios de cercanía, infraestructura urbana y resolución de problemas cotidianos de la ciudadanía.],
    
    [*Enfoque del Portal Web*],
    [Observatorio analítico y conceptual. Centrado en la generación de conocimiento, publicaciones académicas y propuestas de medición institucional.],
    [Portal operativo y transaccional. Centrado en la ventanilla única virtual (`WebLogin`), turnero digital y mapa de servicios en territorio.],
    
    [*Gobierno Digital e Interoperabilidad*],
    [Impulsa la interoperabilidad federal, estándares de intercambio de datos, firma digital y plataformas transversales como TAD y Mi Argentina.],
    [Implementa plataformas de gestión local interoperadas internamente: Catastro SITUN, Tribunal de Faltas, Cobranzas y Trámites Web.],
    
    [*País Digital vs. Smart City*],
    [Aborda la brecha digital macro: conectividad geográfica federal, tendido troncal, puntos Wi-Fi nacionales y métricas de computadoras por habitante.],
    [Aplica el concepto de *Ciudad Inteligente*: cámaras en vivo, Zonas Wi-Fi municipales en espacios verdes, gestión de tráfico inteligente y Polo Tecnológico.],
    
    [*Modernización Administrativa y Procesos*],
    [Focalizado en el Sistema de Gestión Documental Electrónica (GDE), expediente electrónico de compras públicas y reducción de tiempos ministeriales.],
    [Focalizado en la ventanilla única de trámites municipales, despapelización de licencias, agrimensura, habilitaciones comerciales y digesto digital.],
    
    [*Gobierno Abierto y Participación*],
    [Alineado con compromisos internacionales: Alianza para el Gobierno Abierto (OGP), Carta Iberoamericana y estándares de transparencia de la OCDE.],
    [Enfocado en la transparencia de proximidad: Boletín Oficial digital, portal tributario abierto, participación comunitaria en ferias y empleo local.],
    
    [*Capacitación del Talento Humano*],
    [Formación masiva de funcionarios federales a través del INAP, carreras de administración pública y gestión por competencias.],
    [Capacitación operativa de agentes municipales y formación directa a ciudadanos (cursos de seguridad vial, manipulación de alimentos).],
  )
]

#v(8pt)
#h2[3.1. Convergencias y Puntos de Encuentro]

A pesar de sus diferencias de escala y ámbito jurisdiccional, ambos modelos convergen en principios rectores indiscutibles:
- **Ciudadano como Centro del Ecosistema:** Tanto el marco del INAP como los desarrollos de Neuquén Capital coinciden en que la modernización no debe concebirse como un fin autorreferencial del Estado, sino como un medio para garantizar derechos y simplificarle la vida al administrado.
- **Abandono Definitivo del Soporte Papel:** El sistema GDE a nivel nacional y las plataformas de expedientes digitales y licencias online en Neuquén demuestran que la despapelización es una meta consolidada e irreversible.
- **Uso Intensivo de Datos Georreferenciados:** Mientras Nación mide la distribución espacial de la conectividad, Neuquén utiliza el sistema territorial `SITUN` para vincular catastro, zonificación y obras con geolocalización de precisión.

#h2[3.2. Asimetrías y Desafíos de Integración Federal]

El análisis comparativo también devela tensiones y asimetrías estructurales:
- **Desconexión entre Marcos Conceptuales y Aplicación Práctica:** Mientras el portal del INAP presenta una taxonomía refinada de indicadores, los municipios frecuentemente operan bajo urgencias presupuestarias que dificultan la medición científica de sus tiempos de respuesta.
- **Interoperabilidad Federal-Municipal Incompleta:** Con frecuencia, los sistemas locales (`WebLogin Neuquén`) y los sistemas nacionales (`Mi Argentina`, Registro Nacional de las Personas - RENAPER, Agencia Nacional de Seguridad Vial) requieren procesos de doble carga o validaciones manuales debido a la falta de APIs gubernamentales unificadas y acuerdos federales estables.

---

// ==============================================================================
// SECCIÓN 4: BUENAS PRÁCTICAS DE EDICIÓN Y FORMATO DOCUMENTAL
// ==============================================================================
#h1[4. Metodología de Formato y Procesamiento de Textos Académicos]

De acuerdo con las consignas de la Actividad 4 y la guía técnica provista por la cátedra (*Formato de texto en Google Docs*), el dominio de un procesador de textos profesional no consiste únicamente en saber redactar texto plano, sino en comprender y aplicar una **metodología de estructura inteligente**.

#callout(bg: "fdf2e9", left-color: "c1741f")[
  *Regla de Oro del Formato Académico:* Nunca debe aplicarse formato manual (cambiar individualmente tamaño, color o negrita de cada párrafo). El formateo manual genera inconsistencias, destruye la trazabilidad y anula la automatización del documento. Todo cambio debe gestionarse actualizando el *estilo predefinido* correspondiente.
]

#h2[4.1. Jerarquía de Estilos de Párrafo]

En entornos como Google Docs o Microsoft Word, los estilos de texto cumplen funciones jerárquicas indelegables:
1. **Título y Subtítulo:** Reservados exclusivamente para la portada o encabezado mayor del informe.
2. **Encabezado 1 (Heading 1):** Delimita las secciones maestras del documento (Capítulos o Temas Principales). Es el nivel que estructura el índice general.
3. **Encabezado 2 (Heading 2):** Subdivide las secciones en áreas temáticas específicas (ej. 2.1 Portal Nacional, 2.2 Portal Neuquén).
4. **Encabezado 3 (Heading 3):** Detalla aspectos analíticos puntuales o dimensiones desagregadas.
5. **Texto Normal:** Define la tipografía base, tamaño (9.5pt a 10pt), color neutro de lectura y espaciado entre párrafos e interlineado regular (1.15 a 1.25 en Word/Docs; 0.65em a 0.7em en Typst).

#h2[4.2. Automatización del Índice y Paginación Desvinculada]

La aplicación correcta de los estilos de encabezado permite la inserción de un **Índice / Tabla de Contenidos Automático** mediante la opción `Insertar > Índice`. Este elemento no solo calcula con exactitud matemática el número de página de cada sección, sino que ofrece hipervínculos internos para la navegación digital del documento.

Asimismo, la técnica de configuración de **saltos de sección desvinculados** (`Insertar > Salto > Salto de sección siguiente`) permite aislar la portada:
- **Sección 1 (Portada / Carátula):** Se configuran encabezado y pie de página en blanco (`Primera página diferente` activada), eliminando cualquier número de página visible.
- **Sección 2 (Cuerpo del Documento):** Se desvincula la sección anterior (`Vincular al anterior: desactivado`) y se inserta el contador de páginas iniciando en la página 2 con el formato institucional `Página X de Y`, incorporando el logotipo y los metadatos de la asignatura.

#h2[4.3. Trabajo Colaborativo en la Nube y Control de Versiones]

Dado que la consigna estipula que la actividad es colaborativa, las plataformas en la nube (como Google Docs o Word en Microsoft 365) aportan capacidades críticas para la gestión del conocimiento:
- **Historial de Versiones:** Permite auditar qué estudiante redactó cada bloque, revertir cambios accidentales y documentar la evolución del trabajo.
- **Modo Sugerencias y Comentarios:** Facilita la revisión por pares entre los integrantes del grupo sin alterar prematuramente el texto definitivo.
- **Permisos Granulares:** Asignación de roles de visualizador, comentador o editor para garantizar la seguridad del archivo antes de la entrega final.

---

// ==============================================================================
// SECCIÓN 5: CONCLUSIONES Y RECOMENDACIONES DE POLÍTICA PÚBLICA
// ==============================================================================
#h1[5. Conclusiones y Recomendaciones de Política Pública]

La investigación comparativa realizada entre el marco analítico nacional del INAP y la experiencia práctica de la Secretaría de Modernización de Neuquén Capital arroja valiosas conclusiones para la formación en gestión pública y tecnologías de la información:

1. **La Modernización es un Proceso Adaptativo y No Meramente Tecnológico:** Tanto a nivel federal como municipal, el éxito de la transformación digital no reside en la compra de servidores o en el diseño de páginas visualmente atractivas, sino en la reingeniería de los procesos burocráticos y en el acompañamiento del capital humano para vencer la resistencia cultural al cambio.
2. **Complementariedad Indispensable en el Federalismo:** No existe contradicción entre el enfoque macro del INAP y el enfoque micro de Neuquén Capital; son dos caras de la misma moneda. El nivel nacional debe garantizar autopistas de datos, interoperabilidad jurídica y pautas de gobernanza de datos abiertos; los gobiernos locales deben aprovechar esos estándares para construir soluciones de proximidad directa con el vecino.
3. **El Rol de la Ciudad Inteligente en la Patagonia:** La experiencia neuquina de incorporar semaforización inteligente, catastro digital `SITUN` y la creación del Polo Tecnológico demuestra que los gobiernos locales pueden liderar procesos de innovación territorial que exceden la mera administración de trámites, posicionando a la ciudad como un centro de atracción de talentos y empresas basadas en el conocimiento.
4. **Higiene Documental como Competencia Profesional:** La elaboración de este informe confirma que el manejo riguroso de procesadores de texto basados en estilos y estructuras de datos normalizadas (Docs-as-Code / Typst / Word avanzado) es una competencia indispensable para cualquier profesional de la gestión pública contemporánea.

---

#pagebreak()

// ==============================================================================
// SECCIÓN 6: REFERENCIAS BIBLIOGRÁFICAS Y FUENTES OFICIALES
// ==============================================================================
#h1[6. Referencias Bibliográficas y Fuentes Oficiales]

1. **Instituto Nacional de la Administración Pública (INAP) / Ministerio de Desregulación y Transformación del Estado** (2024). *Líneas de Investigación en Modernización del Estado - Observatorio de la Administración Pública*. Presidencia de la Nación Argentina. Disponible en: #link("https://www.argentina.gob.ar/modernizacion/inap/observatorio/lineas-investigacion/modernizacion-del-estado")[argentina.gob.ar/.../modernizacion-del-estado] (Acceso: Septiembre 2026).
2. **Municipalidad de Neuquén Capital** (2024). *Secretaría de Modernización: Subsecretarías de Tecnologías, Sistemas y Gestión Operativa*. Gobierno de la Ciudad de Neuquén. Disponible en: #link("https://www.neuquencapital.gov.ar/secretaria-de-modernizacion/")[neuquencapital.gov.ar/secretaria-de-modernizacion/] (Acceso: Septiembre 2026).
3. **Municipalidad de Neuquén Capital** (2024). *Plataforma de Trámites Web y Ventanilla Ciudadana WebLogin*. Disponible en: #link("https://weblogin.neuquencapital.gov.ar/")[weblogin.neuquencapital.gov.ar] (Acceso: Septiembre 2026).
4. **Sistema de Información Territorial Urbano de Neuquén (SITUN)** (2024). *Catastro digital y mapa interactivo georreferenciado*. Disponible en: #link("https://situn.muninqn.gov.ar/")[situn.muninqn.gov.ar] (Acceso: Septiembre 2026).
5. **Cátedra de Tecnología de la Información para la Gestión (TIG)** (2026). *Guía Experta para la Personalización y Formato de Documentos en Google Docs: Una Metodología para el Éxito Académico*. CURZAS, Universidad Nacional del Comahue.
6. **Centro Latinoamericano de Administración para el Desarrollo (CLAD)** (2016). *Carta Iberoamericana de Gobierno Abierto*. Aprobada por la XVII Conferencia Iberoamericana de Ministras y Ministros de Administración Pública y Reforma del Estado.
7. **Organización para la Cooperación y el Desarrollo Económicos (OCDE)** (2020). *Recomendación del Consejo sobre Estrategias de Gobierno Digital*. Publicaciones de la OCDE.
