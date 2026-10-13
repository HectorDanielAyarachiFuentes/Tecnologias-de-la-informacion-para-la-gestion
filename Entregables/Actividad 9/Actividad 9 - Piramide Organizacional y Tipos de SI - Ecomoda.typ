// ==============================================================================
// UNIVERSIDAD NACIONAL DEL COMAHUE - CURZAS
// TECNOLOGÍA DE LA INFORMACIÓN PARA LA GESTIÓN (TIG)
// ACTIVIDAD 9: PIRÁMIDE ORGANIZACIONAL Y TIPOS DE SISTEMAS DE INFORMACIÓN (SI)
// MÓDULO 3: ALINEACIÓN DE SISTEMAS DE INFORMACIÓN (PUNTOS 1 Y 2)
// CASO DE ESTUDIO: ECOMODA S.A. ("YO SOY BETTY, LA FEA")
// ESTUDIANTES: HECTOR DANIEL AYARACHI FUENTES | ANDREA ALEJANDRA DÍAZ
// ==============================================================================

#set document(
  title: "Actividad 9 - Pirámide Organizacional y Tipos de SI - Ecomoda S.A.",
  author: ("Hector Daniel Ayarachi Fuentes", "Andrea Alejandra Díaz"),
)

// Tipografía y espaciado base según estándares institucionales (AGENTS.md)
#set text(font: "Arial", size: 9.8pt, fill: rgb("#1f2933"), lang: "es")
#set par(justify: true, leading: 0.68em)

// Paleta cromática institucional oficial (AGENTS.md)
#let primary = rgb("#153e5c")        // Azul petróleo institucional
#let teal-accent = rgb("#0e6873")    // Teal institucional
#let orange-accent = rgb("#c1741f")  // Terracota / Naranja acento
#let text-main = rgb("#1f2933")      // Texto principal
#let text-muted = rgb("#4b6575")     // Texto secundario
#let border-subtle = rgb("#b7c9d6")  // Borde suave
#let bg-card = rgb("#f2f7f7")        // Fondo suave teal
#let bg-alert = rgb("#fdf2e9")       // Fondo cálido naranja
#let bg-table-header = rgb("#0e6873") // Encabezado de tabla institucional

// Estilos de títulos y encabezados jerárquicos
#show heading.where(level: 1): it => block(
  above: 16pt,
  below: 9pt,
  stroke: (bottom: 1.5pt + teal-accent),
  inset: (bottom: 5pt),
  text(size: 13pt, fill: primary, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 12pt,
  below: 6pt,
  text(size: 10.8pt, fill: teal-accent, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 9pt,
  below: 5pt,
  text(size: 9.6pt, fill: rgb("#28536b"), weight: "bold", it.body),
)

// Componentes destacados (Callouts y Alertas)
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
  inset: (x: 11pt, y: 8pt),
  radius: (right: 4pt),
  above: 8pt,
  below: 10pt,
  body,
)

#let alerta(body) = block(
  width: 100%,
  breakable: false,
  fill: rgb("fdf6ee"),
  stroke: (left: 4pt + orange-accent, rest: 0.6pt + border-subtle),
  inset: (x: 11pt, y: 8pt),
  radius: (right: 3pt),
  above: 8pt,
  below: 10pt,
  text(size: 9.1pt, body),
)

#show table.cell: set par(justify: false, leading: 0.55em)
#show table.cell: set text(size: 8.5pt)

// ==============================================================================
// 1. CARÁTULA INSTITUCIONAL (PORTADA OFICIAL CURZAS - CERO NUMERACIÓN)
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
      #v(4pt)
      // Logotipo institucional de CURZAS y Logotipo corporativo de Ecomoda S.A.
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        image("../../recursos/Logotipo de curzas/CURZAS.png", width: 120pt),
        image("Assets/logoecomoda.svg", width: 185pt),
      )
      
      #v(10pt)
      // Barra de acento naranja
      #rect(
        width: 100%,
        height: 4pt,
        fill: orange-accent,
        radius: 1pt,
      )
      
      #v(16pt)
      
      // Título Principal de la Entrega
      #text(size: 18.5pt, weight: "bold", fill: primary)[
        PIRÁMIDE ORGANIZACIONAL Y\ TIPOS DE SISTEMAS DE INFORMACIÓN
      ]
      
      #v(6pt)
      
      // Subtítulo
      #text(size: 11.5pt, fill: text-muted, style: "italic")[
        Módulo 3 · Alineación de Sistemas de Información (Puntos 1 y 2)\
        Mapeo Jerárquico y Clasificación de SI en la Empresa Textil "Ecomoda S.A."
      ]
      
      #v(14pt)
      
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
          #text(size: 8.7pt, fill: text-main)[
            El presente informe resuelve la consigna oficial del *Módulo 3: Alineación de Sistemas de Información*, tomando como base el diagnóstico organizacional, sociotécnico y funcional desarrollado previamente en la *Actividad 8* sobre la prestigiosa firma de confección y alta costura *Ecomoda S.A.*
            
            Se analiza la estructura de la empresa a través del modelo clásico de la *Pirámide Organizacional*, mapeando los roles y cargos concretos de la trama corporativa en sus tres niveles jerárquicos: *Estratégico / Superior*, *Táctico / Medio* y *Operacional / Base*. Asimismo, se formula una matriz exhaustiva de clasificación tipológica de Sistemas de Información (*TPS, MIS/SIG y DSS/ESS*), detallando sus respectivas operaciones de entrada, procesos computacionales y reportes de salida, demostrando cómo una adecuada alineación de las TIG erradica los silos de datos, previene descalabros patrimoniales (como el fraude encubierto de Terramoda Ltda.) y potencia la gestión estratégica del talento humano.
          ]
        ],
      )
      
      #v(20pt)
      
      // Metadatos institucionales y autoría
      #block(
        width: 100%,
        stroke: (top: 0.7pt + border-subtle),
        inset: (top: 12pt),
        [
          #grid(
            columns: (160pt, 1fr),
            row-gutter: 8pt,
            text(size: 8.8pt, weight: "bold", fill: text-muted)[INSTITUCIÓN:],
            text(size: 9.1pt, weight: "semibold", fill: primary)[CURZAS · Universidad Nacional del Comahue],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ESPACIO CURRICULAR:],
            text(size: 9.1pt, fill: text-main)[Tecnología de la Información para la Gestión (TIG)],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[CARRERA:],
            text(size: 9.1pt, fill: text-main)[Licenciatura en Recursos Humanos / Tec. y Lic. en Adm. Pública],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[ORGANIZACIÓN ANALIZADA:],
            text(size: 9.1pt, weight: "semibold", fill: teal-accent)[Ecomoda S.A. (Bogotá, Colombia)],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[EQUIPO DE ESTUDIANTES:],
            [
              #text(size: 9.1pt, weight: "bold", fill: primary)[Hector Daniel Ayarachi Fuentes] #text(size: 8.1pt, fill: text-muted)[(DNI 35.492.138 · Leg. CURZA-8284)]\
              #text(size: 9.1pt, weight: "bold", fill: primary)[Andrea Alejandra Díaz] #text(size: 8.1pt, fill: text-muted)[(DNI 27.786.409 · Leg. CURZA-7229)]
            ],
            
            text(size: 8.8pt, weight: "bold", fill: text-muted)[FECHA DE PRESENTACIÓN:],
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
      text(size: 8pt, fill: rgb("#627d91"))[Actividad 9 · Pirámide Organizacional y Tipos de SI · Ecomoda S.A.],
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
      text(size: 8pt, fill: rgb("#627d91"))[Ecomoda S.A. · Alineación de SI (Módulo 3)],
      image("../../recursos/Logotipo de curzas/CURZAS.png", height: 12pt),
      text(size: 8pt, fill: rgb("#627d91"))[
        #context [Página #counter(page).display("1") de #counter(page).final().at(0)]
      ],
    )
  ],
)

