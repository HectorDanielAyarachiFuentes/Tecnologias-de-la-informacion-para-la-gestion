// ==============================================================================
// UNIVERSIDAD NACIONAL DEL COMAHUE - CURZAS
// TECNOLOGÍA DE LA INFORMACIÓN PARA LA GESTIÓN (TIG)
// ACTIVIDAD 6 - TRABAJO PRÁCTICO: MAPEO SISTÉMICO ORGANIZACIONAL
// CASO DE ESTUDIO: HOSPITAL ÁREA PROGRAMA "DRA. CECILIA GRIERSON" DE CATRIEL
// ESTUDIANTES: Hector Daniel Ayarachi Fuentes | Andrea Alejandra Díaz | Ileana Avendaño | Lucas Curaqueo
// ==============================================================================

#set document(
  title: "Actividad 6 - Mapeo Sistémico Organizacional - Hospital Catriel",
  author: ("Hector Daniel Ayarachi Fuentes", "Andrea Alejandra Díaz", "Ileana Avendaño", "Lucas Curaqueo"),
)

// Tipografía y espaciado base según estándares institucionales
#set text(font: "Arial", size: 9.8pt, fill: rgb("#1f2933"), lang: "es")
#set par(justify: true, leading: 0.68em)

// Paleta cromática oficial (AGENTS.md)
#let primary = rgb("#153e5c")        // Azul petróleo institucional
#let teal-accent = rgb("#0e6873")    // Teal institucional
#let orange-accent = rgb("#c1741f")  // Terracota / Naranja acento
#let text-main = rgb("#1f2933")      // Texto principal
#let text-muted = rgb("#4b6575")     // Texto secundario
#let border-subtle = rgb("#b7c9d6")  // Borde suave
#let bg-card = rgb("#f2f7f7")        // Fondo suave teal
#let bg-alert = rgb("#fdf2e9")       // Fondo cálido naranja
#let bg-table-header = rgb("#0e6873") // Encabezado de tabla institucional

// Estilos de títulos y encabezados
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

// Componentes destacados (Callouts y Notas)
#let callout(body, bg: "f2f7f7", border-color: "b7c9d6", left-color: "0e6873") = block(
  width: 100%,
  breakable: false,
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

#let alerta(body) = block(
  width: 100%,
  breakable: false,
  fill: rgb("fdf6ee"),
  stroke: (left: 4pt + orange-accent, rest: 0.6pt + border-subtle),
  inset: (x: 11pt, y: 8pt),
  radius: (right: 3pt),
  above: 9pt,
  below: 11pt,
  text(size: 9.2pt, body),
)

#show table.cell: set par(justify: false, leading: 0.55em)
#show table.cell: set text(size: 8.8pt)

// ==============================================================================
// 1. CARÁTULA INSTITUCIONAL (PORTADA OFICIAL)
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
        height: 98%,
        fill: teal-accent,
        radius: 2pt,
      )
    ],
    [
      #v(6pt)
      // Logotipo oficial de CURZAS en tamaño destacado
      #image("../../recursos/Logotipo de curzas/CURZAS.png", width: 135pt)
      
      #v(12pt)
      // Barra de acento naranja
      #rect(
        width: 100%,
        height: 4pt,
        fill: orange-accent,
        radius: 1pt,
      )
      
      #v(16pt)
      
      // Título Principal
      #text(size: 20pt, weight: "bold", fill: primary)[
        TRABAJO PRÁCTICO:\ MAPEO SISTÉMICO ORGANIZACIONAL
      ]
      
      #v(6pt)
      
      // Subtítulo
      #text(size: 11.8pt, fill: text-muted, style: "italic")[
        Aplicación de la Teoría General de Sistemas (TGS) al Proceso de Reclutamiento, Selección e Incorporación de Personal de Salud en el Hospital Área Programa "Dra. Cecilia Grierson" de Catriel
      ]
      
      #v(18pt)
      
      // Cuadro de Resumen Ejecutivo y Síntesis
      #block(
        width: 100%,
        fill: bg-card,
        stroke: (left: 4.5pt + teal-accent, rest: 0.6pt + border-subtle),
        inset: (x: 12pt, y: 10pt),
        radius: (right: 4pt),
        [
          #text(weight: "bold", fill: primary, size: 8.8pt, tracking: 0.08em)[SÍNTESIS DE LA ACTIVIDAD PRÁCTICA]\
          #v(3pt)
          #text(size: 8.9pt, fill: text-main)[
            El presente informe desarrolla el mapeo sistémico integral del *Hospital Área Programa Catriel "Dra. Cecilia Grierson"* (Río Negro), focalizando en el subsistema de Gestión de Recursos Humanos y específicamente en el *Proceso de Reclutamiento, Selección e Incorporación de Personal*. Se analizan los límites y fronteras del sistema, sus recursos estratégicos, las entradas requeridas, las fases de transformación operativa, las salidas prestacionales y los circuitos de retroalimentación (feedback) correctivo. Todo ello enmarcado en el contexto socioeconómico y sanitario del norte rionegrino y la normativa pública provincial (Leyes Provinciales N° 1904 y 1844).
          ]
        ],
      )
      
      #v(36pt)
      
      // Metadatos institucionales y autoría
      #block(
        width: 100%,
        stroke: (top: 0.7pt + border-subtle),
        inset: (top: 14pt),
        [
          #grid(
            columns: (160pt, 1fr),
            row-gutter: 10pt,
            text(size: 8.8pt, weight: "bold", fill: text-muted)[INSTITUCIÓN:],
            text(size: 9.1pt, weight: "semibold", fill: primary)[CURZAS · Universidad Nacional del Comahue],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ESPACIO CURRICULAR:],
            text(size: 9.1pt, fill: text-main)[Tecnología de la Información para la Gestión (TIG)],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[CARRERAS:],
            text(size: 9.1pt, fill: text-main)[Licenciatura en Recursos Humanos / Tec. y Lic. en Adm. Pública],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ORGANIZACIÓN ELEGIDA:],
            text(size: 9.1pt, weight: "semibold", fill: teal-accent)[Hospital Área Catriel "Dra. Cecilia Grierson" (Complejidad IV)],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[EQUIPO DE ESTUDIANTES:],
            [
              #text(size: 9.1pt, weight: "bold", fill: primary)[Hector Daniel Ayarachi Fuentes]\
              #text(size: 9.1pt, weight: "bold", fill: primary)[Andrea Alejandra Díaz]\
              #text(size: 9.1pt, weight: "bold", fill: primary)[Ileana Avendaño]\
              #text(size: 9.1pt, weight: "bold", fill: primary)[Lucas Curaqueo]
            ],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[FECHA DE ENTREGA:],
            text(size: 9.1pt, fill: text-main)[Octubre de 2026],
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
      text(size: 8pt, fill: rgb("#627d91"), weight: "semibold")[CURZAS · Tecnologías de la Información para la Gestión],
      text(size: 8pt, fill: rgb("#627d91"))[Actividad 6 · Mapeo Sistémico Hospital Catriel],
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
      text(size: 8pt, fill: rgb("#627d91"))[H.A.P. Catriel "Dra. Cecilia Grierson"],
      image("../../recursos/Logotipo de curzas/CURZAS.png", height: 12pt),
      text(size: 8pt, fill: rgb("#627d91"))[
        #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
      ],
    )
  ],
)

