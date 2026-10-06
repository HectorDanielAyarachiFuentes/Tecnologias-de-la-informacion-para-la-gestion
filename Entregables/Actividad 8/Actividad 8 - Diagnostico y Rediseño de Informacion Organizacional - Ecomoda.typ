// ==============================================================================
// UNIVERSIDAD NACIONAL DEL COMAHUE - CURZAS
// TECNOLOGÍA DE LA INFORMACIÓN PARA LA GESTIÓN (TIG)
// ACTIVIDAD 8: FICHA DE DIAGNÓSTICO Y REDISEÑO DE INFORMACIÓN ORGANIZACIONAL
// CASO DE ESTUDIO: ECOMODA S.A. ("YO SOY BETTY, LA FEA")
// ESTUDIANTES: HECTOR DANIEL AYARACHI FUENTES | ANDREA ALEJANDRA DÍAZ
// ==============================================================================

#set document(
  title: "Actividad 8 - Ficha de Diagnóstico y Rediseño de Información Organizacional - Ecomoda S.A.",
  author: ("Hector Daniel Ayarachi Fuentes", "Andrea Alejandra Díaz"),
)

// Tipografía y espaciado base según estándares institucionales (AGENTS.md)
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
  above: 18pt,
  below: 10pt,
  stroke: (bottom: 1.5pt + teal-accent),
  inset: (bottom: 5pt),
  text(size: 13.5pt, fill: primary, weight: "bold", it.body),
)

#show heading.where(level: 2): it => block(
  above: 13pt,
  below: 7pt,
  text(size: 11pt, fill: teal-accent, weight: "bold", it.body),
)

#show heading.where(level: 3): it => block(
  above: 10pt,
  below: 5pt,
  text(size: 9.8pt, fill: rgb("#28536b"), weight: "bold", it.body),
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
#show table.cell: set text(size: 8.5pt)

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
      // Logotipo institucional de CURZAS y Logotipo corporativo de Ecomoda S.A.
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        image("../../recursos/Logotipo de curzas/CURZAS.png", width: 130pt),
        image("Assets/logoecomoda.svg", width: 105pt),
      )
      
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
      #text(size: 19pt, weight: "bold", fill: primary)[
        FICHA DE DIAGNÓSTICO Y REDISEÑO\ DE INFORMACIÓN ORGANIZACIONAL
      ]
      
      #v(6pt)
      
      // Subtítulo
      #text(size: 11.5pt, fill: text-muted, style: "italic")[
        Módulo 2 · Sistemas de Información y Comunicación Institucional\
        Aplicación Práctica a la Empresa Textil y Casa de Modas "Ecomoda S.A."
      ]
      
      #v(16pt)
      
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
          #text(size: 8.8pt, fill: text-main)[
            El presente informe desarrolla la *Ficha de Diagnóstico y Rediseño de Información Organizacional* aplicada a la emblemática empresa de alta costura y confección textil *Ecomoda S.A.* Se evalúan los flujos de datos, los canales de comunicación formales e informales, y las herramientas informáticas de la organización bajo la óptica de la *Teoría General de Sistemas (TGS)* y la *Gestión Estratégica de Recursos Humanos*. Se diagnostican las patologías de información que propiciaron la crisis financiera corporativa (la dispersión de datos en planillas locales de Beatriz Pinzón, la incomunicación entre talleres y presidencia, el secretismo de Terramoda y la discrecionalidad de RRHH) y se propone un rediseño integral basado en arquitecturas ERP Cloud, gobierno de datos, flujos digitales transparentes y meritocracia.
          ]
        ],
      )
      
      #v(28pt)
      
      // Metadatos institucionales y autoría
      #block(
        width: 100%,
        stroke: (top: 0.7pt + border-subtle),
        inset: (top: 14pt),
        [
          #grid(
            columns: (160pt, 1fr),
            row-gutter: 9pt,
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
      text(size: 8pt, fill: rgb("#627d91"))[Actividad 8 · Diagnóstico y Rediseño Ecomoda S.A.],
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
      text(size: 8pt, fill: rgb("#627d91"))[Ecomoda S.A. · Rediseño de Información Organizacional],
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
    Tecnología de la Información para la Gestión (TIG) | Módulo 2\
    Universidad Nacional del Comahue · CURZAS
  ]
  #v(3pt)
  #text(size: 13.5pt, weight: "bold", fill: primary)[
    [PLANTILLA] FICHA DE DIAGNÓSTICO Y REDISEÑO DE INFORMACIÓN ORGANIZACIONAL
  ]
  #v(1pt)
  #text(size: 10pt, weight: "semibold", fill: teal-accent)[
    Tec./Lic. en Administración Pública y Lic. en Recursos Humanos
  ]
  #v(1pt)
  #text(size: 9pt, style: "italic", fill: text-muted)[
    Tema: Sistemas de Información y Comunicación Institucional
  ]
]