// ==============================================================================
// ENCABEZADO FORMAL DE LA ACTIVIDAD SEGÚN PLANTILLA OFICIAL
// ==============================================================================
#align(center)[
  #text(size: 8.5pt, fill: text-muted, weight: "semibold")[
    Tecnología de la Información para la Gestión (TIG) | Módulo 3\
    Universidad Nacional del Comahue · CURZAS
  ]
  #v(2pt)
  #text(size: 13.5pt, weight: "bold", fill: primary)[
    PIRÁMIDE ORGANIZACIONAL Y TIPOS DE SI
  ]
  #v(1pt)
  #text(size: 10.5pt, weight: "semibold", fill: teal-accent)[
    Módulo 3: Alineación de Sistemas de Información (Puntos 1 y 2)
  ]
  #v(1pt)
  #text(size: 8.8pt, style: "italic", fill: text-muted)[
    Carreras: Tec./Lic. en Administración Pública / Lic. en Recursos Humanos
  ]
]

#v(3pt)
#line(length: 100%, stroke: 0.8pt + teal-accent)
#v(6pt)

// ==============================================================================
// 1. DATOS DEL EQUIPO Y ORGANIZACIÓN SELECCIONADA
// ==============================================================================
= 1. Datos del Equipo y Organización Seleccionada

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: bg-card,
  inset: (x: 12pt, y: 8pt),
  radius: 4pt,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    row-gutter: 6pt,
    
    text(weight: "bold", fill: primary)[Nombre de la Firma / Grupo N°:],
    text(fill: text-main)[*Equipo de Consultoría TIG · Caso Ecomoda S.A.*],
    
    text(weight: "bold", fill: primary)[Integrantes (Nombre, Apellido y Legajo):],
    [
      1. *Hector Daniel Ayarachi Fuentes* #text(fill: text-muted)[— DNI: 35.492.138 · Legajo: CURZA-8284]\
      2. *Andrea Alejandra Díaz* #text(fill: text-muted)[— DNI: 27.786.409 · Legajo: CURZA-7229]
    ],
    
    text(weight: "bold", fill: primary)[Carrera:],
    [
      [ #text(weight: "bold", fill: teal-accent)[ ] ] Tec./Lic. en Administración Pública #h(20pt)
      [ #text(weight: "bold", fill: teal-accent)[X] ] *Lic. en Recursos Humanos*
    ],
    
    text(weight: "bold", fill: primary)[Organización o Área Analizada (Módulos 1 y 2):],
    [
      #grid(
        columns: (1fr, auto),
        gutter: 10pt,
        align: horizon,
        [
          *Ecomoda S.A.* (Empresa manufacturera y casa de modas textil, Bogotá, Colombia).\
          _Foco integral de análisis:_ Presidencia Ejecutiva (Armando Mendoza), Asistencia Financiera y Contable (Beatriz Pinzón Solano), Gerencia de Recursos Humanos y Relaciones Laborales (Dr. Saúl Gutiérrez), Taller de Confección y Diseño (Hugo Lombardi e Inés Ramírez "Doña Inesita"), y Área de Recepción y Comunicaciones (Aura María Fuentes, Patricia Fernández y el Cuartel de las Feas).
        ],
        [
          #block(
            fill: white,
            stroke: 0.4pt + border-subtle,
            inset: (x: 6pt, y: 4pt),
            radius: 3pt,
            image("Assets/logoecomoda.svg", width: 70pt),
          )
        ],
      )
    ],
  )
]

#v(6pt)

#callout[
  #text(weight: "bold", fill: primary)[Articulación Conceptual con la Actividad 8 (Módulo 2) y Enfoque de TIG:]\
  En la *Actividad 8* se diagnosticaron las patologías informacionales críticas de Ecomoda: concentración extrema de datos en la computadora y planillas personales de Beatriz Pinzón, uso rudimentario de *MS Paint* para confeccionar el balance general, saturación del conmutador de Aura María, dispersión de memorandos en papel trasladados por Freddy Contreras y discrecionalidad subjetiva en la gestión de personas conducida por el Dr. Gutiérrez.
  
  En este *Módulo 3*, avanzamos de la etapa de diagnóstico hacia la *alineación estructural de los Sistemas de Información (SI)* con la *Pirámide Jerárquica Organizacional*. Como enseña la teoría de gestión de Laudon & Laudon y los postulados de Robert Anthony, *no todos los usuarios en una organización demandan la misma información ni toman la misma clase de decisiones*. El éxito de una arquitectura tecnológica radica en proveer al personal operativo la agilidad transaccional necesaria, a las jefaturas tácticas la información de control estructurada, y a la alta dirección tableros estratégicos con visión integral y analítica.
]