// ==============================================================================
// PLANTILLA FORMAL DE TRABAJO PRÁCTICO (ENCABEZADO DE CÁTEDRA)
// ==============================================================================
#align(center)[
  #text(size: 8.5pt, fill: text-muted, weight: "semibold")[
    Tecnologías de la Información / Tecnologías de la Información para la Gestión\
    Unidad: Sistemas de Información y Organizaciones | Guía Práctica
  ]
  #v(4pt)
  #text(size: 13.5pt, weight: "bold", fill: primary)[
    PLANTILLA DE TRABAJO PRÁCTICO\
    MAPEO SISTÉMICO ORGANIZACIONAL
  ]
]

#v(6pt)
#line(length: 100%, stroke: 0.8pt + teal-accent)
#v(6pt)

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: bg-card,
  inset: (x: 14pt, y: 10pt),
  radius: 4pt,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 14pt,
    row-gutter: 6pt,
    text(weight: "bold", fill: primary)[Materia:],
    text(fill: text-main)[Tecnologías de la Información para la Gestión],
    
    text(weight: "bold", fill: primary)[Tema:],
    text(fill: text-main)[Sistemas de Información y Mapeo Sistémico],
    
    text(weight: "bold", fill: primary)[Carrera:],
    text(fill: text-main)[Lic. en Recursos Humanos / Tec. y Lic. en Adm. Pública],
    
    text(weight: "bold", fill: primary)[Organización:],
    text(fill: text-main)[Hospital Área Programa Catriel "Dra. Cecilia Grierson"],
  )
]

#v(8pt)

// ==============================================================================
// 1. DATOS DEL EQUIPO Y ORGANIZACIÓN SELECCIONADA
// ==============================================================================
= 1. Datos del Equipo y Organización Seleccionada

#table(
  columns: (1fr),
  fill: (col, row) => if row == 0 { bg-table-header } else if calc.odd(row) { bg-card } else { white },
  stroke: 0.5pt + border-subtle,
  align: left + horizon,
  table.header(
    text(weight: "bold", fill: white)[Nombre y Apellido del Estudiante],
  ),
  [Estudiante 1: *Hector Daniel Ayarachi Fuentes*],
  [Estudiante 2: *Andrea Alejandra Díaz*],
  [Estudiante 3: *Ileana Avendaño*],
  [Estudiante 4: *Lucas Curaqueo*],
  [Estudiante 5: #text(fill: text-muted)[(Cupo no utilizado / Equipo de 4 integrantes)]],
  [Estudiante 6: #text(fill: text-muted)[(Cupo no utilizado / Equipo de 4 integrantes)]],
)

#v(8pt)

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: bg-card,
  inset: 10pt,
  radius: 3pt,
)[
  #text(weight: "bold", fill: primary, size: 9.5pt)[Organización / Proceso Seleccionado:]\
  #text(style: "italic", size: 8.5pt, fill: text-muted)[(Ej. Lic. Adm. Pública: Oficina Municipal de Licencias de Conducir / Ej. Lic. RRHH: Proceso de Reclutamiento y Selección)]\
  #v(4pt)
  #text(weight: "bold")[👉 Respuesta:] *Hospital Área Programa "Dra. Cecilia Grierson" de Catriel, Río Negro* / *Proceso Integral de Reclutamiento, Selección e Incorporación de Personal de Salud (Médicos, Enfermeros y Personal Técnico)* bajo el régimen estatutario de las Leyes Provinciales N° 1904 y N° 1844.
]

#pagebreak()

// ==============================================================================
// 2. ¿CÓMO SE ORGANIZA LA ENTIDAD? (ESTRUCTURA Y ORGANIGRAMA DEL HOSPITAL)
// ==============================================================================
= 2. ¿Cómo nos organizamos? Estructura Organizativa del Hospital de Catriel

Para responder a la pregunta central de _"¿Cómo nos organizamos?"_, se analiza la arquitectura funcional y la división formal del trabajo del *Hospital Área Programa "Dra. Cecilia Grierson"* de Catriel, conforme a la normativa sanitaria vigente en la Provincia de Río Negro (Resolución Ministerial N° 746/86, Ley Provincial N° 1904 de Carrera Hospitalaria y Ley Provincial N° 1844):

#v(2pt)