#v(4pt)
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
    
    text(weight: "bold", fill: primary)[Carrera:],
    [
      [ #text(weight: "bold", fill: teal-accent)[ ] ] Tec./Lic. en Administración Pública #h(18pt)
      [ #text(weight: "bold", fill: teal-accent)[X] ] *Lic. en Recursos Humanos*
    ],
    
    text(weight: "bold", fill: primary)[Firma / Grupo N°:],
    text(fill: text-main)[*Equipo de Consultoría TIG · Caso Ecomoda S.A.*],
    
    text(weight: "bold", fill: primary)[Integrantes (Nombre, Apellido, DNI y Legajo):],
    [
      1. *Hector Daniel Ayarachi Fuentes* #text(fill: text-muted)[— DNI: 35.492.138 · Leg. CURZA-8284]\
      2. *Andrea Alejandra Díaz* #text(fill: text-muted)[— DNI: 27.786.409 · Leg. CURZA-7229]
    ],
    
    text(weight: "bold", fill: primary)[Organización Analizada:],
    [
      #grid(
        columns: (1fr, auto),
        gutter: 10pt,
        align: horizon,
        [
          *Ecomoda S.A.* (Empresa manufacturera y casa de modas textil, Bogotá, Colombia).\
          _Foco de análisis:_ Presidencia Ejecutiva (Armando Mendoza), Asistencia Financiera (Beatriz Pinzón Solano), RRHH (Dr. Saúl Gutiérrez), Taller (Hugo Lombardi e Inesita) y Recepción (Aura María Fuentes y Patricia Fernández).
        ],
        [
          #block(
            fill: white,
            stroke: 0.4pt + border-subtle,
            inset: (x: 6pt, y: 4pt),
            radius: 3pt,
            image("Assets/logoecomoda.svg", width: 62pt)
          )
        ]
      )
    ],
  )
]

#v(8pt)

#callout[
  #text(weight: "bold", fill: primary)[Contexto del Caso "Ecomoda" para el Diagnóstico de TIG y RRHH:]\
  Ecomoda es una prestigiosa casa de modas que atraviesa una severa crisis institucional y financiera. Pese a contar con una fuerza laboral altamente calificada (operarias de taller experimentadas y una economista de excelencia como Beatriz Pinzón), la organización padece profundas disfunciones en sus flujos informacionales:
  + *Silos informáticos y sobrecarga unipersonal:* Los datos contables y balances reales residen únicamente en la computadora de Betty, mientras la Junta Directiva recibe reportes manipulados en papel.
  + *Canales de comunicación distorsionados:* Coexistencia de órdenes verbales autoritarias en presidencia con un activo circuito de rumores ("radio pasillo" del Cuartel de las Feas) y un conmutador telefónico colapsado.
  + *Desalineación en la gestión de personas:* Prácticas de contratación sesgadas por cánones estéticos en desmedro de competencias objetivas (contratación de Patricia Fernández por influencias vs. aislamiento de Betty en "la cueva") y un manejo discrecional de legajos por parte de Saúl Gutiérrez.
]

#pagebreak()

// ==============================================================================
// 2. DIAGNÓSTICO DE HERRAMIENTAS Y CANALES (ESTADO ACTUAL VS. MEJORA)
// ==============================================================================
= 2. Diagnóstico de Herramientas y Canales (Estado Actual vs. Mejora)

A continuación, se completa la matriz diagnóstica respondiendo rigurosamente a las *5 preguntas cotidianas de gestión* según los procesos analizados en Ecomoda S.A., contrastando las fallas estructurales detectadas frente a las propuestas de mejora deseadas mediante Tecnologías de la Información para la Gestión.

#v(4pt)