#v(8pt)

// ==============================================================================
// 2. LA PIRÁMIDE JERÁRQUICA EN NUESTRA ORGANIZACIÓN (PUNTO 1)
// ==============================================================================
= 2. La Pirámide Jerárquica en Nuestra Organización (Punto 1)

El modelo de la *Pirámide Organizacional* estratifica a la empresa en tres niveles diferenciados por el horizonte temporal de sus actividades, el grado de incertidumbre y la naturaleza de las decisiones que se adoptan:
+ *Nivel Superior / Estratégico (Cúspide):* Enfocado en el largo plazo, el entorno competitivo, la supervivencia institucional y la formulación de políticas globales. Toma *decisiones no estructuradas* que demandan juicio subjetivo, evaluación y comprensión profunda del contexto.
+ *Nivel Medio / Táctico (Centro):* Responsable de traducir las directivas estratégicas en planes y programas concretos a mediano plazo (mensual/trimestral), coordinar áreas funcionales y controlar la asignación eficiente de recursos. Adopta *decisiones semiestructuradas*.
+ *Nivel Operacional (Base):* Ejecuta las actividades cotidianas y rutinarias de producción, registro, atención y control directo en el corto plazo (diario/semanal). Aplica reglas claras y procedimientos estandarizados para tomar *decisiones estructuradas*.

#v(6pt)

// Representación gráfica de la Pirámide Organizacional de Ecomoda maquetada en Typst
#align(center)[
  #block(
    width: 98%,
    stroke: 0.6pt + border-subtle,
    fill: white,
    inset: (x: 10pt, y: 8pt),
    radius: 4pt,
  )[
    #text(weight: "bold", size: 9pt, fill: primary)[REPRESENTACIÓN GRÁFICA · PIRÁMIDE JERÁRQUICA Y ROLES EN ECOMODA S.A.]\
    #v(5pt)
    
    // Nivel Superior (Cúspide)
    #rect(
      width: 52%,
      fill: rgb("#153e5c"),
      radius: (top: 4pt),
      inset: (x: 8pt, y: 7pt),
    )[
      #text(fill: white, weight: "bold", size: 8.5pt)[NIVEL SUPERIOR / EJECUTIVO (CÚSPIDE)]\
      #v(1pt)
      #text(fill: rgb("#dbe7f0"), size: 7.5pt)[
        Armando Mendoza (Presidencia) · Roberto Mendoza · Daniel Valencia · Marcela Valencia (Junta Directiva)\
        _Foco: Planes a largo plazo, endeudamiento, balances globales, metas estratégicas y gobierno corporativo._
      ]
    ]
    #v(-3pt)
    
    // Nivel Medio (Centro)
    #rect(
      width: 76%,
      fill: rgb("#0e6873"),
      inset: (x: 8pt, y: 7pt),
    )[
      #text(fill: white, weight: "bold", size: 8.5pt)[NIVEL MEDIO / TÁCTICO (CENTRO)]\
      #v(1pt)
      #text(fill: rgb("#d4eeef"), size: 7.5pt)[
        Beatriz Pinzón Solano (Finanzas) · Mario Calderón (Comercial) · Hugo Lombardi (Diseño) · Dr. Saúl Gutiérrez (RRHH)\
        _Foco: Control presupuestario, mermas de tela, cálculo de costos por colección, ausentismo y metas tácticas._
      ]
    ]
    #v(-3pt)
    
    // Nivel Operacional (Base)
    #rect(
      width: 100%,
      fill: rgb("#28536b"),
      radius: (bottom: 4pt),
      inset: (x: 8pt, y: 7pt),
    )[
      #text(fill: white, weight: "bold", size: 8.5pt)[NIVEL OPERACIONAL (BASE DE LA PIRÁMIDE)]\
      #v(1pt)
      #text(fill: rgb("#e1ecf2"), size: 7.5pt)[
        Doña Inesita y Costureras (Taller) · Patricia Fernández y Sandra (Secretaría) · Aura María (Recepción/Conmutador)\
        Bertha Muñoz y Cuartel (Apoyo RRHH/Oficinas) · Freddy Contreras (Mensajería) · Wilson Sastoque (Seguridad)\
        _Foco: Registro transaccional diario, confección de prendas, fichadas de reloj, corte de tela y atención de trámites._
      ]
    ]
  ]
]

#v(6pt)

== Matriz de Roles y Funciones en la Pirámide de Ecomoda S.A.

A continuación, se completa la matriz oficial de la consigna identificando con precisión quirúrgica los roles y cargos concretos del caso analizado, correlacionándolos con el tipo de funciones y decisiones que desempeñan:

#v(4pt)