== 2.1. Organigrama Funcional y Líneas Jerárquicas
El hospital responde a un modelo departamentalizado por especialidades y niveles de atención sanitaria, estructurado de la siguiente manera:

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #block(
      width: 100%,
      fill: white,
      stroke: (left: 3pt + primary, rest: 0.5pt + border-subtle),
      inset: 8pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[1. Dirección Ejecutiva y Conducción]\
        #v(2pt)
        *Autoridad Máxima:* Dirección Médica del Hospital (a cargo del Dr. Miguel Bellido).\
        - Representación institucional ante el Ministerio de Salud de Río Negro y la comunidad.
        - Definición de políticas sanitarias locales y asignación de partidas presupuestarias.
        - Asesorado por el *Comité de Docencia e Investigación* y el *Comité de Bioética y Seguridad*.
      ]
    )
    
    #v(4pt)
    
    #block(
      width: 100%,
      fill: white,
      stroke: (left: 3pt + teal-accent, rest: 0.5pt + border-subtle),
      inset: 8pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[2. D.A.P.A. (Primer Nivel de Atención)]\
        #v(2pt)
        *Depto. de Actividades Programadas para el Área:*
        - Red de Centros de Atención Primaria de la Salud (*CAPS*: Barrios Lote 6, Santa Cruz, 4 Esquinas, etc.).
        - Cuerpo de *Agentes Sanitarios* para rondas domiciliarias y relevamiento en terreno.
        - Programas de Vacunación, Odontología Preventiva y Salud Escolar.
        - Dispositivo intermedio: *"Casita de Salud Mental Comunitaria"* (adicciones y problemáticas psicosociales).
      ]
    )
    
    #v(4pt)
    
    #block(
      width: 100%,
      fill: white,
      stroke: (left: 3pt + rgb("#3d8b37"), rest: 0.5pt + border-subtle),
      inset: 8pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[3. Departamento de Enfermería]\
        #v(2pt)
        - Jefatura Central de Enfermería y supervisores de turno.
        - Cuidados críticos en Shock Room y guardia activa 24 hs.
        - Enfermería de piso en internación general y cuidados perioperatorios.
        - Coordinación del plantel de enfermeros en los CAPS periféricos.
      ]
    )
  ],
  [
    #block(
      width: 100%,
      fill: white,
      stroke: (left: 3pt + orange-accent, rest: 0.5pt + border-subtle),
      inset: 8pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[4. Departamento de Atención Médica]\
        #v(2pt)
        *Segundo Nivel y Atención Hospitalaria:*
        - *Guardia Central y Shock Room 24 hs:* Atención continua de código rojo y emergencias.
        - *Consultorios Externos:* Pediatría, Clínica Médica, Ginecología, Obstetricia, Cardiología.
        - *Centro Quirúrgico:* 2 quirófanos modernos para cirugías programadas y de urgencia.
        - *Maternidad y Neonatología:* Salas de preparto, parto humanizado y nursery.
      ]
    )
    
    #v(4pt)
    
    #block(
      width: 100%,
      fill: white,
      stroke: (left: 3pt + rgb("#8e44ad"), rest: 0.5pt + border-subtle),
      inset: 8pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[5. Servicios Técnicos Complementarios]\
        #v(2pt)
        - *Laboratorio de Análisis Clínicos* y Servicio de Hemoterapia / Banco de Sangre.
        - *Diagnóstico por Imágenes:* Radiología Digital y Ecografía general/obstétrica.
        - *Farmacia Hospitalaria:* Gestión, custodia y fraccionamiento de medicamentos esenciales.
        - *Central de Esterilización* de instrumental quirúrgico.
      ]
    )
    
    #v(4pt)
    
    #block(
      width: 100%,
      fill: white,
      stroke: (left: 3pt + rgb("#c0392b"), rest: 0.5pt + border-subtle),
      inset: 8pt,
      radius: (right: 3pt),
      [
        #text(weight: "bold", fill: primary)[6. Depto. Administrativo y Recursos Humanos]\
        #v(2pt)
        - *División Personal / RRHH:* Reclutamiento, legajos, liquidación de haberes, guardias y radicación de profesionales.
        - *Oficina S.A.M.I.:* Facturación a Obras Sociales (OSPE, OSDE, IPROSS) y ART petroleras.
        - *Compras y Suministros:* Abastecimiento de insumos biomédicos.
        - *Servicios Generales:* Flota de ambulancias, choferes, mantenimiento edilicio y cocina.
      ]
    )
  ]
)

#v(4pt)

== 2.2. Coordinación del Equipo de Estudio Universitario
Para relevar este sistema, el equipo de estudiantes de la Universidad Nacional del Comahue distribuyó sus roles:
#text(size: 8.5pt)[
- *Hector Daniel Ayarachi Fuentes & Lucas Curaqueo:* Coordinación general, relevamiento institucional, estructura sanitaria rionegrina y maquetación tipográfica.
- *Andrea Alejandra Díaz & Ileana Avendaño:* Análisis sistémico de Recursos Humanos, diseño de entradas, proceso de selección, salidas y circuito de retroalimentación.
]

// ==============================================================================
// 3. CARACTERIZACIÓN INTEGRAL DE LA ORGANIZACIÓN
// ==============================================================================
= 3. La Organización: Hospital Área "Dra. Cecilia Grierson" de Catriel

== 3.1. Identidad, Historia y Ubicación
El *Hospital Área Programa "Dra. Cecilia Grierson"* se emplaza en la ciudad de *Catriel* (Av. Mosconi 1669), en el extremo noroeste de la provincia de Río Negro. Su nuevo y moderno edificio fue inaugurado oficialmente el *13 de noviembre de 2020*, marcando un hito sanitario para la comunidad regional. La obra fue financiada íntegramente con fondos provinciales derivados de la renegociación de contratos petroleros, con una inversión superior a los \$450 millones de pesos en obra edilicia y más de \$80 millones en equipamiento biomédico e informático de alta tecnología.

Lleva su nombre en homenaje a la *Dra. Cecilia Grierson*, la primera mujer médica de la República Argentina, pionera de la obstetricia, ginecología y de las escuelas de enfermería en nuestro país.

== 3.2. Complejidad Sanitaria y Cobertura Operativa
El hospital está categorizado como un establecimiento de *Nivel de Complejidad Sanitaria IV*, cumpliendo funciones de atención primaria, emergencias, internación general y resolución quirúrgica intermedia:
- *Área de Cobertura:* Brinda cobertura directa a más de *40.000 habitantes* de la ciudad de Catriel y sus zonas rurales y productivas aledañas (Peñas Blancas, Valle Verde y destacamentos petroleros).
- *Instalaciones y Servicios:* Cuenta con sala de guardia y shock room con atención 24 hs, dos quirófanos de última generación, salas de preparto y parto humanizado, nursery, neonatología, diagnóstico por imágenes (radiología digital y ecografía), laboratorio de análisis clínicos y hemoterapia, kinesiología, vacunatorio, consultorios externos (pediatría, ginecología, clínica médica, cardiología) y farmacia hospitalaria.
- *Dispositivo Comunitario de Salud Mental:* Posee una estructura intermedia específica denominada *"Casita de Salud Mental Comunitaria"*, orientada al abordaje interdisciplinario de problemáticas psicosociales y consumos problemáticos.