#table(
  columns: (1.3fr, 2.35fr, 2.35fr),
  fill: (col, row) => if row == 0 { bg-table-header } else if calc.odd(row) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  align: (left + top, left + top, left + top),
  table.header(
    text(weight: "bold", fill: white)[Pregunta de Gestión],
    text(weight: "bold", fill: white)[Estado Actual / Falla Detectada (Ecomoda)],
    text(weight: "bold", fill: white)[Propuesta de Mejora (Deseado con TIG)],
  ),
  
  [
    *1. ¿Dónde se guardan los datos?*\
    #text(size: 7.8pt, fill: text-muted)[(Ej. carpetas físicas, Excel personal, mail, base centralizada)]
  ],
  [
    - *Dispersión en silos locales:* Los datos financieros y de costos reales están confinados en el disco rígido local de la computadora personal de Beatriz Pinzón Solano (en su oficina privada, "la cueva").
    - *Vulnerabilidad y doble contabilidad:* Existencia de balances duplicados ("el balance real" con pérdidas y deudas vs. "el balance proyectado/maquillado" para la Junta Directiva y bancos), guardados en disquetes magnéticos de 3½" sin cifrado ni copias de respaldo centralizadas.
    - *Archivadores de papel colapsados:* Los legajos de personal, antecedentes, solicitudes de aumento y sanciones reposan en carpetas colgantes y cajones de la oficina de RRHH (Dr. Gutiérrez) y secretaría (Patricia Fernández), sufriendo pérdidas frecuentes y extravíos.
    - *Cuadernos manuales en taller:* En el taller de corte y costura, Doña Inés y los cortadores anotan metros de tela consumidos en planillas impresas o cuadernos sin conexión con compras ni contabilidad.
  ],
  [
    - *Base de Datos Centralizada y ERP Cloud:* Implementación de un repositorio relacional único bajo arquitectura ERP para la industria textil (ej. SAP S/4HANA for Fashion u Odoo Enterprise), alojado en servidores seguros en la nube.
    - *Única Fuente de la Verdad (Single Source of Truth):* Unificación de todas las operaciones contables, compras de materias primas y pagos de nómina en una sola base auditada, eliminando archivos individuales en discos locales.
    - *Trazabilidad e Inmutabilidad de Registros:* Registro automático de auditoría (_audit trail_) con estampas de tiempo y firma digital de usuario para cada transacción, impidiendo la manipulación de balances contables o la duplicidad de estados financieros.
    - *Gestión Documental Digital de RRHH (DMS):* Digitalización integral de legajos, recibos de sueldo electrónicos y contratos con acceso restringido según normativas de protección de datos personales.
  ],
  
  [
    *2. ¿Qué equipos y programas usan?*\
    #text(size: 7.8pt, fill: text-muted)[(Ej. computadoras antiguas, carpetas compartidas, sistema modular)]
  ],
  [
    - *Hardware heterogéneo y obsoleto:* Terminales de escritorio individuales con tecnología antigua (monitores CRT, Windows 98/2000, escasa memoria RAM), sin servidores dedicados ni red LAN estructurada.
    - *Uso fragmentado de ofimática básica:* Planillas de Microsoft Excel aisladas sin validación de fórmulas; procesador de texto Word para memos. No existe software especializado de gestión textil (PLM / MRP).
    - *Herramientas gráficas improvisadas para reportes contables:* Uso insólito de programas de dibujo básico (*MS Paint*) por parte de Beatriz Pinzón para retocar y armar diagramas del balance general ante la ausencia de un software contable formal.
    - *Brecha de competencias operativas:* La secretaria de presidencia (Patricia Fernández, quien "hizo seis semestres de finanzas en la San Marino") carece de competencias ofimáticas básicas, borra archivos o depende de Betty para elaborar reportes elementales.
    - *Medios de almacenamiento frágiles:* Dependencia de disquetes magnéticos para transferir información confidencial entre presidencia y asesoría externa, con alto riesgo de corrupción de datos y filtración a competidores o socios fiscalizadores (Daniel Valencia).
  ],
  [
    - *Modernización de Infraestructura Tecnológica:* Sustitución de estaciones obsoletas por equipos modernos interconectados mediante una red corporativa protegida (VLANs segmentadas para Administración, Taller y Directiva).
    - *Suite Modular Integrada:*
      - _Módulo Financiero:_ Conciliación bancaria en tiempo real, costeo estándar y absorbente.
      - _Módulo de Producción y PLM Textil:_ Cálculo automatizado de consumos de hilados, telas importadas y mermas de corte.
      - _Módulo de RRHH (HRMS):_ Liquidación automática de nómina, control biométrico de jornada y portal de autogestión.
    - *Almacenamiento Corporativo Seguro:* Supresión definitiva de disquetes y memorias extraíbles no autorizadas. Migración a almacenamiento en nube cifrado con políticas estrictas de copias de seguridad incrementales diarias.
  ],
  
  [
    *3. ¿Cómo se comunican las oficinas?*\
    #text(size: 7.8pt, fill: text-muted)[(Ej. notas en papel, expediente digital, mail, WhatsApp)]
  ],
  [
    - *Sobrecarga de memorandos en papel:* Toda solicitud de tela, orden de viáticos, queja o reporte requiere memorandos físicos mecanografiados que Freddy Contreras (mensajero en moto) traslada manualmente de un piso a otro.
    - *Conmutador telefónico saturado:* Aura María Fuentes opera una centralita analógica manual que colapsa con llamadas externas e internas, filtrando llamadas discrecionalmente y generando costos desmedidos por llamadas personales sin control (ej. Patricia llamando a Miami).
    - *Comunicación informal ("Radio Pasillo"):* Ante la ausencia de canales institucionales formales, el "Cuartel de las Feas" y el personal difunden novedades mediante rumores de pasillo, generando zozobra, desinformación y tensiones de clima laboral.
    - *Directivas verbales intempestivas:* Armando Mendoza emite instrucciones operativas a los gritos por el intercomunicador analógico de su escritorio, sin dejar registro de autorizaciones ni acuerdos formales.
  ],
  [
    - *Intranet Corporativa y Plataforma Colaborativa:* Adopción de herramientas corporativas seguras (ej. Microsoft Teams / Google Workspace institucional) con canales formales por gerencia y carteleras digitales informativas.
    - *Sistema de Flujos de Trabajo Digital (Workflow):* Reemplazo de memorandos por formularios digitales y solicitudes electrónicas (compras, adelantos, licencias) con trazabilidad de estado (Pendiente, Aprobado, Rechazado) y firmas digitales.
    - *Telefonía IP (VoIP) con Enrutamiento Inteligente:* Central digital con asignación de internos directos, buzón corporativo y restricción de discado por perfil, eliminando intermediaciones innecesarias y reduciendo gastos de comunicación.
    - *Canal Institucional de Transparencia de RRHH:* Difusión transparente de comunicados de la Junta Directiva, cronogramas de pago y beneficios laborales, desactivando los rumores de pasillo.
  ],
  
  [
    *4. ¿Quiénes cargan y usan los datos?*\
    #text(size: 7.8pt, fill: text-muted)[(Ej. empleados de mesa de entrada, selectores, jefes, directores)]
  ],
  [
    - *Centralización patológica en un solo rol:* Beatriz Pinzón concentra el 90% de la carga de datos contables, formulación de proyecciones, estados de endeudamiento y costos de taller, transformándose en un cuello de botella crítico y asumiendo un nivel destructivo de sobrecarga laboral.
    - *Incompetencia en roles clave:* Patricia Fernández cobra sueldo como secretaria de presidencia pero no carga datos ni sabe procesar cifras, delegando su trabajo o cometiendo errores que retrasan la gestión diaria.
    - *Gestión arbitraria de RRHH:* El Dr. Saúl Gutiérrez carga y modifica novedades de personal de manera discrecional, beneficiando o perjudicando a empleados según favoritismos personales ("guti-gut"), sin criterios estandarizados.
    - *Aislamiento del Taller de Diseño:* Hugo Lombardi y Doña Inesita no cargan métricas de producción; los pedidos de telas importadas se hacen a mano alzada como urgencias a presidencia.
    - *Consumo pasivo y ciego de la Junta Directiva:* La Junta Directiva (Roberto Mendoza, Daniel Valencia) solo revisa reportes impresos sintetizados, sin acceso directo a los datos transaccionales para corroborar su autenticidad.
  ],
  [
    - *Control de Acceso Basado en Roles (RBAC):*
      - _Operarias de Taller:_ Carga directa de prendas cortadas y desperdicios mediante terminales táctiles industriales simplificadas.
      - _Asistentes de RRHH:_ Registro de novedades y justificaciones médicas con validación documental obligatoria.
      - _Contabilidad y Finanzas:_ Registro segregado de facturas, cheques y transferencias (principio contable de cuatro ojos: quien carga no autoriza).
      - _Gerencias y Junta Directiva:_ Acceso exclusivo a Dashboards analíticos interactivos para monitoreo en tiempo real.
    - *Descentralización Responsable:* Descarga de tareas operativas rutinarias sobre perfiles operativos debidamente capacitados, liberando a la Asistencia Financiera (Betty) para análisis estratégico.
    - *Evaluación de Competencias del Puesto:* Reestructuración de funciones asegurando que quien ocupe un cargo administrativo demuestre competencias técnicas reales para la carga y uso de datos.
  ],
  
  [
    *5. ¿Qué normas o reglas se siguen?*\
    #text(size: 7.8pt, fill: text-muted)[(Ej. ley de procedimiento, convenio colectivo, manuales de trámite)]
  ],
  [
    - *Gestión autocrática y personalista:* Las decisiones financieras y de compras responden a impulsos unilaterales del Presidente (Armando Mendoza), quien vulnera los techos presupuestarios aprobados por la Junta Directiva.
    - *Ausencia de Manuales de Procedimientos:* Inexistencia de manuales de funciones y procedimientos escritos; cada área trabaja por costumbre o por exigencias de última hora.
    - *Vulneración de Normas Legales y Societarias:* Falsificación de estados financieros presentados a entidades bancarias para obtener créditos y creación encubierta de una empresa pantalla ("Terramoda Ltda.") con embargo preventivo para ocultar el descalabro financiero de Ecomoda.
    - *Procesos de selección discriminatorios:* Decisiones de contratación marcadas por prejuicios estéticos y presiones familiares/sociales (la imposición de Patricia por recomendación de Marcela Valencia vs. la discriminación inicial sufrida por Betty pese a su doctorado y méritos académicos sobresalientes).
  ],
  [
    - *Sistema de Gestión de la Calidad (ISO 9001:2015):* Formalización y documentación de los procesos clave de la organización (diseño, compras, confección, ventas y liquidación de nómina).
    - *Gobierno Corporativo y Compliance (Cumplimiento):* Adopción de un estricto Código de Ética y Transparencia Corporativa, con auditorías externas semestrales obligatorias y prohibición estatutaria de balances contables paralelos o empresas pantalla no declaradas.
    - *Reglamento Interno de Trabajo Homologado:* Protocolos claros de sanciones, reconocimientos y prevención del acoso laboral (evitando la discrecionalidad del Dr. Gutiérrez).
    - *Protocolo de Selección por Competencias y Mérito:* Implementación de políticas de reclutamiento ciego y baremos técnicos auditables en RRHH, desterrando cualquier discriminación física o favoritismo en el ingreso a la empresa.
  ],
)