#table(
  columns: (1.4fr, 2.3fr, 2.3fr),
  fill: (col, row) => if row == 0 { bg-table-header } else if calc.odd(row) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (left + top, left + top, left + top),
  table.header(
    text(weight: "bold", fill: white)[Nivel Jerárquico],
    text(weight: "bold", fill: white)[Cargos / Roles Concretos en el Caso],
    text(weight: "bold", fill: white)[Tipo de Funciones y Decisiones],
  ),
  
  [
    *Nivel Superior / Ejecutivo*\
    #text(size: 8pt, fill: text-muted)[(Cúspide de la Pirámide)\
    _Ámbito Estratégico y de Gobierno Corporativo_]
  ],
  [
    - *Armando Mendoza Sáenz:* Presidente Ejecutivo de Ecomoda.
    - *Roberto Mendoza y Margarita Sáenz de Mendoza:* Fundadores, principales accionistas y miembros del Consejo de Administración.
    - *Daniel Valencia:* Accionista mayoritario, fiscalizador y miembro clave de la Junta Directiva.
    - *Marcela Valencia:* Accionista, Directora de Puntos de Venta y miembro de la Junta Directiva.
  ],
  [
    - *Decisiones Estratégicas y No Rutinarias (Largo Plazo):*
      - Aprobación del Plan Estratégico de Negocios y metas de rentabilidad anual de Ecomoda.
      - Aprobación de presupuestos globales de inversión para nuevas colecciones y líneas de alta costura.
      - Decisiones sobre estructura de endeudamiento financiero, toma de créditos bancarios multimillonarios y emisión de garantías corporativas.
      - Aprobación o rechazo del Balance General anual y distribución de dividendos a socios.
      - Nombramiento de la alta plana ejecutiva (Presidencia, Vicepresidencia Comercial, Asistencia Financiera).
      - Gestión de crisis patrimoniales, alianzas de marca y fusiones o acuerdos judiciales ante acreedores.
  ],
  
  [
    *Nivel Medio / Táctico*\
    #text(size: 8pt, fill: text-muted)[(Centro de la Pirámide)\
    _Ámbito Gerencial, de Coordinación y Control_]
  ],
  [
    - *Beatriz Aurora Pinzón Solano:* Asistente de Presidencia y virtual Gerente Financiera / Contable (economista con honores).
    - *Mario Calderón:* Vicepresidente Comercial y de Marketing.
    - *Hugo Lombardi:* Director de Diseño y Diseñador Exclusivo de la firma.
    - *Dr. Saúl Gutiérrez:* Jefe de Recursos Humanos y Relaciones Laborales ("Guti-gut").
    - *Catalina Ángel:* Asesora externa senior de Relaciones Públicas y Estrategia de Eventos de Moda.
  ],
  [
    - *Decisiones Tácticas y Semiestructuradas (Mediano Plazo):*
      - Formulación de planes tácticos mensuales y trimestrales por área funcional.
      - Control presupuestario y conciliación de costos de materia prima vs. margen de comercialización por prenda.
      - Monitoreo del porcentaje de merma y desperdicio en el taller de corte de Hugo Lombardi.
      - Supervisión del cumplimiento de metas de ventas mayoristas y comisiones comerciales.
      - Control mensual de indicadores de Recursos Humanos: índice de ausentismo, llegadas tarde y horas extras autorizadas por sector.
      - Coordinación interdepartamental (ej. conciliar fechas de desfile entre Diseño, Taller de Producción y Finanzas).
  ],
  
  [
    *Nivel Operacional*\
    #text(size: 8pt, fill: text-muted)[(Base de la Pirámide)\
    _Ámbito Transaccional, Rutinario y Productivo_]
  ],
  [
    - *Inés Ramírez ("Doña Inesita"):* Maestra mayor de taller y supervisora directa de costura.
    - *Operarias y Operarios de Taller:* Costureras, cortadores de tela, remalladoras y planchadores.
    - *Patricia Fernández:* Secretaria de Presidencia y Relaciones Públicas.
    - *Aura María Fuentes:* Recepcionista central y operadora del conmutador telefónico.
    - *Integrantes del "Cuartel de las Feas" en puestos de apoyo:* Bertha Muñoz (RRHH), Sandra Patiño (Secretaría), Mariana Valdés (Recepción), Sofía López (Asistencia Contable).
    - *Freddy Stewart Contreras:* Mensajero institucional y logística en motocicleta.
    - *Wilson Sastoque:* Guardia de seguridad y control de acceso peatonal/vehicular.
  ],
  [
    - *Decisiones Operativas y Estructuradas (Corto Plazo / Diario):*
      - Marcación horaria obligatoria de entrada, descansos y salida en el reloj de control.
      - Corte, ensamble, confección y planchado físico de prendas conforme a las fichas técnicas de diseño.
      - Registro transaccional diario de insumos retirados de almacén (metros lineales de tela, carretes de hilo, cremalleras).
      - Carga de facturas de proveedores, confección de recibos de caja chica y cobranzas a clientes.
      - Atención y enrutamiento telefónico de llamadas entrantes en el conmutador.
      - Recepción y derivación de expedientes, correspondencia física y valijas administrativas.
      - Registro manual o biométrico de visitantes en portería.
  ],
)

#v(6pt)

#alerta[
  *Patología Crítica de Solapamiento Jerárquico en Ecomoda:*
  En la serie se observa una grave distorsión de la pirámide: *Beatriz Pinzón Solano* se vio forzada a operar simultáneamente en los tres niveles de la organización. Realizaba tareas *operacionales* (cargar facturas a mano y digitar borradores), funciones *tácticas* (calcular costos, negociar con proveedores de tela y consolidar presupuestos) y decisiones *estratégicas* (redactar el plan de salvataje patrimonial y estructurar la empresa pantalla Terramoda Ltda.). Este colapso de niveles sobre una sola persona fue consecuencia directa de la ausencia de sistemas automatizados que distribuyeran la carga de trabajo según el rol formal.
]

#v(8pt)

// ==============================================================================
// 3. MAPEO DE TIPOS DE SISTEMAS DE INFORMACIÓN (PUNTO 2)
// ==============================================================================
= 3. Mapeo de Tipos de Sistemas de Información (Punto 2)