== 3.3. Objetivos y Metas Organizacionales
1. *Misión Sanitaria:* Garantizar el derecho inalienable a la salud integral de la población de Catriel y su zona de influencia, mediante servicios preventivos, asistenciales y de rehabilitación con equidad, calidez humana y rigor científico.
2. *Meta de Autosuficiencia Regional:* Reducir al mínimo las derivaciones de pacientes hacia centros de mayor complejidad en el Alto Valle (Cipolletti, General Roca o Neuquén Capital), resolviendo patologías quirúrgicas y de internación localmente.
3. *Objetivos Estratégicos del Subsistema de Recursos Humanos:*
  - Atraer, incorporar y fidelizar profesionales de la salud en especialidades críticas (pediatría, ginecología, cirugía general y clínica médica).
  - Gestionar programas de arraigo y bienestar laboral mediante la articulación de viviendas institucionales y adicionales de zona desfavorable.
  - Asegurar la cobertura continua y sin interrupciones del plantel médico de guardia y de enfermería profesional.

== 3.4. Recursos Estratégicos de la Organización
En el marco de la Teoría General de Sistemas, la institución moviliza cuatro tipos fundamentales de recursos:
- *Recursos Humanos:* Equipo directivo (a cargo de la Dirección Médica), jefaturas de servicios médicos y de enfermería, médicos especialistas, licenciados en enfermería, técnicos en imágenes y laboratorio, asistentes sociales, psicólogos, personal de maestranza, choferes de ambulancia y el equipo técnico-administrativo de Recursos Humanos / Personal.
- *Recursos Físicos e Infraestructura:* Edificio monovalente moderno sobre Av. Mosconi, equipamiento biomédico de soporte vital (respiradores, videolaringoscopios, monitores multiparamétricos, mesas de cirugía), flota de ambulancias de traslado de alta complejidad y módulo habitacional institucional para profesionales médicos radicados.
- *Recursos Tecnológicos y de Información:* Sistemas hospitalarios de registro de historias clínicas, plataforma de correo y expediente digital de la provincia de Río Negro, sistema informático de recupero de fondos SAMI (Sistema de Atención Médica Integral), y conectividad para telemedicina y consultas especializadas a distancia.
- *Recursos Financieros:* Partidas presupuestarias anuales del Tesoro Provincial asignadas por el Ministerio de Salud de Río Negro, fondos autogestionados mediante facturación a obras sociales y ART (Fondo SAMI), y aportes extraordinarios por fondos hidrocarburíferos.

#v(12pt)

// ==============================================================================
// 4. MATRIZ DE COMPONENTES SISTÉMICOS (PUNTO 2 DE LA GUÍA OFICIAL)
// ==============================================================================
= 4. Matriz de Componentes Sistémicos

#block(
  width: 100%,
  fill: rgb("#f1f5f9"),
  stroke: (left: 3pt + primary),
  inset: (x: 10pt, y: 7pt),
  radius: (right: 3pt),
)[
  #text(weight: "bold", fill: primary, size: 10.5pt)[2. MATRIZ DE COMPONENTES SISTÉMICOS]\
  #text(size: 8.5pt, fill: text-muted)[Estructura idéntica a la plantilla oficial de trabajo práctico de la cátedra para el caso del *Hospital Área Programa "Dra. Cecilia Grierson"* de Catriel.]
]

#v(6pt)