#v(8pt)

#alerta[
  *Falla Sistémica Fundamental en Ecomoda:* La falta de un sistema de información formalizado, auditable y descentralizado fue el caldo de cultivo que permitió la manipulación de balances, el secretismo de Terramoda y la fijación de metas comerciales inalcanzables. Cuando los datos están secuestrados en hojas de cálculo individuales o en la memoria de un solo colaborador, la organización pierde su gobernanza institucional y queda al borde de la quiebra.
]

#v(8pt)

// ==============================================================================
// EVIDENCIA VISUAL DE AUDITORÍA: BETTY USANDO PAINT PARA EL BALANCE GENERAL
// ==============================================================================
#block(
  width: 100%,
  breakable: false,
  stroke: 0.8pt + orange-accent,
  fill: rgb("#fffcf8"),
  radius: 4pt,
  inset: (x: 11pt, y: 9pt),
)[
  #grid(
    columns: (130pt, 1fr),
    gutter: 12pt,
    align: (center + horizon, left + top),
    [
      #block(radius: 3pt, clip: true)[
        #image("Assets/betyusandopaintenbalancegeneral.jpg", width: 100%)
      ]
      #v(3pt)
      #text(size: 7.2pt, fill: text-muted, style: "italic")[
        Evidencia diagnóstica: Beatriz Pinzón en "la cueva" retocando el Balance General en MS Paint.
      ]
    ],
    [
      #text(weight: "bold", size: 9pt, fill: orange-accent)[
        🔍 EVIDENCIA DIAGNÓSTICA DE CAMPO · HERRAMIENTAS Y VULNERABILIDAD
      ]\
      #v(3pt)
      #text(size: 8.4pt, fill: text-main)[
        *Hallazgo de Auditoría Informática:* La Asistente de Presidencia (Beatriz Pinzón Solano), carente de un sistema ERP y forzada a cuadrar estados contables confidenciales sin soporte técnico institucional, edita y diseña el *Balance General* corporativo directamente en *Microsoft Paint* sobre una estación con Windows 98. La falta de software contable integrado y de validaciones computarizadas obliga a manipular celdas, gráficos y cifras a mano alzada.
      ]\
      #v(4pt)
      #block(
        width: 100%,
        fill: rgb("#fef3e2"),
        stroke: (left: 3.5pt + orange-accent),
        inset: (x: 8pt, y: 5pt),
        radius: (right: 3pt),
        [
          #text(size: 8.2pt, fill: rgb("#9c4206"), weight: "semibold")[
            📌 *Nota de la Consultoría (Diagnóstico TIG / Capacitación en RRHH):*\
            _«Diagnóstico urgente de capacitación: Se dictamina que Betty requerirá con suma urgencia un curso intensivo y avanzado de Microsoft Excel, modelado de hojas de cálculo financieras y la inmediata migración hacia un sistema ERP corporativo integrado. De lo contrario, los balances de Ecomoda y la estabilidad patrimonial de la empresa seguirán dependiendo del pulso del mouse, disquetes prestados de 3½" y la creatividad artística de la economista en Paint»._
          ]
        ]
      )
    ]
  )
]