Los Sistemas de Información no constituyen un bloque homogéneo, sino un ecosistema modular diseñado para responder a las necesidades específicas de cada nivel jerárquico. En la teoría clásica de sistemas aplicados a la gestión (Laudon & Laudon, O'Brien), se identifican tres grandes categorías esenciales:
+ *Sistemas de Procesamiento de Transacciones (TPS - Transaction Processing Systems):* Ubicados en la base de la pirámide, procesan grandes volúmenes de datos elementales generados en el día a día operativo. Su objetivo primordial es la exactitud, la rapidez de respuesta y el registro fidedigno de cada evento empresarial.
+ *Sistemas de Información Gerencial (MIS / SIG - Management Information Systems):* Situados en el nivel táctico, toman los datos limpios y almacenados por los TPS para resumirlos, ordenarlos, calcular variaciones y generar informes periódicos predefinidos que permiten a los jefes de departamento monitorear y controlar el desempeño de sus áreas.
+ *Sistemas de Soporte a Decisiones / Apoyo a Ejecutivos (DSS / ESS / SIE - Decision Support Systems / Executive Support Systems):* Emplazados en la cúspide de la pirámide, combinan datos consolidados de los MIS internos con información del entorno macroeconómico y del mercado. Utilizan modelos de simulación, análisis de sensibilidad ("¿Qué pasaría si...?") y tableros de control visuales interactivos (*Dashboards*) para fundamentar decisiones estratégicas no rutinarias.

#v(6pt)

== Matriz de Mapeo de Sistemas de Información (Entradas, Procesos y Salidas)

A continuación, se completa la matriz oficial de la consigna determinando qué tipo de Sistema de Información procesa los datos en cada nivel de la pirámide organizacional de Ecomoda S.A., especificando minuciosamente sus entradas y salidas:

#v(4pt)

#table(
  columns: (1.25fr, 1.25fr, 1.75fr, 1.75fr),
  fill: (col, row) => if row == 0 { bg-table-header } else if calc.odd(row) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (left + top, left + top, left + top, left + top),
  table.header(
    text(weight: "bold", fill: white)[Tipo de Sistema (SI)],
    text(weight: "bold", fill: white)[Nivel Jerárquico Que lo Utiliza],
    text(weight: "bold", fill: white)[Datos de Entrada / Operaciones],
    text(weight: "bold", fill: white)[Información de Salida / Reportes],
  ),
  
  [
    *TPS*\
    #text(size: 7.8pt, fill: text-muted)[(Sistema de Procesamiento de Transacciones)\
    _Cimientos de Datos de la Organización_]
  ],
  [
    *Nivel Operacional*\
    #text(size: 7.8pt, fill: text-muted)[(Base de la Pirámide)\
    Operarias de taller, secretarias, asistentes contables, recepcionista, mensajero, seguridad.]
  ],
  [
    - *Operaciones cotidianas y rutinarias:*
      - Fichadas biométricas de entrada, pausas y salida de todo el personal (reloj de huella digital).
      - Registro de metros de tela cortados, mermas de seda y horas de costura por Orden de Producción (OP) en taller.
      - Ingreso de facturas de proveedores de materias primas (telas importadas, hilos, botones).
      - Emisión de comprobantes de ventas y cobros en los puntos de venta directa (boutiques).
      - Solicitudes de permisos, licencias y justificaciones médicas cargadas por asistentes de RRHH.
      - Registro de gastos de mensajería en moto y comprobantes de combustible rendidos por Freddy.
  ],
  [
    - *Documentos y reportes operativos:*
      - Recibos de sueldo individuales emitidos con cálculo exacto de haberes y deducciones de ley.
      - Órdenes de Corte y Confección digitales expedidas al taller de Doña Inesita.
      - Facturas fiscales, notas de crédito y remitos de entrega de prendas a clientes mayoristas.
      - Listados diarios de existencias físicas en bodega (kardex de inventarios por rollo de tela).
      - Partes diarios de fichadas y registro de novedades de personal para la jefatura de RRHH.
      - Base de datos relacional transaccional normalizada y auditada en tiempo real.
  ],
  
  [
    *MIS / SIG*\
    #text(size: 7.8pt, fill: text-muted)[(Sistemas de Información Gerencial)\
    _Control de Gestión y Monitoreo Táctico_]
  ],
  [
    *Nivel Medio / Táctico*\
    #text(size: 7.8pt, fill: text-muted)[(Centro de la Pirámide)\
    Jefes de departamento: Beatriz Pinzón (Finanzas), Mario Calderón (Ventas), Hugo Lombardi (Diseño), Dr. Gutiérrez (RRHH).]
  ],
  [
    - *Datos agregados del TPS y parámetros:*
      - Volúmenes consolidados de ventas semanales y mensuales reportados por el TPS comercial.
      - Acumulado de horas de costura y costos reales de materias primas insumidas por lote textil.
      - Parámetros presupuestarios aprobados: costo estándar fijado por vestido, cuota de ventas asignada y techo de horas extras.
      - Partes mensuales de ausencias, llegadas tardías y licencias de cada gerencia provistos por el TPS de personal.
  ],
  [
    - *Informes periódicos y resúmenes de control:*
      - *Informe Mensual de Variaciones Presupuestarias:* Contraste entre presupuesto aprobado vs. gasto devengado por sector.
      - *Reporte de Costeo y Mermas por Colección:* Análisis del desperdicio en las telas importadas de Hugo Lombardi, alertando desvíos que erosionan el margen operativo.
      - *Índice Departamental de Ausentismo y Productividad:* Tasa de impuntualidad por sector (ej. contrastando Recepción vs. Taller) y horas extras acumuladas.
      - *Reporte de Antigüedad de Saldos y Rotación:* Días promedio de cobro a clientes mayoristas y rotación de stock de prendas en showroom.
  ],
  
  [
    *DSS / ESS / SIE*\
    #text(size: 7.8pt, fill: text-muted)[(Soporte a Decisiones / Apoyo a Ejecutivos)\
    _Inteligencia Estratégica y Dirección Corporativa_]
  ],
  [
    *Nivel Superior / Ejecutivo*\
    #text(size: 7.8pt, fill: text-muted)[(Cúspide de la Pirámide)\
    Armando Mendoza (Presidencia), Roberto Mendoza, Daniel Valencia, Marcela Valencia (Junta Directiva).]
  ],
  [
    - *Información estratégica interna y externa:*
      - Datos resumidos de alta gerencia consolidados por los MIS (márgenes EBITDA, liquidez corriente, solvencia patrimonial).
      - Fuentes del entorno macroeconómico: tasas de interés de la banca colombiana, cotización del dólar para importación de sedas y lanas, proyecciones de inflación.
      - Indicadores del mercado de la moda: tendencias de consumo, análisis de precios y cuotas de mercado de competidores directos.
      - Parámetros de simulación financiera ("What-If") y escenarios prospectivos de negocio.
  ],
  [
    - *Tableros interactivos y análisis prospectivos:*
      - *Executive Dashboard (Cuadro de Mando Integral):* Portal interactivo con gráficos consolidados y alertas semaforizadas en tiempo real de deuda bancaria y rentabilidad neta.
      - *Simulador de Sensibilidad Financiera:* Modelado de escenarios ante crisis: ¿qué ocurre con el flujo de caja si se posterga una colección o si se reestructuran los pasivos bancarios?
      - *Tablero de Proyección de Expansión Internacional:* Evaluación de viabilidad para apertura de tiendas propias en el exterior o venta de franquicias.
      - *Balance General Corporativo Transparente y Auditado:* Reporte inmutable para la Junta Directiva con trazabilidad digital (_audit trail_), impidiendo balances falsos o empresas pantalla.
  ],
)