#table(
  columns: (1.5fr, 3.5fr),
  fill: (col, row) => if row == 0 { bg-table-header } else if col == 0 { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (left + top, left + top),
  table.header(
    text(weight: "bold", fill: white)[Componente Sistémico],
    text(weight: "bold", fill: white)[Descripción y Elementos Concretos del Caso],
  ),
  
  [#text(weight: "bold", fill: primary)[FRONTERA / LÍMITE DEL SISTEMA]],
  [
    #text(style: "italic", fill: rgb("#334155"))[Definan con precisión qué actividades y recursos están DENTRO del control directo de la oficina/área y cuáles pertenecen al entorno externo.]\
    #v(4pt)
    #text(weight: "bold")[👉 Respuesta:]\
    - *Dentro del control directo del Hospital / Oficina de RRHH:* Detección interna de vacantes asistenciales por servicio; confección del perfil de competencias médicas y técnicas requerido; recepción local de CVs; realización de entrevistas laborales; aplicación de pruebas técnicas y valoraciones psicotécnicas; diseño del plan de inducción hospitalaria; asignación de turnos, guardias y cupos en módulos habitacionales institucionales; evaluación del desempeño durante el período de prueba.
    - *Fuera del control (Entorno externo):* Disponibilidad de médicos especialistas en el mercado laboral nacional; presupuesto asignado por el Ministerio de Economía de Río Negro; escala salarial fijada por paritarias provinciales; costo de los alquileres en Catriel; dictado del Decreto/Resolución formal de designación por el Poder Ejecutivo Provincial; otorgamiento de matrícula por el Consejo Provincial de Salud Pública.
  ],
  
  [
    #text(weight: "bold", fill: primary)[ENTRADAS]\
    #text(weight: "bold", fill: primary)[(Inputs)]
  ],
  [
    #text(style: "italic", fill: rgb("#334155"))[Listan los recursos humanos, materiales, financieros, normativos o solicitudes de datos que ingresan al proceso.]\
    #v(4pt)
    #text(weight: "bold")[👉 Respuesta:]\
    - *Solicitudes y postulaciones:* Currículum Vitae presentados espontáneamente o en respuesta a convocatorias provinciales (`convocatoriamedicarn@salud.rionegro.gov.ar`).
    - *Perfiles de puesto formales:* Descripciones de competencias médicas, técnicas y de enfermería solicitadas por las Jefaturas de Servicio (ej. Cirujano de guardia, Médico Pediatra).
    - *Documentación acreditante:* Título universitario legalizado, certificado de especialista, certificado de antecedentes penales, certificado de ética profesional del colegio médico de origen.
    - *Normativa y cupos autorizados:* Autorización formal de vacante presupuestaria por parte del Ministerio de Salud rionegrino bajo Ley Provincial N° 1904 o N° 1844.
    - *Insumos materiales y técnicos:* Protocolos de evaluación psicológica, formularios de legajo personal, recursos tecnológicos de evaluación remota (videoconferencia para candidatos de otras provincias).
  ],
  
  [#text(weight: "bold", fill: primary)[PROCESO DE TRANSFORMACIÓN]],
  [
    #text(style: "italic", fill: rgb("#334155"))[Describan la secuencia lógica de pasos, controles o evaluaciones que convierten las entradas en resultados:\
    • Paso 1:\
    • Paso 2:\
    • Paso 3:\
    • Paso 4:]\
    #v(4pt)
    #text(weight: "bold")[👉 Respuesta:]\
    - *Paso 1 (Detección y Formalización de la Vacante):* La Jefatura del servicio asistencial (ej. Pediatría o Guardia) detecta la necesidad operativa y el Área de Personal eleva la requisitoria de cargo vacante a Dirección y al Ministerio de Salud de Río Negro.
    - *Paso 2 (Convocatoria Pública y Recepción):* Publicación en el portal oficial de salud de Río Negro y recepción centralizada y local de currículums y antecedentes.
    - *Paso 3 (Preselección Curricular y Verificación Matricular):* El Departamento de RRHH filtra los CVs cotejando requisitos excluyentes (título habilitante, matrícula habilitante o trámite de convalidación en Río Negro, residencia médica completa).
    - *Paso 4 (Entrevistas por Competencias y Evaluación Psicotécnica):* Entrevista técnica y de idoneidad con la Dirección Médica y Jefe de Servicio; aplicación de batería de tests psicológicos para evaluar tolerancia a la frustración, trabajo bajo presión y vocación de arraigo comunitario en Catriel.
    - *Paso 5 (Examen Preocupacional y Dictamen de Aptitud):* Junta Médica evalúa el estado psicofísico del postulante y emite el Certificado de Aptitud Laboral; se inicia el circuito del expediente digital para la emisión de la Resolución de Designación.
    - *Paso 6 (Inducción Institucional y Toma de Posesión):* Firma de acta de alta laboral, asignación de legajo en el sistema de liquidación de haberes, entrega de llave de vivienda oficial (si corresponde), entrega del reglamento interno y presentación formal en el servicio.
  ],
  
  [
    #text(weight: "bold", fill: primary)[SALIDAS]\
    #text(weight: "bold", fill: primary)[(Outputs)]
  ],
  [
    #text(style: "italic", fill: rgb("#334155"))[Indiquen los productos físicos/digitales, servicios prestados o registros actualizados que genera el sistema.]\
    #v(4pt)
    #text(weight: "bold")[👉 Respuesta:]\
    - *Profesional incorporado y operativo:* Médico, enfermero o técnico prestando servicio efectivo en el hospital cubriendo guardias y consultorios.
    - *Instrumento legal formal:* Resolución ministerial o Disposición de designación bajo el marco estatutario (Ley 1904 o 1844).
    - *Legajo de personal digitalizado:* Expediente único con documentación legal, declaraciones juradas de incompatibilidad y alta en el seguro de ART Horizonte.
    - *Cronograma de guardias cubierto:* Reducción inmediata de la sobrecarga horaria en el plantel preexistente.
    - *Mejora prestacional:* Incremento en la cantidad de turnos disponibles y cirugías programadas para los habitantes de Catriel, reduciendo traslados sanitarios.
  ],
  
  [
    #text(weight: "bold", fill: primary)[RETROALIMENTACIÓN]\
    #text(weight: "bold", fill: primary)[(Feedback)]
  ],
  [
    #text(style: "italic", fill: rgb("#334155"))[Expliquen qué indicadores, encuestas, controles o auditorías miden el desempeño del sistema para corregir errores o desviaciones.]\
    #v(4pt)
    #text(weight: "bold")[👉 Respuesta:]\
    - *Evaluación de Desempeño a los 3 y 6 meses:* Informe formal de la Jefatura de Servicio sobre la idoneidad técnica, puntualidad, trato con pacientes y adaptación institucional del ingresante durante el *período de prueba estatutario*.
    - *Auditorías de calidad y encuestas de usuarios:* Medición de la satisfacción del paciente en el sistema SAMI y registro de quejas o felicitaciones en libro de guardia.
    - *Indicadores de RRHH (KPIs):* Monitoreo de la tasa de retención de profesionales (permanencia mayor a 12 meses), índice de ausentismo y rotación temprana.
    - *Ajuste del perfil de búsqueda:* Si un profesional renuncia precozmente por no adaptarse a la vida en Catriel o presenta falencias en trabajo de guardia, RRHH reajusta los criterios del Paso 1 y Paso 4 (ponderando con mayor puntaje la experiencia en zonas desfavorables o médicos con arraigo regional patagónico).
  ],
  
  [
    #text(weight: "bold", fill: primary)[AMBIENTE EXTERNO]\
    #text(weight: "bold", fill: primary)[(Entorno)]
  ],
  [
    #text(style: "italic", fill: rgb("#334155"))[Mencionen qué leyes, regulaciones, demandas sociales o factores del mercado presionan/condicionan al sistema desde afuera.]\
    #v(4pt)
    #text(weight: "bold")[👉 Respuesta:]\
    - *Industria petrolera local:* La actividad de hidrocarburos en Catriel eleva notablemente el costo de vida y alquileres, ofreciendo salarios privados con los que el presupuesto público no puede competir directamente.
    - *Crisis de especialistas médicos a nivel país:* Escasez generalizada de pediatras, médicos generalistas y neonatólogos en toda la República Argentina.
    - *Marco regulatorio rígido:* Régimen salarial y escalafonario fijado por el Poder Ejecutivo Provincial y acuerdos paritarios gremiales (ASSPUR / ATE / UPCN).
    - *Demanda social y comunitaria:* Crecimiento demográfico de Catriel y exigencia vecinal de atención pediátrica permanente y guardias activas.
  ],
)

#v(14pt)

// ==============================================================================
// 5. ANÁLISIS DETALLADO DE LOS COMPONENTES SISTÉMICOS
// ==============================================================================
= 5. Análisis Descriptivo y Conceptual de los Componentes

== 5.1. Ambiente Externo: Lo que la Organización NO Puede Controlar
Bajo la Teoría General de Sistemas, el *Ambiente* o *Entorno* está constituido por todas aquellas variables, actores y condiciones que operan más allá de la frontera del hospital, ejerciendo presiones constantes e ineludibles sobre su comportamiento, sin que la dirección local pueda modificarlas a voluntad:
1. *El Efecto Petrolero y el Costo de Vida Local:* Catriel es una de las capitales petroleras históricas de Río Negro. Este entorno productivo genera un costo habitacional y de bienes sumamente elevado. Los alquileres residenciales se rigen por valores petroleros, lo cual desincentiva la llegada de profesionales de la salud provenientes de otras provincias si el salario público ofrecido no cubre holgadamente su costo de vida.
2. *Leyes Provinciales y Rigidez Estatutaria:*
  - *Ley Provincial N° 1904 (Carrera Profesional Médico-Hospitalaria):* Regula los agrupamientos, grados, régimen de dedicación exclusiva y adicionales de guardia para profesionales universitarios de la salud en Río Negro.
  - *Ley Provincial N° 1844 (Estatuto General del Empleado Público):* Regula al personal técnico, asistencial y administrativo.
  - El hospital no puede negociar salarios individuales fuera de los escalafones fijados por el Ministerio de Economía de la Provincia y las mesas paritarias.
3. *Demografía y Perfil Epidemiológico Comunitario:* El aumento demográfico de Catriel, la alta tasa de accidentología vial y laboral vinculada a las rutas y yacimientos de la cuenca, y los picos estacionales de enfermedades respiratorias infantiles configuran una demanda asistencial variable que no depende de la voluntad del hospital.

== 5.2. Límites o Fronteras: Lo que la Organización SÍ Puede Controlar
La *Frontera del Sistema* demarca con exactitud hasta dónde llega la soberanía de decisión y control de las autoridades del Hospital de Catriel y de su Área de Recursos Humanos:
- *Definición de Perfiles por Competencias:* Si bien la ley establece los requisitos generales, el hospital define si la vacante en Pediatría requiere experiencia en emergentología o si se priorizan competencias de salud comunitaria y trabajo territorial en centros periféricos.
- *Gestión del Clima Laboral y Acompañamiento:* La acogida del ingresante, la coordinación de guardias no abusivas, la vinculación con el equipo interdisciplinario y el soporte en la asignación de las *viviendas institucionales* construidas por el Estado provincial son variables internas gestionadas localmente.
- *Evaluación en Período de Prueba:* La decisión de convalidar la continuidad de un profesional o desestimar su contratación en base a su rendimiento ético y asistencial durante los primeros meses está bajo el estricto control de la Jefatura de Servicio y la Dirección.

== 5.3. Entradas (Inputs) Requeridas
Las entradas del subsistema de selección representan los insumos de información, humanos y normativos necesarios para activar el flujo operativo:
- *Datos y Documentación del Postulante:* CV actualizado, copias autenticadas de títulos universitarios reconocidos por el Ministerio de Educación de la Nación, antecedentes disciplinarios expedidos por colegios profesionales y certificados de reincidencia penal.
- *Requisitos de la Matrícula Provincial:* La obligatoriedad de que todo médico radicado obtenga su habilitación ante el Consejo Provincial de Salud Pública de Río Negro.
- *Autorización Centralizada de Vacante:* La confirmación de que la partida presupuestaria está disponible en el presupuesto provincial para autorizar el alta en el sistema informático de liquidación.

== 5.4. Proceso de Transformación (Pasos Secuenciales)
El proceso de transformación convierte una *vacante asistencial insatisfecha* y una *solicitud de empleo* en un *profesional de la salud integrado y brindando atención médica de calidad*:
- *Fase de Reclutamiento (Pasos 1 y 2):* Se lanza la búsqueda mediante la convocatoria permanente de la provincia (`convocatoriamedicarn@salud.rionegro.gov.ar`) y se difunde en colegios médicos y redes profesionales, recibiendo las solicitudes iniciales.
- *Fase de Preselección y Filtrado Técnico (Paso 3):* Se realiza el primer tamiz documental, descartando perfiles sin títulos habilitantes o antecedentes incompatibles con el ejercicio público.
- *Fase de Evaluación Integral (Pasos 4 y 5):* Se aplican entrevistas semiestructuradas por competencias lideradas por médicos referentes y se efectúa el informe psicotécnico a cargo de profesionales de Salud Mental, seguido por el examen físico de la Junta Médica.
- *Fase de Alta, Inducción y Radicación (Paso 6):* Se gestiona la toma de posesión, se le asigna su usuario en el sistema de gestión hospitalaria y se lo introduce a la comunidad hospitalaria y a la ciudad de Catriel.

== 5.5. Salidas (Outputs): Resultados del Sistema
- *Salidas Primarias (Capital Humano Operativo):* El médico de guardia, el cirujano, la enfermera o el técnico incorporados al servicio activo, garantizando la continuidad de la guardia las 24 horas y reduciendo los tiempos de espera en consultorios.
- *Salidas de Información y Registros:* Legajo físico y digital debidamente foliado, registro de alta en el sistema de sueldos provincial, constancia de inducción en bioseguridad, y reporte oficial a la Dirección de Recursos Humanos del Ministerio de Salud en Viedma.
- *Salida Social:* Mayor accesibilidad de la comunidad de Catriel a tratamientos de salud complejos en su propia ciudad, evitando angustias y desarraigo por traslados hacia el Alto Valle o centros privados.

== 5.6. Retroalimentación (Feedback): ¿Hay Retroalimentación?
#callout(
  [
    *Respuesta Categórica:* *SÍ, EXISTE UN CIRCUITO CERRADO DE RETROALIMENTACIÓN.*
    \
    En la Teoría de Sistemas, la retroalimentación es el mecanismo que compara el resultado real del sistema con los objetivos previstos para introducir acciones correctivas (retroalimentación negativa u homeostática). En el Hospital de Catriel, este lazo opera a través de los siguientes instrumentos concretos:
    
    1. *Evaluación Formal durante el Período de Prueba:* A los 3 y 6 meses de la incorporación, el Jefe de Servicio y la Dirección completan una grilla de desempeño donde se valoran: idoneidad técnica, compromiso horario, empatía en la relación médico-paciente, cumplimiento de guardias y capacidad de trabajo en equipo.
    2. *Tasa de Rotación Temprana y Entrevistas de Salida:* Si un médico renuncia antes de cumplir el año debido a dificultades habitacionales o sobrecarga laboral, RRHH releva las causales para retroalimentar la estrategia: gestionar con el Municipio o Provincia más cupos de viviendas o modificar las condiciones de guardia.
    3. *Ajuste del Perfil de Búsqueda Inicial:* Si la experiencia arroja que médicos recién graduados de grandes urbes sufren aislamiento y renuncian rápidamente, el sistema retroalimenta el *Paso 1 y Paso 4*, reorientando la búsqueda hacia profesionales formados en el interior patagónico o con experiencia probada en salud rural e intercultural.
  ],
  bg: "f2f7f7",
  border-color: "0e6873",
  left-color: "0e6873",
)