#pagebreak()

// ==============================================================================
// DE DATOS SUELTOS A INFORMACIÓN ÚTIL PARA DECIDIR
// ==============================================================================
== De Datos Sueltos a Información Útil para Decidir: (Casos Concretos en Ecomoda)

A continuación, se demuestra cómo la recolección de *datos crudos de entrada* se transforma, a través del procesamiento del sistema, en *información estratégica de alto valor* para la toma de decisiones:

#v(2pt)

#block(
  width: 100%,
  stroke: (left: 4.5pt + primary, rest: 0.6pt + border-subtle),
  fill: bg-card,
  inset: (x: 10pt, y: 5pt),
  radius: (right: 4pt),
)[
  #text(weight: "bold", fill: primary, size: 9.5pt)[• Ejemplo 1: Producción Textil y Finanzas] #h(6pt)
  #text(style: "italic", size: 8.2pt, fill: text-muted)[(Costeo Colección Hugo Lombardi y Mermas de Taller)]
  
  #v(1pt)
  - *Dato Crudo de Entrada:*\
    #text(fill: text-main)[
      Consumo físico en terminal de taller: _"OP N° 408 - Vestido de Gala Seda Salvaje - Metros utilizados: 7,5 m - Horas insumidas de costura: 9,2 hs - Merma de tela no reutilizable: 2,1 m - Factura proveedor: \$95.000 COP/m"._
    ]
  
  #v(1pt)
  - *¿Qué hace el sistema? (Clasifica / Calcula / Suma / Ordena):*\
    #text(fill: text-main)[
      *Calcula, Suma y Compara:* Multiplica metros por costo unitario (\$712.500 COP), suma mano de obra (\$165.600 COP) y costos indirectos. Compara costo unitario (\$980.000 COP) contra precio mayorista (\$1.050.000 COP). Calcula margen real (6,6%) vs. umbral del 35% de la Junta. Clasifica como _"Prenda Crítica / Fuera de Estándar"_ por merma excesiva (+180%).
    ]
  
  #v(1pt)
  - *Información Resultante para la Gestión:*\
    #text(fill: text-main)[
      *Reporte Ejecutivo de Rentabilidad:* _"El 42% de los vestidos de Hugo Lombardi presenta márgenes menores al 10% por mermas en corte. Se alerta un déficit neto de \$320 millones de COP antes del desfile si no se rediseñan moldes o ajustan precios"._
    ]
]

#v(3pt)

#block(
  width: 100%,
  stroke: (left: 4.5pt + orange-accent, rest: 0.6pt + border-subtle),
  fill: bg-alert,
  inset: (x: 10pt, y: 5pt),
  radius: (right: 4pt),
)[
  #text(weight: "bold", fill: orange-accent, size: 9.5pt)[• Ejemplo 2: Recursos Humanos y Productividad] #h(6pt)
  #text(style: "italic", size: 8.2pt, fill: text-muted)[(Control Horario: Patricia Fernández vs. Beatriz Pinzón)]
  
  #v(1pt)
  - *Dato Crudo de Entrada:*\
    #text(fill: text-main)[
      Marcaciones en reloj biométrico: _"ID 012 - Patricia Fernández - Entrada: 09:18 hs (Oficial: 08:00 hs) - Salida: 16:30 hs (Oficial: 17:30 hs)"_ y simultáneamente: _"ID 001 - Beatriz Pinzón - Entrada: 07:10 hs - Salida final: 22:15 hs"._
    ]
  
  #v(1pt)
  - *¿Qué hace el sistema? (Clasifica / Calcula / Suma / Ordena):*\
    #text(fill: text-main)[
      *Clasifica, Resta y Suma:* Compara fichadas contra turno contractual. Clasifica a Patricia con _"Llegada Tardía Severa (>60 min)"_ y 185 min incumplidos. Computa 15h 5min de Betty (+6 hs extras no autorizadas). Suma tardanzas mensuales por sector y ordena por puntualidad.
    ]
  
  #v(1pt)
  - *Información Resultante para la Gestión:*\
    #text(fill: text-main)[
      *Indicador de Cumplimiento y Riesgo Psicosocial:* _"Recepción acumula 42 hs mensuales no trabajadas por colaborador (\$2.100.000 COP improductivos). Betty registra 68 hs extras mensuales sin compensar (riesgo crítico de burnout)"._ RRHH aplica descuentos objetivos y redistribuye tareas.
    ]
]