#v(6pt)

#block(
  width: 100%,
  stroke: 0.8pt + orange-accent,
  fill: rgb("#fffcf8"),
  radius: 4pt,
  inset: (x: 10pt, y: 7pt),
)[
  #grid(
    columns: (115pt, 1fr),
    gutter: 10pt,
    align: (center + horizon, left + top),
    [
      #block(radius: 3pt, clip: true)[
        #image("Assets/betyusandopaintenbalancegeneral.jpg", width: 100%)
      ]
      #v(2pt)
      #text(size: 6.8pt, fill: text-muted, style: "italic")[
        Evidencia: Betty editando celdas del balance en MS Paint por ausencia de un ESS corporativo.
      ]
    ],
    [
      #text(weight: "bold", size: 8.6pt, fill: orange-accent)[
        🔍 EVIDENCIA DE AUDITORÍA INFORMÁTICA · EL VACÍO DEL NIVEL ESS EN ECOMODA
      ]\
      #v(2pt)
      #text(size: 8.1pt, fill: text-main)[
        *El Drama de la Carencia de un ESS:* La captura real de la estación de Beatriz Pinzón demuestra la patología más extrema de la organización: ante la inexistencia de un Sistema de Información para Ejecutivos (ESS), la Presidencia y la Asistente Financiera terminaron utilizando *Microsoft Paint* sobre Windows 98 para diseñar a mano el "Balance General" que se exhibiría ante la Junta Directiva.
        
        La falta de un sistema automatizado que consolidara transacciones reales en tableros auditados permitió a Armando Mendoza presionar a Betty para *maquillar las pérdidas reales de Ecomoda y ocultar el endeudamiento bancario*. En un entorno con un DSS/ESS moderno conectado a un ERP corporativo, el balance se genera automáticamente a partir de los datos inmutables del TPS, haciendo técnicamente imposible la adulteración de cifras o la creación clandestina de Terramoda Ltda.
      ]
    ]
  )
]

#v(8pt)

// ==============================================================================
// 4. ANÁLISIS DE INTEGRACIÓN: EL FLUJO DE INFORMACIÓN DE LA BASE A LA CÚSPIDE
// ==============================================================================
= 4. Análisis de Integración: El Flujo de Información de la Base a la Cúspide

Para comprender la trascendencia de la alineación de sistemas en la gestión de organizaciones, resulta indispensable mapear cómo *un mismo dato elemental registrado en la base operativa asciende por la pirámide, transformándose en conocimiento e inteligencia estratégica*.

#v(4pt)

// Pipeline Gráfico de Integración de Datos
#align(center)[
  #block(
    width: 98%,
    stroke: 0.6pt + border-subtle,
    fill: white,
    inset: (x: 8pt, y: 6pt),
    radius: 4pt,
  )[
    #text(weight: "bold", size: 8.6pt, fill: primary)[PIPELINE DE INTEGRACIÓN DE DATOS · ARQUITECTURA DE FLUJO ASCENDENTE]\
    #v(3pt)
    #grid(
      columns: (1fr, 18pt, 1.15fr, 18pt, 1fr),
      align: horizon + center,
      [
        #block(fill: rgb("#28536b"), inset: 5pt, radius: 3pt, width: 100%)[
          #text(fill: white, weight: "bold", size: 7.6pt)[1. Base Operativa (TPS)]\
          #text(fill: rgb("#e1ecf2"), size: 6.6pt)[Fichadas biométricas, metros de tela y facturación.]
        ]
      ],
      [#text(size: 13pt, fill: teal-accent, weight: "bold")[→]],
      [
        #block(fill: rgb("#0e6873"), inset: 5pt, radius: 3pt, width: 100%)[
          #text(fill: white, weight: "bold", size: 7.6pt)[2. Control Táctico (MIS)]\
          #text(fill: rgb("#d4eeef"), size: 6.6pt)[Costeo de colección, cálculo de mermas y ausentismo.]
        ]
      ],
      [#text(size: 13pt, fill: teal-accent, weight: "bold")[→]],
      [
        #block(fill: rgb("#153e5c"), inset: 5pt, radius: 3pt, width: 100%)[
          #text(fill: white, weight: "bold", size: 7.6pt)[3. Dirección Ejecutiva (ESS)]\
          #text(fill: rgb("#dbe7f0"), size: 6.6pt)[Dashboard interactivo, simulación y balance auditado.]
        ]
      ],
    )
  ]
]

#v(4pt)

== 4.1. Caso Práctico 1: El Flujo de la Cadena Textil y Financiera (Diseño Lombardi vs. Rentabilidad)