#pagebreak()

// ==============================================================================
// 6. DIAGRAMA CONCEPTUAL DEL SISTEMA (ESQUEMA DE BLOQUES)
// ==============================================================================
= 6. Diagrama Conceptual del Sistema (Esquema de Bloques)

El siguiente esquema gráfico representa el flujo sistémico completo del Proceso de Reclutamiento, Selección e Incorporación de Personal en el Hospital de Área Catriel, delimitando con nitidez el entorno exterior, la frontera operativa y el lazo de retroalimentación:

#v(6pt)

#block(
  width: 100%,
  breakable: false,
  stroke: 1.5pt + rgb("#a0b5c5"),
  fill: rgb("#fbfcfd"),
  inset: 14pt,
  radius: 6pt,
)[
  // Caja de Ambiente Externo
  #align(center)[
    #text(size: 9pt, weight: "bold", fill: orange-accent, tracking: 0.08em)[
      AMBIENTE EXTERNO (ENTORNO CONDICIONANTE - NO CONTROLABLE)
    ]\
    #text(size: 8pt, fill: text-muted)[
      Mercado Petrolero de Catriel · Costo de Alquileres · Leyes Provinciales 1904 y 1844 · Paritarias del Sector Público · Déficit Nacional de Especialistas
    ]
  ]
  
  #v(8pt)
  
  // Marco de la Frontera del Sistema
  #block(
    width: 100%,
    stroke: (paint: teal-accent, thickness: 1.2pt, dash: "dashed"),
    fill: white,
    inset: 12pt,
    radius: 4pt,
  )[
    #align(right)[
      #text(size: 7.5pt, weight: "bold", fill: teal-accent)[
        [--- FRONTERA / LÍMITE DEL SISTEMA HOSPITALARIO (CONTROL DIRECTO) ---]
      ]
    ]
    
    #v(4pt)
    
    // Grilla de las 3 fases principales: Entradas -> Proceso -> Salidas
    #grid(
      columns: (1fr, 28pt, 2fr, 28pt, 1fr),
      align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
      
      // BLOQUE 1: ENTRADAS
      [
        #block(
          width: 100%,
          fill: bg-card,
          stroke: 1pt + border-subtle,
          inset: 8pt,
          radius: 4pt,
          [
            #text(weight: "bold", fill: primary, size: 8.8pt)[ENTRADAS]\
            #text(size: 7.5pt, fill: text-muted)[(Inputs)]\
            #v(4pt)
            #align(left)[
              #text(size: 7.8pt)[
                • Solicitudes / CVs\
                • Perfiles de puesto\
                • Requisitoria vacante\
                • Título y Matrícula\
                • Normativa Ley 1904\
                • Cupo presupuestario
              ]
            ]
          ]
        )
      ],
      
      // FLECHA 1
      [
        #text(size: 16pt, fill: teal-accent, weight: "bold")[➔]
      ],
      
      // BLOQUE 2: PROCESO DE TRANSFORMACIÓN
      [
        #block(
          width: 100%,
          fill: rgb("#eef6f6"),
          stroke: 1.2pt + teal-accent,
          inset: 8pt,
          radius: 4pt,
          [
            #text(weight: "bold", fill: primary, size: 9pt)[PROCESO DE TRANSFORMACIÓN]\
            #text(size: 7.5pt, fill: text-muted)[(Gestión de Reclutamiento y Selección - RRHH)]\
            #v(4pt)
            #grid(
              columns: (1fr, 1fr),
              gutter: 6pt,
              align: left,
              [
                #block(fill: white, inset: 4pt, stroke: 0.5pt + border-subtle, radius: 2pt)[
                  #text(size: 7.2pt)[*1.* Relevamiento de vacante asistencial]
                ]
                #v(2pt)
                #block(fill: white, inset: 4pt, stroke: 0.5pt + border-subtle, radius: 2pt)[
                  #text(size: 7.2pt)[*2.* Convocatoria provincial y local]
                ]
                #v(2pt)
                #block(fill: white, inset: 4pt, stroke: 0.5pt + border-subtle, radius: 2pt)[
                  #text(size: 7.2pt)[*3.* Preselección y filtro curricular]
                ]
              ],
              [
                #block(fill: white, inset: 4pt, stroke: 0.5pt + border-subtle, radius: 2pt)[
                  #text(size: 7.2pt)[*4.* Entrevista técnica y psicotécnico]
                ]
                #v(2pt)
                #block(fill: white, inset: 4pt, stroke: 0.5pt + border-subtle, radius: 2pt)[
                  #text(size: 7.2pt)[*5.* Junta Médica y Designación formal]
                ]
                #v(2pt)
                #block(fill: white, inset: 4pt, stroke: 0.5pt + border-subtle, radius: 2pt)[
                  #text(size: 7.2pt)[*6.* Inducción, vivienda y alta legal]
                ]
              ]
            )
          ]
        )
      ],
      
      // FLECHA 2
      [
        #text(size: 16pt, fill: teal-accent, weight: "bold")[➔]
      ],
      
      // BLOQUE 3: SALIDAS
      [
        #block(
          width: 100%,
          fill: bg-card,
          stroke: 1pt + border-subtle,
          inset: 8pt,
          radius: 4pt,
          [
            #text(weight: "bold", fill: primary, size: 8.8pt)[SALIDAS]\
            #text(size: 7.5pt, fill: text-muted)[(Outputs)]\
            #v(4pt)
            #align(left)[
              #text(size: 7.8pt)[
                • Personal incorporado\
                • Guardias cubiertas\
                • Legajo digitalizado\
                • Acta de posesión\
                • Alta en nómina\
                • Atención médica
              ]
            ]
          ]
        )
      ],
    )
    
    #v(10pt)
    
    // BLOQUE DE RETROALIMENTACIÓN INFERIOR (CIRCUITO CERRADO)
    #block(
      width: 100%,
      fill: bg-alert,
      stroke: (top: 1pt + orange-accent, rest: 0.6pt + border-subtle),
      inset: 8pt,
      radius: 4pt,
      [
        #grid(
          columns: (auto, 1fr),
          gutter: 10pt,
          align: horizon,
          [
            #text(size: 20pt, fill: orange-accent)[🔄]
          ],
          [
            #text(weight: "bold", fill: orange-accent, size: 8.5pt)[
              CIRCUITO DE RETROALIMENTACIÓN CONTINUA (FEEDBACK CORRECTIVO):
            ]\
            #text(size: 7.8pt, fill: text-main)[
              *Evaluación de Desempeño (3 y 6 meses)* ➔ *Tasa de Retención de Médicos* ➔ *Auditoría de Historias Clínicas y Guardias* ➔ *Encuestas de Satisfacción SAMI* ➔ *Ajuste Dinámico de Perfiles de Puesto e Incentivos de Radicación en el Paso 1 y Paso 4*.
            ]
          ]
        )
      ]
    )
  ]
]