#v(3pt)

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: white,
  inset: (x: 8pt, y: 5pt),
  radius: 4pt,
)[
  #text(weight: "bold", fill: primary, size: 8.6pt)[Síntesis del Valor Transformador del Sistema en Ecomoda S.A.:]\
  #v(1pt)
  #table(
    columns: (1.1fr, 1.4fr, 1.4fr, 1.3fr),
    fill: (col, row) => if row == 0 { primary } else if calc.odd(row) { bg-card } else { white },
    stroke: 0.4pt + border-subtle,
    table.header(
      text(weight: "bold", fill: white)[Área Funcional],
      text(weight: "bold", fill: white)[Dato Crudo Ingresado],
      text(weight: "bold", fill: white)[Proceso TIG (Algoritmo)],
      text(weight: "bold", fill: white)[Decisión Gerencial Habilitada],
    ),
    [Taller / Finanzas],
    [Metros de tela y horas de costura en orden N° 408],
    [Calcula costo unitario real vs. margen comercial],
    [Rediseñar moldes y frenar pérdidas operativas],
    
    [RRHH / Personal],
    [Fichada biométrica de entrada/salida y refrigerios],
    [Resta minutos incumplidos y suma horas extras],
    [Sancionar impuntualidad y equilibrar cargas laborales],
  )
]

#pagebreak()

// ==============================================================================
// 3. MEJORA DE LA GESTIÓN Y PEDIDOS AL SISTEMA
// ==============================================================================
= 3. Mejora de la Gestión y Pedidos al Sistema

Para resolver de raíz las disfunciones diagnosticadas en Ecomoda S.A., se plantea una solución integral estructurada bajo las *3 miradas de la gestión organizacional (Tecnología, Personas y Reglas)*, seguida por tres requerimientos funcionales prioritarios que deberán ser programados en el nuevo sistema.

#v(4pt)

== Las 3 Miradas de la Solución (Tecnología, Personas y Reglas)

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: white,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
)[
  #text(weight: "bold", fill: primary, size: 10pt)[1. Mirada Tecnológica (¿Qué software o pantalla unificada necesitan?)]\
  #v(3pt)
  #text(fill: text-main)[
    Ecomoda requiere la implementación de un *Sistema ERP Modular en la Nube con Vertical Textil (tipo SAP for Apparel u Odoo Manufacturing & Retail)* que consolide los módulos de Compras, Producción (Taller), Inventarios, Ventas, Finanzas y Recursos Humanos bajo una única base de datos relacional protegida.
    
    *Pantalla Unificada Clave (Dashboard Ejecutivo de Presidencia):*\
    Se requiere un panel de control interactivo en tiempo real donde la Presidencia y la Junta Directiva visualicen simultáneamente cuatro cuadrantes estratégicos sin depender de intermediarios ni de informes impresos:
    - _Cuadrante Financiero:_ Flujo de caja proyectado vs. real, compromisos de deuda bancaria exigibles a 30/60/90 días y margen de rentabilidad neto global.
    - _Cuadrante de Producción:_ Porcentaje de avance de las colecciones de Hugo Lombardi, stock disponible de telas en metros y tasa porcentual de desperdicio en taller de corte.
    - _Cuadrante Comercial:_ Pedidos mayoristas cerrados, estado de cobranzas de clientes clave y facturación diaria.
    - _Cuadrante de Talento Humano:_ Índice de asistencia en tiempo real, dotación activa, horas extras devengadas y cumplimiento de normas de seguridad laboral.
  ]
]

#v(8pt)

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: white,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
)[
  #text(weight: "bold", fill: primary, size: 10pt)[2. Mirada Organizacional (¿Cómo capacitan al personal para que adopte el sistema?)]\
  #v(3pt)
  #text(fill: text-main)[
    La adopción tecnológica requiere una *estrategia de gestión del cambio (Change Management)* con un enfoque pedagógico, inclusivo y adaptado a los distintos perfiles de Ecomoda:
    - *Capacitación adaptada al Taller de Confección:* Diseñar talleres prácticos en el propio taller para Doña Inesita y las modistas, utilizando pantallas táctiles intuitivas con iconografía clara y códigos de barras/QR para registrar telas y prendas terminadas, transmitiéndoles que el sistema no busca castigar el trabajo manual sino valorar su esfuerzo y evitar sobrecargas de horas extras.
    - *Nivelación de Competencias Administrativas:* Implementar un plan de alfabetización digital y uso del módulo de gestión para secretarias y personal de recepción (incluyendo a Patricia Fernández y a los miembros del "Cuartel de las Feas"). Se establecerán evaluaciones de idoneidad práctica para asegurar que cada colaboradora domine las funciones básicas de su rol.
    - *Profesionalización de Logística y Mensajería:* Capacitar a Freddy Contreras en el uso de dispositivos móviles (tablets o terminales portátiles) para confirmación de entrega de documentación y valijas mediante firma digital, eliminando el trasiego de papel y jerarquizando su función dentro de la cadena de valor.
    - *Liderazgo de Proyecto y Sponsor Interno:* Designar a Beatriz Pinzón Solano como Directora de Transformación Digital y Gobierno de Datos, reconociendo su liderazgo técnico y otorgándole respaldo institucional explícito ante la Junta Directiva para desarticular resistencias corporativas.
  ]
]