#block(
  width: 100%,
  stroke: (left: 4.5pt + primary, rest: 0.6pt + border-subtle),
  fill: bg-card,
  inset: (x: 10pt, y: 5.5pt),
  radius: (right: 4pt),
)[
  #grid(
    columns: (110pt, 1fr),
    gutter: 10pt,
    row-gutter: 4pt,
    
    [#text(weight: "bold", fill: primary, size: 8.5pt)[Nivel Operacional (TPS):]\
    #text(size: 7.5pt, fill: text-muted)[Registro en Base]],
    [
      Una operaria de taller registra en la pantalla táctil de confección: _"Orden de Producción N° 512 · Vestido de Noche Alta Costura · Tela utilizada: 8,4 metros de seda natural italiana (\$110.000 COP/m) · Retazo de merma no reutilizable: 2,6 metros · Tiempo de costura: 11 horas"._ El TPS descuenta el stock de seda del kardex e imputa el consumo a la orden.
    ],
    
    [#text(weight: "bold", fill: teal-accent, size: 8.5pt)[Nivel Táctico (MIS/SIG):]\
    #text(size: 7.5pt, fill: text-muted)[Procesamiento Medio]],
    [
      El MIS consolida todas las OP de la colección de Hugo Lombardi al cierre de mes y genera el *Reporte de Costeo y Eficiencia Textil*: _"La colección de Hugo Lombardi registra un costo promedio de \$1.240.000 COP por prenda, con una tasa de desperdicio de tela del 31% (frente a la meta estándar del 12%). El margen de contribución real cae al 8,5% frente al precio mayorista pactado"._ Beatriz Pinzón y Hugo Lombardi identifican que los moldes de corte generan excesivos sobrantes inservibles.
    ],
    
    [#text(weight: "bold", fill: orange-accent, size: 8.5pt)[Nivel Estratégico (DSS/ESS):]\
    #text(size: 7.5pt, fill: text-muted)[Decisión en Cúspide]],
    [
      En el *Dashboard Ejecutivo* de Presidencia y Junta Directiva, el indicador de margen neto de la línea de alta costura se enciende en alerta roja. Armando Mendoza y la Junta simulan en el DSS dos cursos de acción: _Opción A:_ Aumentar el precio de venta mayorista un 18% para preservar exclusividad; _Opción B:_ Modificar la matriz de patronaje computarizado e incorporar forros nacionales para bajar costos en un 22%. La Junta decide aprobar la Opción B, salvando la rentabilidad de la compañía sin perder competitividad en el mercado.
    ],
  )
]

#v(4pt)

== 4.2. Caso Práctico 2: El Flujo en Recursos Humanos y Productividad (Control Horario y Clima Laboral)

#block(
  width: 100%,
  stroke: (left: 4.5pt + orange-accent, rest: 0.6pt + border-subtle),
  fill: bg-alert,
  inset: (x: 10pt, y: 5.5pt),
  radius: (right: 4pt),
)[
  #grid(
    columns: (110pt, 1fr),
    gutter: 10pt,
    row-gutter: 4pt,
    
    [#text(weight: "bold", fill: orange-accent, size: 8.5pt)[Nivel Operacional (TPS):]\
    #text(size: 7.5pt, fill: text-muted)[Registro en Base]],
    [
      El reloj biométrico de recepción captura la marcación de huella: _"Patricia Fernández · Horario oficial: 08:00 a 17:30 hs · Marcación de ingreso: 09:22 hs · Marcación de salida: 16:40 hs"_ (acumula 132 minutos de inasistencia en la jornada). Simultáneamente: _"Doña Inesita · Ingreso: 07:45 hs · Salida: 19:30 hs"_ (computa 2 horas extraordinarias de taller).
    ],
    
    [#text(weight: "bold", fill: teal-accent, size: 8.5pt)[Nivel Táctico (MIS/SIG):]\
    #text(size: 7.5pt, fill: text-muted)[Procesamiento Medio]],
    [
      El MIS de RRHH procesa los partes de asistencia quincenales y emite el *Informe de Ausentismo y Horas Extras*: _"El sector de Secretaría / Recepción acumula 38 horas de impuntualidad no justificada en el mes (\$1.900.000 COP en tiempo no trabajado), concentradas en un 85% en el legajo de Patricia Fernández. El Taller de Costura devenga 140 horas extras por cuellos de botella en patronaje"._ El Dr. Saúl Gutiérrez recibe el reporte objetivo y no puede ocultar las faltas mediante favoritismos.
    ],
    
    [#text(weight: "bold", fill: primary, size: 8.5pt)[Nivel Estratégico (DSS/ESS):]\
    #text(size: 7.5pt, fill: text-muted)[Decisión en Cúspide]],
    [
      La Dirección Ejecutiva visualiza en el módulo de Talento Humano del ESS el índice de costo laboral por departamento y el nivel de rotación y clima laboral. Al cruzar datos de ausentismo con productividad, la Presidencia y RRHH resuelven formalizar el *Reglamento de Asistencia por Mérito*, aplicar descuentos automáticos por nómina a la impuntualidad y contratar una asistente técnica de patronaje para el taller, aliviando las horas extras de Doña Inesita y humanizando la jornada laboral.
    ],
  )
]

#v(4pt)

#callout[
  #text(weight: "bold", fill: primary)[Principio Fundamental de la Alineación de SI (GIGO: Garbage In, Garbage Out):]\
  La calidad de las decisiones estratégicas que adopta la alta dirección en la cúspide de la pirámide depende inexorablemente de la fidelidad y exactitud con que se registran los datos transaccionales en la base operacional. Si las operarias del taller anotan metros de tela en cuadernos borrosos o si el reloj de fichadas es alterado manualmente, los reportes del MIS se distorsionan y el Dashboard del ESS mostrará indicadores engañosos. De allí la necesidad imperiosa de integrar todas las áreas bajo una única arquitectura ERP corporativa.
]

#pagebreak()

// ==============================================================================
// 5. MATRIZ DE TRANSFORMACIÓN Y MADUREZ DE LOS SI EN ECOMODA S.A.
// ==============================================================================
= 5. Matriz de Transformación y Madurez de los SI en Ecomoda S.A.

A efectos de sintetizar los hallazgos de este Módulo 3 en estrecha articulación con las disfunciones detectadas en el Módulo 2, se presenta el cuadro comparativo entre el *Modelo Tradicional Deficiente (la Ecomoda en crisis de la novela)* y el *Modelo Propuesto de Alineación Tecnológica (Ecomoda con TIG)*:

#v(4pt)

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { primary } else if calc.odd(row) { bg-card } else { white },
  stroke: 0.4pt + border-subtle,
  table.header(
    text(weight: "bold", fill: white)[Nivel / Dimensión],
    text(weight: "bold", fill: white)[Ecomoda Tradicional (Sin Alineación de SI)],
    text(weight: "bold", fill: white)[Ecomoda Rediseñada con TIG (Alineación Integral)],
  ),
  
  [
    *Nivel Operacional*\
    #(text(size: 7.8pt, fill: text-muted)[Base de la Pirámide\ (TPS)])
  ],
  [
    - Cuadernos de notas a mano en el taller de confección.
    - Planillas locales de Excel aisladas en la PC de Betty.
    - Conmutador manual analógico colapsado por Aura María.
    - Traslado físico de memos en papel por Freddy Contreras en motocicleta.
    - Fichas de personal en carpetas colgantes y cajones de RRHH.
  ],
  [
    - *TPS Textil Integrado:* Terminales táctiles en taller con lectores de código de barras/QR para telas y prendas.
    - *Control Biométrico de Asistencia:* Fichadas digitales inalterables con cálculo automático de turnos y retardos.
    - *Ventas y Facturación Electrónica:* Conexión directa de puntos de venta con el kardex de almacén e inventarios.
    - *Workflow Digital "Cero Papel":* Solicitudes y trámites electrónicos con firma digital de usuarios.
  ],
  
  [
    *Nivel Táctico*\
    #(text(size: 7.8pt, fill: text-muted)[Centro de la Pirámide\ (MIS / SIG)])
  ],
  [
    - Informes elaborados manualmente por Betty bajo presión extrema.
    - Inexistencia de cálculo formal de mermas de Hugo Lombardi.
    - Manejo discrecional y subjetivo de legajos por parte del Dr. Saúl Gutiérrez ("guti-gut").
    - Falta de reportes periódicos de control presupuestario por departamento.
  ],
  [
    - *MIS Automatizado y Programado:* Emisión quincenal y mensual de desvíos presupuestarios por centro de costos.
    - *Control de Costos Textil (PLM):* Reportes objetivos de merma por línea de diseño y costeo absorbente real.
    - *Tablero Departamental de RRHH:* Informes auditables de ausentismo, rotación y horas extras sin favoritismos.
    - *Alertas Tempranas:* Detección automática de sobregastos antes de cerrar la producción de colecciones.
  ],
  
  [
    *Nivel Superior*\
    #(text(size: 7.8pt, fill: text-muted)[Cúspide de la Pirámide\ (DSS / ESS)])
  ],
  [
    - Conducción autocrática e impulsiva de Armando Mendoza.
    - Informes en papel manipulados para engañar a la Junta Directiva.
    - Edición del Balance General en *MS Paint* por parte de Betty.
    - Quiebra patrimonial inminente oculta tras la empresa pantalla Terramoda Ltda.
  ],
  [
    - *Executive Dashboard en Tiempo Real:* Tablero de control con indicadores clave (KPIs) de solvencia, liquidez y margen.
    - *Modelos de Simulación Financiera (DSS):* Proyección de escenarios prospectivos ("What-If") ante fluctuaciones económicas.
    - *Única Fuente de la Verdad y Auditoría:* Estados financieros inmutables, erradicando dobles contabilidades o fraudes societarios.
  ],
)

#v(8pt)

#callout[
  #text(weight: "bold", fill: primary)[Síntesis de Madurez Digital en Ecomoda S.A.:]\
  La transformación planteada demuestra que el pasaje de la precariedad informática a la madurez institucional no consiste únicamente en adquirir computadoras más veloces, sino en *hacer visible la verdad transaccional de la empresa*. Cuando la base transaccional es sólida y auditada, la gerencia táctica puede ejercer un control preventivo y la presidencia ejecutiva se ve obligada a conducir con ética, profesionalismo y rigor técnico.
]