#v(10pt)

== 6.1. Interpretación Dinámica del Modelo Sistémico
El diagrama anterior sintetiza la interacción multidimensional de la Teoría General de Sistemas aplicada a una organización sanitaria pública:
- *Porosidad y Selectividad de la Frontera:* El hospital no es una entidad hermética; sus límites filtran las demandas externas mediante requisitos excluyentes de matriculación y acreditación ética. La frontera delimita con precisión la responsabilidad operativa directa de los equipos de salud locales frente a las facultades indelegables del Ministerio de Salud provincial.
- *Entropía Negativa y Recursos:* La incorporación periódica y planificada de nuevos profesionales médicos y técnicos contrarresta el desgaste natural del plantel preexistente (guardias extenuantes, jubilaciones y traslados), aportando energía e información al sistema (neguentropía).
- *Lazo de Retroalimentación Homeostática:* El circuito inferior no representa un trámite burocrático aislado, sino el mecanismo cibernético que permite al hospital corregir desvíos en tiempo real: si la tasa de deserción temprana en Catriel aumenta, la retroalimentación fuerza a recalibrar los perfiles de búsqueda y a robustecer los incentivos de radicación habitacional.

#pagebreak()

// ==============================================================================
// 7. CONCLUSIONES Y APORTES DESDE LA GESTIÓN DE RRHH
// ==============================================================================
= 7. Conclusiones y Aportes Disciplinares