#pagebreak()

#block(
  width: 100%,
  stroke: 0.6pt + border-subtle,
  fill: white,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
)[
  #text(weight: "bold", fill: primary, size: 10pt)[3. Mirada Administrativa (¿Qué norma, regla o formulario en papel cambia o se elimina?)]\
  #v(3pt)
  #text(fill: text-main)[
    La modernización de la información exige transformaciones normativas y regulatorias de fondo:
    - *Política Institucional "Cero Papel" y Derogación de Memos Físicos:* Se eliminan formalmente los memorandos impresos mecanografiados, los vales manuscritos de caja chica, los recibos de tela en papel carbónico y los cuadernos de asistencia. Todos los trámites se gestionan mediante solicitudes electrónicas con firma digital.
    - *Modificación Estatutaria de Transparencia y Gobierno Corporativo:* Modificación de los estatutos de Ecomoda para establecer la inmutabilidad y unicidad de los balances contables. Se tipifica como falta gravísima con despido justificado y responsabilidad penal cualquier intento de elaboración de informes contables paralelos, valuaciones ficticias de inventarios o constitución de firmas pantalla sin aprobación expresa de la Junta Directiva (blindaje contra la repetición del esquema Terramoda).
    - *Manual de Organización y Funciones (MOF) con Reclutamiento por Mérito:* Derogación de las prácticas discrecionales de contratación y fijación de remuneraciones del Dr. Gutiérrez. Se aprueba un Manual de Selección basado exclusivamente en competencias técnicas, pruebas de conocimiento estandarizadas y títulos profesionales homologados, erradicando los prejuicios de apariencia física o las recomendaciones familiares.
  ]
]

#v(10pt)

// ==============================================================================
// TRES PEDIDOS CLAVE AL NUEVO SISTEMA
// ==============================================================================
== Tres Pedidos Clave al Nuevo Sistema (Requerimientos Funcionales de Gestión)

En concordancia con los problemas críticos identificados en la empresa textil, se formulan los tres requerimientos automatizados indispensables que deben ser programados en el software:

#v(4pt)

#block(
  width: 100%,
  stroke: (left: 4.5pt + teal-accent, rest: 0.6pt + border-subtle),
  fill: bg-card,
  inset: (x: 12pt, y: 8pt),
  radius: (right: 3pt),
)[
  #text(weight: "bold", fill: primary)[• Pedido 1 (Control Presupuestario y Prevención de Endeudamiento No Autorizado):]\
  #v(2pt)
  *El sistema debe automáticamente* *bloquear la emisión o confirmación de cualquier orden de compra de materias primas (telas, botones, hilos) o contratación de servicios externos cuando su valor acumulado supere el techo presupuestario asignado por la Junta Directiva a esa colección o centro de costos*, emitiendo una notificación instantánea e ineludible a la Junta Directiva y a la Gerencia Financiera, requiriendo una doble autorización digital antes de comprometer fondos de la compañía.
]

#v(6pt)

#block(
  width: 100%,
  stroke: (left: 4.5pt + teal-accent, rest: 0.6pt + border-subtle),
  fill: bg-card,
  inset: (x: 12pt, y: 8pt),
  radius: (right: 3pt),
)[
  #text(weight: "bold", fill: primary)[• Pedido 2 (Liquidación Objetiva de Nómina y Control de Ausentismo):]\
  #v(2pt)
  *El sistema debe automáticamente* *consolidar los registros biométricos de entrada/salida, los partes diarios de horas extras del taller de confección y las constancias médicas validadas para calcular la nómina mensual sin intervención manual*, aplicando automáticamente las deducciones por impuntualidad injustificada y liquidando las horas extraordinarias debidamente compensadas, generando los recibos de sueldo digitales con firma electrónica y enviándolos al buzón de autogestión de cada empleado.
]

#v(6pt)

#block(
  width: 100%,
  stroke: (left: 4.5pt + teal-accent, rest: 0.6pt + border-subtle),
  fill: bg-card,
  inset: (x: 12pt, y: 8pt),
  radius: (right: 3pt),
)[
  #text(weight: "bold", fill: primary)[• Pedido 3 (Trazabilidad Contable en Tiempo Real e Integridad de Balances):]\
  #v(2pt)
  *El sistema debe automáticamente* *generar los Estados Contables y el Balance General en tiempo real a partir del registro transaccional directo de ventas, compras e inventarios*, calculando el margen de rentabilidad por producto e impidiendo cualquier ajuste, recálculo o manipulación manual de cifras sin un registro de auditoría inmutable (_audit log_) que consigne usuario, fecha, hora y justificación técnica ante el Consejo de Administración.
]

#pagebreak()

// ==============================================================================
// 4. ANÁLISIS SISTÉMICO Y CONCLUSIÓN INSTITUCIONAL
// ==============================================================================
= 4. Análisis Sistémico y Conclusiones Institucionales

El caso de *Ecomoda S.A.* representa un laboratorio organizacional de enorme riqueza para comprender la interacción recíproca entre la *Teoría General de Sistemas (TGS)*, las *Tecnologías de la Información para la Gestión (TIG)* y la *Administración Estratégica de los Recursos Humanos*.

#v(4pt)