#pagebreak()

// ==============================================================================
// 6. CONCLUSIONES INSTITUCIONALES Y REFLEXIÓN DE CÁTEDRA
// ==============================================================================
= 6. Conclusiones Institucionales y Reflexión para la Gestión

El estudio de la *Pirámide Organizacional y la Clasificación de los Sistemas de Información* a través del caso emblemático de *Ecomoda S.A.* permite extraer valiosas conclusiones pedagógicas y profesionales para los futuros egresados en *Recursos Humanos* y *Administración Pública*:

#v(4pt)

== 6.1. La Información como Arquitectura Sociotécnica
Un Sistema de Información no es únicamente un paquete de software instalado en una computadora, sino la articulación armónica entre *personas, procedimientos formales, reglas institucionales y tecnología*. Cuando la tecnología no se alinea con los roles de la pirámide, sobreviene el caos operativo y la opacidad directiva. En Ecomoda, la ausencia de un canal estructurado convirtió a la comunicación informal ("radio pasillo" del Cuartel de las Feas) en el único mecanismo de supervivencia y cohesión para el personal ante las directivas autoritarias de la presidencia.

#v(4pt)

== 6.2. La Humanización del Trabajo mediante la Automatización Transaccional
La implementación de un TPS en la base de Ecomoda no busca deshumanizar la labor de las costureras ni burocratizar a las secretarias, sino liberar a los trabajadores de registros manuales tediosos y evitar abusos laborales. El caso de Beatriz Pinzón evidencia cómo la sobrecarga operativa de procesar datos a mano genera agotamiento extremo (_burnout_) y coloca a un empleado talentoso en situaciones de vulnerabilidad psicológica, impidiéndole desplegar su verdadero potencial analítico y estratégico.

#v(4pt)

== 6.3. Gobernanza de Datos, Transparencia y Ética Corporativa
La cúspide estratégica de una compañía jamás debe tomar decisiones a ciegas ni basarse en reportes retocados artesanalmente en *MS Paint*. Los tableros DSS/ESS nutridos por bases de datos auditadas constituyen la mayor garantía de supervivencia patrimonial y rectitud ética, protegiendo a la organización contra maniobras fraudulentas y resguardando los puestos de trabajo de toda la comunidad laboral. La alineación de las TIG es, en última instancia, una salvaguarda de justicia organizacional.

#v(8pt)

#callout[
  #text(weight: "bold", fill: primary)[Reflexión Final de Cátedra:]\
  El rediseño integral de Ecomoda demuestra que la *Alineación de Sistemas de Información con la Pirámide Jerárquica* es el puente que transforma datos dispersos en decisiones sabias. Cuando cada escalón de la pirámide cuenta con la herramienta tecnológica adecuada a su función, la organización recupera su homeostasis, desarticula la arbitrariedad en Recursos Humanos y consolida un modelo de gestión transparente, productivo y socialmente responsable.
]

#v(14pt)

#line(length: 100%, stroke: 0.5pt + border-subtle)
#v(4pt)
#align(center)[
  #text(size: 8.5pt, fill: text-muted)[
    Trabajo Práctico desarrollado por *Hector Daniel Ayarachi Fuentes* (DNI 35.492.138 · Legajo CURZA-8284) y *Andrea Alejandra Díaz* (DNI 27.786.409 · Legajo CURZA-7229) para la cátedra de *Tecnología de la Información para la Gestión (TIG)*.\
    Centro Universitario Regional Zona Atlántica y Sur (CURZAS) · Universidad Nacional del Comahue · Octubre de 2026.
  ]
]