El desarrollo del presente mapeo sistémico sobre el *Hospital Área Programa Catriel "Dra. Cecilia Grierson"* aporta reflexiones esenciales para la práctica profesional en el ámbito de la *Licenciatura en Recursos Humanos* y de la *Administración Pública*:

1. *Superación de la Visión Lineal Tradicional:* La gestión de personas en el ámbito sanitario público no concluye con la firma del contrato o decreto de designación. Comprender el proceso como un *sistema abierto con retroalimentación continua* permite identificar a tiempo los factores que amenazan la sostenibilidad de las dotaciones de guardia, en particular la hostilidad o complejidad del entorno económico petrolero.
2. *Articulación Estratégica con el Entorno:* La atracción de médicos hacia Catriel demuestra que el subsistema de selección hospitalaria no puede operar aislado. Debe integrarse sistémicamente con políticas públicas provinciales y municipales de vivienda, incentivos económicos por zona inhóspita y contención comunitaria para las familias de los profesionales.
3. *Valor de los Sistemas de Información para la Gestión (TIG):* La disponibilidad de legajos digitales, registros unificados de convocatorias y sistemas de evaluación de desempeño objetiva constituye el soporte tecnológico indispensable para que la retroalimentación sea oportuna, reduciendo la burocracia y garantizando el derecho a la salud en el norte rionegrino.
4. *Equidad y Sentido de Pertenencia Institucional:* El seguimiento cercano durante el período de prueba genera canales de escucha activa que reducen el estrés laboral y potencian la vocación de servicio público en zonas geográficas alejadas de los grandes centros urbanos.

#v(14pt)

// ==============================================================================
// 8. REFERENCIAS BIBLIOGRÁFICAS Y FUENTES CONSULTADAS
// ==============================================================================
= 8. Referencias Bibliográficas y Fuentes

- Bertalanffy, L. von (1968). _Teoría General de Sistemas: Fundamentos, desarrollo y aplicaciones_. Fondo de Cultura Económica.
- Chiavenato, I. (2017). _Administración de Recursos Humanos: El capital humano de las organizaciones_ (10ª ed.). McGraw-Hill Interamericana.
- Gobierno de la Provincia de Río Negro (2020). _Inauguración del Nuevo Hospital de Catriel "Dra. Cecilia Grierson"_. Comunicados oficiales de infraestructura y salud pública.
- Ministerio de Salud de Río Negro (2024-2026). _Convocatoria Nacional Permanente para Médicos y Profesionales de la Salud_. Portal Oficial `salud.rionegro.gov.ar`.
- Provincia de Río Negro. _Ley Provincial N° 1904: Estatuto y Carrera Profesional Hospitalaria_.
- Provincia de Río Negro. _Ley Provincial N° 1844: Estatuto y Escalafón del Personal de la Administración Pública Provincial_.
- Universidad Nacional del Comahue - CURZAS. _Guía Práctica: Mapeo Sistémico Organizacional - Tecnologías de la Información para la Gestión (TIG)_.

#v(20pt)

#block(
  width: 100%,
  stroke: (top: 1pt + teal-accent),
  inset: (top: 12pt),
  [
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [
        #text(size: 8.5pt, weight: "bold", fill: primary)[Espacio Curricular:]\
        #text(size: 8.2pt, fill: text-muted)[Tecnologías de la Información para la Gestión (TIG)]\
        #text(size: 8.2pt, fill: text-muted)[CURZAS · Universidad Nacional del Comahue]
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: primary)[Equipo de Elaboración:]\
        #text(size: 8.2pt, fill: text-muted)[Ayarachi Fuentes, H.D. · Díaz, A.A.]\
        #text(size: 8.2pt, fill: text-muted)[Avendaño, I. · Curaqueo, L.]
      ]
    )
  ]
)