== 4.1. Análisis Crítico: La Entropía de Ecomoda y la Pérdida de la Homeostasis (TGS)
Desde la perspectiva de la TGS, Ecomoda operaba como un sistema abierto con un déficit crítico de *retroalimentación negativa (feedback correctivo)*:
- *Desconexión entre Entorno y Conducción:* La Presidencia de Armando Mendoza fijó metas de ventas y márgenes basadas en voluntarismo y estatus, ignorando las restricciones del entorno económico y la capacidad instalada real del taller.
- *Entropía y Opacidad Informativa:* Al carecer de un sistema de información formal que vinculara compras, mermas y balances, el sistema acumuló entropía interna (desorden, desvío presupuestario y endeudamiento). En lugar de incorporar negentropía (información para el orden), la dirección recurrió al secretismo mediante una empresa pantalla (*Terramoda Ltda.*) y balances adulterados.
- *El Disquete como Símbolo de Vulnerabilidad:* La dependencia de un disquete magnético de 3½" en el escritorio de Betty para sostener el destino patrimonial de la firma ilustra la extrema precariedad provocada por la falta de institucionalización de las TIG.

#v(6pt)

== 4.2. El Factor Humano: Desvalorización del Talento y Sesgos Discriminatorios en RRHH
Desde la óptica de la gestión de personas, Ecomoda expone la paradoja del capital humano subutilizado y discriminado:
- *La Paradoja Betty vs. Patricia:* Beatriz Pinzón, con un capital intelectual brillante (economista con honores y posgrados), fue recluida en un cubículo por cánones estéticos. En contraste, Patricia Fernández fue designada como secretaria ejecutiva por influencias personales y apariencia, a pesar de su manifiesta inoperancia administrativa.
- *Clientelismo y Discrecionalidad:* La jefatura de personal en manos del Dr. Saúl Gutiérrez ejemplifica una gestión arbitraria, donde las licencias, sanciones y el clima laboral quedan sujetos a favoritismos personales y abusos de poder ("guti-gut").
- *La Red Informal como Mecanismo de Defensa:* El "Cuartel de las Feas" configuró una red sociotécnica adaptativa para protegerse colectivamente frente a la exclusión, hostilidad y desinformación generada por la cúpula directiva.

#pagebreak()

== 4.3. Matriz de Madurez Organizacional: Ecomoda Tradicional vs. Ecomoda con TIG

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (col, row) => if row == 0 { primary } else if calc.odd(row) { bg-card } else { white },
  stroke: 0.4pt + border-subtle,
  table.header(
    text(weight: "bold", fill: white)[Dimensión],
    text(weight: "bold", fill: white)[Modelo Tradicional (Crisis Ecomoda)],
    text(weight: "bold", fill: white)[Modelo Rediseñado con TIG],
  ),
  [Gobierno de Datos],
  [Silos en PC de Betty, disquetes sin control y balances dobles.],
  [ERP Cloud con Base de Datos Única y registro de auditoría.],
  
  [Gestión de Personas],
  [Selección por apariencia física, acoso y discrecionalidad de Gutiérrez.],
  [Reclutamiento ciego por competencias, mérito y legajo digital.],
  
  [Producción y Costos],
  [Hugo Lombardi derrocha telas sin control de mermas.],
  [Control PLM Textil, costeo estándar y alertas automáticas.],
  
  [Canales Internos],
  [Memos en papel llevados por Freddy, chismes y conmutador colapsado.],
  [Workflow digital Cero Papel, Intranet y telefonía IP.],
  
  [Toma de Decisiones],
  [Autocrática, impulsiva y a espaldas de la Junta Directiva.],
  [Dashboard Ejecutivo en tiempo real con datos objetivos.],
)

#v(8pt)

== 4.4. Conclusiones y Recomendaciones para la Gestión Estratégica
La transformación de Ecomoda hacia un modelo sostenible y transparente no depende únicamente de adquirir software moderno, sino de una sincronización armónica entre *tecnología, personas y reglas*:
+ *Institucionalizar la Gobernanza de Datos:* Erradicar la propiedad individual de la información. Los datos son un bien público de la corporación y deben regirse por principios de integridad, disponibilidad y confidencialidad.
+ *Meritocracia y Equidad:* La profesionalización de RRHH a través de perfiles de puesto por competencias y concursos objetivos es la única garantía para retener el mejor talento humano, libre de prejuicios estéticos.
+ *Transparencia como Garante Ético:* Las TIG hacen inviable la manipulación contable, protegiendo a los colaboradores honestos y blindando a la organización contra riesgos de quiebra.

#v(8pt)

#callout[
  #text(weight: "bold", fill: primary)[Conclusión de Cátedra:]\
  El rediseño propuesto demuestra que un Sistema de Información para la Gestión no es un mero artefacto computacional, sino una *arquitectura socio-técnica*. Cuando la tecnología se diseña al servicio de la justicia laboral, la eficiencia productiva y la transparencia directiva, las organizaciones logran sanar sus crisis más profundas y transformar el talento de su gente en valor perdurable.
]

#v(10pt)

#line(length: 100%, stroke: 0.5pt + border-subtle)
#v(3pt)
#align(center)[
  #text(size: 8.4pt, fill: text-muted)[
    Trabajo Práctico desarrollado por *Hector Daniel Ayarachi Fuentes* (DNI 35.492.138 · Leg. CURZA-8284) y *Andrea Alejandra Díaz* (DNI 27.786.409 · Leg. CURZA-7229) para la cátedra de *Tecnología de la Información para la Gestión (TIG)*.\
    Centro Universitario Regional Zona Atlántica y Sur (CURZAS) · Universidad Nacional del Comahue · 2026.
  ]
]
