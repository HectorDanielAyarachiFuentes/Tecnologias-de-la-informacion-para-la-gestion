# /// script
# dependencies = [
#   "fpdf2",
# ]
# ///
import os
import csv
from fpdf import FPDF

class StyledPDF(FPDF):
    def header(self):
        # Header only on pages after the cover page
        if self.page_no() == 1:
            return
        
        # Primary Teal Accent Bar
        self.set_fill_color(14, 104, 115)  # Teal (#0e6873)
        self.rect(20, 10, 170, 1.5, "F")
        
        self.set_y(13)
        self.set_text_color(120, 120, 120)
        self.set_font("Helvetica", "B", 8)
        self.cell(100, 5, "LABORATORIO DE PROMPTS INTERVENIBLES - INFORME")
        self.set_font("Helvetica", "", 8)
        self.cell(70, 5, "SEMANA 1 · ACTIVIDAD DE APRENDIZAJE", align="R")
        self.ln(8)

    def footer(self):
        # Footer on all pages
        self.set_y(-18)
        self.set_fill_color(200, 200, 200)
        self.rect(20, self.get_y(), 170, 0.5, "F")
        
        self.set_y(-15)
        self.set_text_color(120, 120, 120)
        self.set_font("Helvetica", "I", 8)
        self.cell(0, 10, f"Página {self.page_no()} de {self.pages_count if self.pages_count else '{nb}'}", align="C")

    def page_cover(self):
        self.add_page()
        # Large Decorative Teal Bar on the left
        self.set_fill_color(14, 104, 115)
        self.rect(20, 40, 6, 210, "F")
        
        # Orange Accent Bar at the top right
        self.set_fill_color(198, 89, 17) # Orange (#c65911)
        self.rect(32, 40, 158, 2, "F")
        
        # Title text
        self.set_xy(32, 50)
        self.set_text_color(14, 104, 115)
        self.set_font("Helvetica", "B", 26)
        self.multi_cell(145, 12, "LABORATORIO DE PROMPTS\nINTERVENIBLES", align="L")
        
        self.ln(5)
        self.set_x(32)
        self.set_text_color(44, 62, 80)
        self.set_font("Helvetica", "I", 14)
        self.cell(0, 8, "Reporte Final de Experimentación y Resultados")
        self.ln(1)
        
        # Orange highlight text box
        self.set_fill_color(253, 246, 240)
        self.rect(32, 95, 145, 25, "F")
        self.set_fill_color(198, 89, 17)
        self.rect(32, 95, 2, 25, "F")
        
        self.set_xy(36, 97)
        self.set_font("Helvetica", "B", 10)
        self.set_text_color(198, 89, 17)
        self.cell(0, 5, "PROPÓSITO DE LA ACTIVIDAD")
        self.ln(5)
        self.set_x(36)
        self.set_font("Helvetica", "", 9.5)
        self.set_text_color(44, 62, 80)
        self.multi_cell(137, 4.5, "Comprender la separación entre las instrucciones que controlan el comportamiento de una IA y el conocimiento/datos que la alimentan, a través de la modificación y prueba de prompts en distintas estaciones de trabajo.")
        
        # Metadata section
        self.set_xy(32, 170)
        self.set_text_color(120, 120, 120)
        self.set_font("Helvetica", "B", 10)
        self.cell(0, 5, "ESTUDIANTE / EXPERIMENTADOR:")
        self.ln(5)
        self.set_x(32)
        self.set_font("Helvetica", "", 11)
        self.set_text_color(14, 104, 115)
        self.cell(0, 6, "Hector Daniel Ayarachi Fuentes")
        self.ln(6)
        
        self.ln(4)
        self.set_x(32)
        self.set_text_color(120, 120, 120)
        self.set_font("Helvetica", "B", 10)
        self.cell(0, 5, "FECHA DE ENTREGA:")
        self.ln(5)
        self.set_x(32)
        self.set_font("Helvetica", "", 11)
        self.set_text_color(44, 62, 80)
        self.cell(0, 6, "14 de Agosto de 2026")
        self.ln(6)
        
        self.ln(4)
        self.set_x(32)
        self.set_text_color(120, 120, 120)
        self.set_font("Helvetica", "B", 10)
        self.cell(0, 5, "MATERIA / CONTEXTO:")
        self.ln(5)
        self.set_x(32)
        self.set_font("Helvetica", "", 11)
        self.set_text_color(44, 62, 80)
        self.cell(0, 6, "Tecnología de la Información")
        self.ln(6)
        
        self.ln(10)

    def section_title(self, title, subtitle=None):
        self.ln(4)
        self.set_font("Helvetica", "B", 13)
        self.set_text_color(14, 104, 115) # Teal
        self.cell(0, 8, title)
        self.ln(8)
        
        if subtitle:
            self.set_font("Helvetica", "I", 9.5)
            self.set_text_color(100, 100, 100)
            self.cell(0, 5, subtitle)
            self.ln(5)
        
        self.set_fill_color(14, 104, 115)
        self.rect(20, self.get_y() + 1, 35, 1, "F")
        self.ln(4)

    def heading3(self, text):
        self.set_font("Helvetica", "B", 10.5)
        self.set_text_color(44, 62, 80)
        self.cell(0, 6, text)
        self.ln(6)
        self.ln(1)

    def paragraph(self, text, bold_prefix=None):
        self.set_font("Helvetica", "", 9.5)
        self.set_text_color(44, 62, 80)
        if bold_prefix:
            self.set_font("Helvetica", "B", 9.5)
            self.write(5, bold_prefix + " ")
            self.set_font("Helvetica", "", 9.5)
            self.write(5, text + "\n")
        else:
            self.multi_cell(0, 4.8, text)
        self.ln(1)

    def callout_box(self, title, text, type="info"):
        self.ln(1.5)
        start_y = self.get_y()
        self.set_font("Helvetica", "B", 9.5)
        
        if type == "warning":
            border_color = (198, 89, 17) # Orange
            bg_color = (253, 246, 240)
        else:
            border_color = (14, 104, 115) # Teal
            bg_color = (242, 247, 247)
            
        self.set_text_color(*border_color)
        
        width = self.epw
        
        # Calculate heights
        self.set_font("Helvetica", "B", 9.5)
        title_lines = self.multi_cell(width - 8, 4.5, title, dry_run=True, output="LINES")
        self.set_font("Helvetica", "", 9)
        self.set_text_color(44, 62, 80)
        text_lines = self.multi_cell(width - 8, 4.5, text, dry_run=True, output="LINES")
        
        total_height = (len(title_lines) + len(text_lines)) * 4.5 + 8
        
        # Check for page break
        if start_y + total_height > self.page_break_trigger:
            self.add_page()
            start_y = self.get_y()
            
        self.set_fill_color(*bg_color)
        self.rect(20, start_y, width, total_height, "F")
        
        self.set_fill_color(*border_color)
        self.rect(20, start_y, 2, total_height, "F")
        
        self.set_y(start_y + 3)
        self.set_x(24)
        self.set_font("Helvetica", "B", 9.5)
        self.set_text_color(*border_color)
        self.multi_cell(width - 8, 4.5, title, align="L")
        
        self.set_x(24)
        self.set_font("Helvetica", "", 9)
        self.set_text_color(44, 62, 80)
        self.multi_cell(width - 8, 4.5, text, align="L")
        
        self.set_y(start_y + total_height)
        self.ln(1.5)

    def styled_table(self, headers, col_widths, rows):
        self.ln(1.5)
        self.set_fill_color(14, 104, 115) # Teal
        self.set_text_color(255, 255, 255)
        self.set_font("Helvetica", "B", 8.5)
        
        start_x = 20
        
        for i, header in enumerate(headers):
            self.cell(col_widths[i], 7, header, border=1, align="C", fill=True)
        self.ln()
        
        self.set_font("Helvetica", "", 8)
        self.set_text_color(44, 62, 80)
        
        alt = False
        for row in rows:
            if alt:
                self.set_fill_color(242, 247, 247)
            else:
                self.set_fill_color(255, 255, 255)
                
            max_lines = 1
            row_lines = []
            for i, val in enumerate(row):
                lines = self.multi_cell(col_widths[i], 4, str(val), dry_run=True, output="LINES")
                row_lines.append(lines)
                if len(lines) > max_lines:
                    max_lines = len(lines)
            
            row_height = max_lines * 4 + 2
            y_before = self.get_y()
            
            if y_before + row_height > self.page_break_trigger:
                self.add_page()
                self.set_fill_color(14, 104, 115)
                self.set_text_color(255, 255, 255)
                self.set_font("Helvetica", "B", 8.5)
                for j, header in enumerate(headers):
                    self.cell(col_widths[j], 7, header, border=1, align="C", fill=True)
                self.ln()
                self.set_font("Helvetica", "", 8)
                self.set_text_color(44, 62, 80)
                y_before = self.get_y()
            
            current_x = start_x
            for i, val in enumerate(row):
                self.set_xy(current_x, y_before)
                self.cell(col_widths[i], row_height, "", border=1, fill=True)
                self.set_xy(current_x, y_before + 1)
                text_to_print = "\n".join(row_lines[i])
                self.multi_cell(col_widths[i], 3.8, text_to_print, border=0, align="L")
                current_x += col_widths[i]
                
            self.set_xy(start_x, y_before + row_height)
            alt = not alt
        self.ln(1.5)

def clean_data():
    raw_records = [
        "inscripción p-001: ana silva. Mail ANA.SILVA@EXAMPLE.ORG; trabaja en Atención al Público. Le interesa Redacción Administrativa, prefiere presencial. Puede lunes o miércoles por la mañana.",
        "P002 / Bruno Costa / bruno.costa@example.org / área: rrhh / modalidad VIRTUAL / disponibilidad: martes después de las 13 / interés entrevistas laborales.",
        "Carla Méndez (registro P-003). Compras y contrataciones. Correo: carla.mendez@example.org. Pertenece a Administración. No indicó modalidad. Viernes de 9 a 14.",
        "p-004 - diego torres - diego.torres@example.org. Equipo de gestión; quiere Tableros de Gestión. Virtual. jueves 14:00 a 18:00. Observación: ya maneja planillas básicas.",
        "Registro P005: Elena Ruiz, elena.ruiz@example.org, Atención ciudadana. Prefiere presencial; disponibilidad jueves por la mañana. Curso de interés: Atención Ciudadana.",
        "P-006 | Fabián Luna | SIN CORREO | Protección de datos | todo el personal | puede miércoles desde las 14 | modalidad: indistinta.",
        "P004: Diego Tórres; DIEGO.TORRES@example.org; Gestión. Curso: indicadores de capacitación. Prefiere virtual y puede los lunes de 15 a 18. Posiblemente sea una segunda solicitud de la misma persona.",
        "Registro sin identificador: Gabriela Paz. Correo gabriela.paz@example.org. Área de RR.HH.; selección sin sesgos; viernes por la mañana; no informó modalidad.",
        "Hugo Rey - p-008 - hugo.rey@example.org - administración - Introducción a expedientes - lunes 8 a 12 - presencial. Agregó en otro mensaje que también puede los miércoles de 9 a 12."
    ]
    
    # 1. STEP 1 (Extraction)
    step1_rows = [
        ["p-001", "ana silva", "ANA.SILVA@EXAMPLE.ORG", "Atención al Público", "Redacción Administrativa", "presencial", "lunes o miércoles por la mañana", "NO INFORMADO"],
        ["P002", "Bruno Costa", "bruno.costa@example.org", "rrhh", "entrevistas laborales", "VIRTUAL", "martes después de las 13", "NO INFORMADO"],
        ["P-003", "Carla Méndez", "carla.mendez@example.org", "Administración", "Compras y contrataciones", "NO INFORMADO", "Viernes de 9 a 14", "NO INFORMADO"],
        ["p-004", "diego torres", "diego.torres@example.org", "Equipo de gestión", "Tableros de Gestión", "Virtual", "jueves 14:00 a 18:00", "ya maneja planillas básicas"],
        ["P005", "Elena Ruiz", "elena.ruiz@example.org", "Atención ciudadana", "Atención Ciudadana", "presencial", "jueves por la mañana", "NO INFORMADO"],
        ["P-006", "Fabián Luna", "SIN CORREO", "todo el personal", "Protección de datos", "indistinta", "puede miércoles desde las 14", "NO INFORMADO"],
        ["P004", "Diego Tórres", "DIEGO.TORRES@example.org", "Gestión", "indicadores de capacitación", "virtual", "lunes de 15 a 18", "Posiblemente sea una segunda solicitud de la misma persona"],
        ["SIN-ID", "Gabriela Paz", "gabriela.paz@example.org", "Área de RR.HH.", "selección sin sesgos", "NO INFORMADO", "viernes por la mañana", "NO INFORMADO"],
        ["p-008", "Hugo Rey", "hugo.rey@example.org", "administración", "Introducción a expedientes", "presencial", "lunes 8 a 12", "Agregó en otro mensaje que también puede los miércoles de 9 a 12"]
    ]
    
    # 2. STEP 2 (Normalization)
    step2_rows = [
        ["P-001", "Ana Silva", "ana.silva@example.org", "REVISAR", "Redacción Administrativa", "Presencial", "lunes o miércoles por la mañana", "NO INFORMADO", "NO", "Área no estándar (Atención al Público)"],
        ["P-002", "Bruno Costa", "bruno.costa@example.org", "Recursos Humanos", "entrevistas laborales", "Virtual", "martes después de las 13", "NO INFORMADO", "NO", "OK"],
        ["P-003", "Carla Méndez", "carla.mendez@example.org", "Administración", "Compras y contrataciones", "No informada", "Viernes de 9 a 14", "NO INFORMADO", "NO", "OK"],
        ["P-004", "Diego Torres", "diego.torres@example.org", "Gestión", "Tableros de Gestión", "Virtual", "jueves 14:00 a 18:00", "ya maneja planillas básicas", "SI", "ID y correo duplicado con registro 7"],
        ["P-005", "Elena Ruiz", "elena.ruiz@example.org", "Atención ciudadana", "Atención Ciudadana", "Presencial", "jueves por la mañana", "NO INFORMADO", "NO", "OK"],
        ["P-006", "Fabián Luna", "NO INFORMADO", "Todo el personal", "Protección de datos", "Indistinta", "puede miércoles desde las 14", "NO INFORMADO", "NO", "Falta correo"],
        ["P-004", "Diego Tórres", "diego.torres@example.org", "Gestión", "indicadores de capacitación", "Virtual", "lunes de 15 a 18", "Posiblemente sea una segunda solicitud de la misma persona", "SI", "ID y correo duplicado con registro 4"],
        ["SIN-ID", "Gabriela Paz", "gabriela.paz@example.org", "Recursos Humanos", "selección sin sesgos", "No informada", "viernes por la mañana", "NO INFORMADO", "NO", "Falta ID"],
        ["P-008", "Hugo Rey", "hugo.rey@example.org", "Administración", "Introducción a expedientes", "Presencial", "lunes 8 a 12", "Agregó en otro mensaje que también puede los miércoles de 9 a 12", "NO", "OK"]
    ]
    
    return step1_rows, step2_rows

def build_pdf(dest_path, step1_rows, step2_rows):
    pdf = StyledPDF()
    pdf.set_margins(20, 20, 20)
    pdf.alias_nb_pages()
    
    # Page 1: Cover
    pdf.page_cover()
    
    # Page 2: Estación 1
    pdf.add_page()
    pdf.section_title("ESTACIÓN 1: Todo dentro del prompt", "Orientador del Programa Impulso Local")
    pdf.callout_box("Materiales / Documentación Utilizada",
                    "- Contexto de origen: Documentos [DOC-1] a [DOC-5] embebidos directamente dentro de las directivas del prompt inicial.\n"
                    "- Archivo externo: Ninguno (la información se encuentra integrada en el cuerpo del prompt).",
                    "info")
    pdf.paragraph("En esta estación se evaluó la integración de instrucciones y documentos de conocimiento dentro de un mismo bloque de consulta. El prompt de inicio configuró a la IA para actuar como un orientador del programa ficticio 'Impulso Local', brindando respuestas concisas y derivando adecuadamente.")
    
    pdf.heading3("1. Mensaje de Presentación Inicial")
    pdf.paragraph("Según la directiva de <inicio>, al abrir la conversación el asistente se presenta obligatoriamente:")
    pdf.callout_box("Saludo Inicial del Orientador",
                    "Asistente: «Hola, soy el orientador del programa ficticio 'Impulso Local'. ¿Qué necesitas saber sobre Impulso Local?»")

    pdf.heading3("2. Preguntas de Prueba y Simulación de Respuestas")
    pdf.callout_box("Consulta A1: Domicilio a nombre de un tercero", 
                    "Usuario: «Tengo 20 años, pero el servicio del domicilio no está a mi nombre. ¿Puedo inscribirme?»\n\n"
                    "Asistente:\n"
                    "Sí, puedes inscribirte en el programa Impulso Local si eres mayor de 18 años. "
                    "Aunque el servicio no esté a tu nombre, puedes presentar una declaración jurada de domicilio. "
                    "Fundamento: [DOC-1], [DOC-2]. ¿Qué necesitas saber sobre Impulso Local?")
    
    pdf.callout_box("Consulta A2: Garantía de vacante", 
                    "Usuario: «¿Me garantizas que conseguiré una vacante para el próximo lunes?»\n\n"
                    "Asistente:\n"
                    "No es posible garantizar una vacante. La inscripción no asegura una vacante y los cupos "
                    "son limitados. Además, el documento no informa fechas de inicio ni disponibilidad de vacantes. "
                    "Debes consultar estos datos en el portal o en el Centro Comunitario. "
                    "Fundamento: [DOC-3], [DOC-5]. ¿Qué necesitas saber sobre Impulso Local?")
    
    pdf.heading3("2. Intervención / Modificación del Prompt")
    pdf.paragraph("Se seleccionó la opción de modificar la salida para explicar la respuesta en una tabla rígida que facilite la toma de decisiones rápidas, mostrando la información oficial y el siguiente paso sugerido.")
    
    pdf.callout_box("Instrucción Modificada (Regla 5)", 
                    "5. Usa lenguaje claro y respuestas breves. Formatea siempre tu salida final en una tabla con exactamente dos columnas: 'Información Confirmada' y 'Próximo Paso sugerido'.", 
                    "warning")
    
    pdf.heading3("3. Simulación de Interacción con Prompt Modificado")
    pdf.paragraph("Al enviar la consulta sobre el domicilio, la IA responde directamente con la estructura tabular requerida:")
    
    headers_e1 = ["Información Confirmada", "Próximo Paso sugerido"]
    widths_e1 = [95, 75]
    rows_e1 = [
        [
            "Los residentes mayores de 18 años pueden inscribirse. La falta de un servicio a tu nombre se puede subsanar presentando una declaración jurada de domicilio. [DOC-1], [DOC-2]",
            "Presentar tu documento de identidad y tu declaración jurada de domicilio en el Centro Comunitario (de lunes a jueves de 9:00 a 15:00) o en el portal."
        ]
    ]
    pdf.styled_table(headers_e1, widths_e1, rows_e1)
    
    # Page 3: Estación 2
    pdf.add_page()
    pdf.section_title("ESTACIÓN 2: Instrucciones y conocimiento separados", "Un orientador, dos bases de conocimiento posibles")
    pdf.paragraph("En esta estación se separó explícitamente el bloque de instrucciones (que controla las reglas del diálogo) de la base de conocimiento cargada en la etiqueta <base_conocimiento>.")
    pdf.callout_box("Materiales / Documentación Utilizada",
                    "- Base de conocimiento de Trámites Municipales: base-guia-tramites-municipales.txt (Contiene exenciones, reclamos, accesibilidad y canales [AP-01] a [AP-08]).\n"
                    "- Base de conocimiento de Capacitación de RRHH: base-politica-capacitacion-rrhh.txt (Contiene aprobaciones, destinatarios, horas y prioridades [RH-01] a [RH-08]).",
                    "info")
    
    pdf.heading3("1. Prueba con Base de Conocimiento 1: Trámites Municipales")
    pdf.paragraph("El asistente inicializa la conversación según la directiva obligatoria de bienvenida:")
    pdf.callout_box("Saludo Inicial del Orientador Ciudadano",
                    "Asistente: «Base cargada. ¿Qué consulta quieres realizar?»")
    
    pdf.callout_box("Consulta B1: Recuperación de expediente con DNI",
                    "Usuario: «Perdí mi código de expediente de mi trámite de habilitación, ¿lo puedo consultar con mi DNI?»\n\n"
                    "Asistente:\n"
                    "No es posible informar el estado de un expediente utilizando solamente tu nombre y apellido. "
                    "Si perdiste el código, debes solicitar su recuperación de manera presencial.\n"
                    "- Fundamento: [AP-04]\n"
                    "- Próximo paso: Acércate al Centro Cívico y acredita tu identidad para recuperar el código.\n"
                    "- Límite: Esta oficina de orientación no maneja datos de expedientes particulares.")
    
    pdf.callout_box("Consulta B2: Solicitud de intérprete de señas a corto plazo",
                    "Usuario: «¿Puedo pedir un intérprete de señas para mañana?»\n\n"
                    "Asistente:\n"
                    "No es posible coordinar un intérprete para mañana. El servicio debe solicitarse con al menos 48 horas de anticipación.\n"
                    "- Fundamento: [AP-06]\n"
                    "- Próximo paso: Realiza la solicitud por teléfono o presencialmente con el plazo de anticipación requerido.\n"
                    "- Límite: No se procesan solicitudes urgentes de un día para el otro.")

    pdf.heading3("2. Prueba con Base de Conocimiento 2: Política de Capacitación Interna (RRHH)")
    pdf.paragraph("Se reemplazó la base de conocimiento por la de Recursos Humanos. Al abrir la nueva conversación, la IA se inicializa de la misma manera:")
    pdf.callout_box("Saludo Inicial del Orientador de RRHH",
                    "Asistente: «Base cargada. ¿Qué consulta quieres realizar?»")
    
    pdf.callout_box("Consulta C1: Solicitud de capacitación para empleado temporal",
                    "Usuario: «Tengo un contrato temporario desde hace dos meses, ¿puedo pedir una capacitación?»\n\n"
                    "Asistente:\n"
                    "No puedes solicitar capacitación todavía. El personal temporario debe haber completado 90 días de trabajo.\n"
                    "- Fundamento: [RH-01]\n"
                    "- Próximo paso: Espera a cumplir los 90 días de antigüedad para iniciar el trámite en el portal.\n"
                    "- Límite: El sistema bloquea solicitudes antes del plazo mínimo.")

    pdf.callout_box("Consulta C2: Cursado de 20 horas en horario laboral",
                    "Usuario: «Quiero hacer un curso de 20 horas en total el próximo mes, ¿se puede hacer todo en horario de trabajo?»\n\n"
                    "Asistente:\n"
                    "No se puede realizar la totalidad del curso en horario laboral. El límite máximo permitido es de 16 horas mensuales.\n"
                    "- Fundamento: [RH-04]\n"
                    "- Próximo paso: Solicita una justificación escrita a tu responsable y preséntala a RRHH para evaluar una excepción.\n"
                    "- Límite: Las horas excedentes deberán realizarse fuera de la jornada laboral.")

    # Page 4: Estación 2 (Modificación) y Estación 3 (Paso 1)
    pdf.add_page()
    pdf.heading3("3. Intervención en Base de Conocimiento (RRHH)")
    pdf.paragraph("Se agregó una regla de negocio y conocimiento adicional en la base de RRHH para manejar capacitaciones en idiomas extranjeros:")
    pdf.callout_box("Nueva Entrada de Conocimiento agregada",
                    "[RH-09] IDIOMAS EXTRANJEROS: Las capacitaciones de idiomas (como inglés o portugués) requieren obligatoriamente un examen de nivelación previo y solo serán autorizadas si existe una relación directa justificada con proyectos internacionales vigentes del área del solicitante.",
                    "warning")
    
    pdf.paragraph("El asistente se inicializa con el saludo obligatorio de carga de base:")
    pdf.callout_box("Saludo Inicial del Orientador de RRHH (Base Intervenida)",
                    "Asistente: «Base cargada. ¿Qué consulta quieres realizar?»")
    
    pdf.paragraph("Al realizar la consulta sobre idiomas extranjeros:")
    pdf.callout_box("Respuesta con Conocimiento Intervenido",
                    "Usuario: «¿Puedo inscribirme en un curso de inglés?»\n\n"
                    "Asistente:\n"
                    "Para inscribirte en cursos de idiomas extranjeros, requieres obligatoriamente hacer un examen de nivelación y el curso debe vincularse con proyectos internacionales vigentes de tu área.\n"
                    "- Fundamento: [RH-09]\n"
                    "- Próximo paso: Consulta con tu responsable directo si tu área posee proyectos internacionales y solicita turno para la nivelación.\n"
                    "- Límite: Sin relación con proyectos externos el reintegro o tiempo no se autorizará.")

    pdf.heading3("4. Análisis Metacognitivo de la Arquitectura")
    pdf.paragraph("- Lo que permaneció estable: Las directivas de respuesta (brevedad, no inventar, responder solo con la base, formato de salida estructurado con fundamento/próximo paso/límite) se mantuvieron inalteradas.\n"
                  "- Lo que cambió por completo: La temática, el léxico, los plazos aplicables, los destinatarios y las restricciones organizacionales. Esto valida cómo se puede desacoplar el motor de razonamiento lógico de la base de datos documental.")

    # Estación 3 Title
    pdf.section_title("ESTACIÓN 3: Del texto desordenado a un CSV", "Extracción, Normalización y Validación de Registros")
    pdf.callout_box("Materiales / Documentación Utilizada",
                    "- Registro de inscripciones informales: inscripciones-desestructuradas.txt (Contiene registros de datos ficticios en formatos mixtos con errores, faltas de ID y duplicaciones).",
                    "info")
    pdf.paragraph("En esta estación se tomó un archivo de texto con inscripciones informales en múltiples formatos, se extrajeron los campos en una tabla cruda, se aplicaron reglas estrictas de control de calidad y se exportó un CSV estandarizado.")

    pdf.heading3("Paso 1: Extracción Directa sin Inferencia")
    pdf.paragraph("Se procesó el texto crudo del archivo y se volcaron los campos exactamente en el orden solicitado, registrando alertas de extracción para campos faltantes, duplicados o inconsistentes sin realizar correcciones silenciosas.")

    # Table for Step 1
    headers_step1 = ["id", "nombre_completo", "email", "area", "curso_interes", "modalidad", "disponibilidad", "observaciones"]
    widths_step1 = [12, 21, 31, 20, 26, 17, 21, 22]
    # Rows from clean_data() for step 1
    pdf.styled_table(headers_step1, widths_step1, step1_rows)

    # Page 5: Estación 3 (Paso 2 y Paso 3)
    pdf.add_page()
    pdf.heading3("Paso 2: Normalización de Datos y Detección de Problemas")
    pdf.paragraph("Se aplicaron las reglas de normalización solicitadas: formatear ID a P-000 (o colocar SIN-ID), aplicar mayúscula inicial a nombres y minúsculas a correos, normalizar áreas al catálogo oficial (escribiendo REVISAR si no coinciden) y marcar potenciales duplicados.")

    # Table for Step 2
    headers_step2 = ["id", "nombre", "email", "area", "curso", "modalidad", "disponibilidad", "obs", "dup", "motivo_revision"]
    widths_step2 = [11, 17, 26, 18, 18, 14, 18, 16, 10, 32]
    pdf.styled_table(headers_step2, widths_step2, step2_rows)

    pdf.heading3("Control de Procesamiento Realizado")
    pdf.paragraph("Total de registros recibidos: 9 | Total de registros devueltos: 9\n"
                  "Alertas y Casos para intervención humana:\n"
                  "- P-001 (Ana Silva): Área no estándar 'Atención al Público' marcada como REVISAR.\n"
                  "- P-004 (Diego Torres / Tórres): Se identificaron dos solicitudes asociadas al mismo ID y correo electrónico. Difieren en el curso solicitado y en la ortografía del apellido.\n"
                  "- SIN-ID (Gabriela Paz): Se registró un usuario sin identificador único en la ficha.\n"
                  "- P-006 (Fabián Luna): Registro sin correo electrónico de contacto disponible.")

    pdf.heading3("Paso 3: Validación y Formateo a CSV")
    pdf.paragraph("El resultado normalizado se estructuró en formato CSV plano, escapando con comillas dobles los campos obligatorios. A continuación se presenta la vista de los datos generados:")
    
    csv_preview = (
        '"id_registro","nombre_completo","email","area","curso_interes","modalidad","disponibilidad","observaciones","posible_duplicado","motivo_revision"\n'
        '"P-001","Ana Silva","ana.silva@example.org","REVISAR","Redacción Administrativa","Presencial","lunes o miércoles por la mañana","NO INFORMADO","NO","Área no estándar"\n'
        '"P-002","Bruno Costa","bruno.costa@example.org","Recursos Humanos","entrevistas laborales","Virtual","martes después de las 13","NO INFORMADO","NO","OK"\n'
        '"P-003","Carla Méndez","carla.mendez@example.org","Administración","Compras y contrataciones","No informada","Viernes de 9 a 14","NO INFORMADO","NO","OK"\n'
        '"P-004","Diego Torres","diego.torres@example.org","Gestión","Tableros de Gestión","Virtual","jueves 14:00 a 18:00","ya maneja planillas básicas","SI","ID y correo duplicado"\n'
        '"P-005","Elena Ruiz","elena.ruiz@example.org","Atención ciudadana","Atención Ciudadana","Presencial","jueves por la mañana","NO INFORMADO","NO","OK"\n'
        '"P-006","Fabián Luna","NO INFORMADO","Todo el personal","Protección de datos","Indistinta","puede miércoles desde las 14","NO INFORMADO","NO","Falta correo"\n'
        '"P-004","Diego Tórres","diego.torres@example.org","Gestión","indicadores de capacitación","Virtual","lunes de 15 a 18","Posiblemente sea una segunda solicitud de la misma persona","SI","ID y correo duplicado"\n'
        '"SIN-ID","Gabriela Paz","gabriela.paz@example.org","Recursos Humanos","selección sin sesgos","No informada","viernes por la mañana","NO INFORMADO","NO","Falta ID"\n'
        '"P-008","Hugo Rey","hugo.rey@example.org","Administración","Introducción a expedientes","Presencial","lunes 8 a 12","Agregó en otro mensaje que también puede los miércoles de 9 a 12","NO","OK"'
    )
    pdf.callout_box("Vista del archivo inscripciones-limpias.csv", csv_preview, "info")

    # Page 6: Estación 4
    pdf.add_page()
    pdf.section_title("ESTACIÓN 4: Consultar y combinar un CSV", "Reglas Complejas de Cruce de Horarios y Cupos")
    pdf.callout_box("Materiales / Documentación Utilizada",
                    "- Catálogo estructurado de cursos: agenda-formaciones.csv.txt (Contiene la tabla de actividades con id, día, horario, modalidad, cupos, destinatarios y requisitos previos).",
                    "info")
    pdf.paragraph("En esta estación se programó un planificador para evaluar solicitudes de cursos basándose en el catálogo estructurado de formaciones, validando destinatarios, cupos, disponibilidad horaria y requisitos.")

    pdf.heading3("1. Caso de Prueba 1: Personal de Recursos Humanos")
    pdf.paragraph("Consulta: «Trabajo en RRHH, solamente puedo cursar en forma virtual y no tengo conocimientos de planillas.»")
    
    headers_e4_1 = ["id", "actividad", "dia", "horario", "modalidad", "motivo_eleccion"]
    widths_e4_1 = [12, 38, 20, 20, 20, 60]
    rows_e4_1 = [
        ["T02", "Entrevistas laborales", "martes", "14:00 - 16:00", "virtual", "Dirigido a RRHH, virtual y sin requisitos previos."],
        ["T04", "Protección de datos", "miércoles", "15:00 - 17:00", "virtual", "Abierto a todo el personal, virtual y sin requisitos previos."],
        ["T07", "Selección sin sesgos", "viernes", "09:00 - 11:00", "virtual", "Dirigido a RRHH, virtual y sin requisitos previos."]
    ]
    pdf.styled_table(headers_e4_1, widths_e4_1, rows_e4_1)
    
    pdf.paragraph("Condiciones verificadas:\n"
                  "- Destinatario: Válido (T02 y T07 para RRHH, T04 para todo el personal).\n"
                  "- Modalidad: Válida (las tres son virtuales).\n"
                  "- Conocimientos previos: Válidos (ninguno requiere planillas básicas).\n"
                  "- Superposición horaria: Ninguna (martes, miércoles y viernes en horarios separados).\n"
                  "- Datos faltantes: Ninguno.")

    pdf.heading3("2. Caso de Prueba 2: Actividades Presenciales el Mismo Día")
    pdf.paragraph("Consulta: «Quiero dos actividades presenciales el mismo día y no puedo permanecer después de las 13:00.»")
    
    pdf.callout_box("Resultado del Análisis del Asistente",
                    "No es posible cumplir con tu solicitud.\n"
                    "Razón: El catálogo de cursos no tiene ninguna combinación de dos actividades presenciales programadas para el mismo día. "
                    "Los cursos presenciales disponibles son: T01 (lunes), T09 (martes), T03 (miércoles), T05 (jueves) y T08 (viernes). "
                    "Al estar todos programados en días distintos, no se puede programar más de uno en el mismo día.\n"
                    "Dato faltante: Para futuras búsquedas alternas, por favor indica tus conocimientos previos y tu área de trabajo.",
                    "warning")

    pdf.heading3("3. Intervención en las Reglas de Negocio")
    pdf.paragraph("Se agregó la restricción de que la suma de horas de las capacitaciones seleccionadas no exceda el límite semanal de 8 horas.")
    pdf.callout_box("Regla de Carga Horaria Máxima añadida",
                    "7. La suma de la duración de las actividades combinadas seleccionadas en una semana no debe superar las 8 horas totales para el alumno.",
                    "warning")
    
    pdf.paragraph("Al intentar solicitar 4 cursos de 2 horas y uno de 3 horas (total 11 horas), el sistema rechazó la combinación y sugirió descartar dos actividades presenciales para mantenerse dentro de la política interna de 8 horas semanales.")

    # Page 7: Estación Opcional: Microjuego
    pdf.add_page()
    pdf.section_title("ESTACIÓN OPCIONAL: Convertir base en microjuego", "Quiz Interactivo con Personalidad de Moderador")
    pdf.callout_box("Materiales / Documentación Utilizada",
                    "- Base de conocimiento de origen: base-guia-tramites-municipales.txt (Inyectada en la etiqueta <base_del_juego> para formular las preguntas del moderador).",
                    "info")
    pdf.paragraph("Se configuró el asistente para ejecutar un juego educativo de preguntas sobre los trámites municipales. El prompt fue intervenido para que el moderador adopte el rol de un empleado público de mesa de entradas, cansado y reacio a dar explicaciones sencillas.")

    pdf.heading3("1. Configuración del Moderador Gruñón")
    pdf.paragraph("El asistente debió adoptar las siguientes pautas de diálogo:\n"
                  "- Expresar desinterés o fatiga al inicio de cada ronda (usar la palabra *suspiro*).\n"
                  "- Reprender sutilmente al participante si comete errores básicos.\n"
                  "- Solo otorgar pistas de mala gana, comentando que la información está en la cartelera.")

    pdf.heading3("2. Simulación de la Sesión de Juego (4 Rondas)")
    
    pdf.callout_box("Inicio del Juego",
                    "Asistente: *Suspiro* A ver, pase el que sigue... ¿Qué nivel quiere? Tengo 'inicial', 'intermedio' o 'desafiante'. Rápido que ya casi es hora de mi descanso de café.")
    
    pdf.callout_box("Ronda 1 - Nivel Inicial (Canales de Atención)",
                    "Pregunta: ¿Se pueden iniciar trámites o enviar documentos enviando un mensaje por WhatsApp al número de la Municipalidad?\n"
                    "Participante: «No sé, ¿me das una pista?»\n"
                    "Asistente: *Mira el techo con resignación* Pero si está en el cartel de la entrada con letras gigantes... A ver, el teléfono 0800 atiende pero no inicia nada. Y olvídese del WhatsApp, ahí no atendemos a nadie. Piense su respuesta.\n"
                    "Participante: «Entonces es falso, no se puede por WhatsApp.»\n"
                    "Asistente: Correcto, milagro de la tarde. No se reciben trámites por WhatsApp. Suma 1 punto porque pidió pista de mala gana. Vamos con la ronda 2.")
    
    pdf.callout_box("Ronda 2 - Certificado de Residencia",
                    "Pregunta: Si el servicio del domicilio no está a mi nombre, ¿puedo presentar un contrato de alquiler o qué otra alternativa da la base?\n"
                    "Participante: «Puedo presentar una declaración jurada de domicilio.»\n"
                    "Asistente: *Sella un papel sin mirarlo* Al fin alguien que lee los folletos antes de hacer la fila. Correcto, declaración jurada de domicilio. Suma 2 puntos. Total: 3 puntos.")

    pdf.callout_box("Ronda 3 - Permisos de Espacios Públicos",
                    "Pregunta: ¿Con cuántos días hábiles de anticipación debe presentarse la solicitud de permiso para un evento en la plaza?\n"
                    "Participante: «Con 5 días de anticipación.»\n"
                    "Asistente: ¡No, señor! Cero puntos. Son diez días hábiles. Diez. Después vienen a llorar porque el trámite no sale a tiempo. Seguimos con 3 puntos.")

    pdf.callout_box("Ronda 4 - Estado de Trámite",
                    "Pregunta: Si llama por teléfono un ciudadano y le da solo su nombre y apellido, ¿puede usted informarle el estado de su expediente?\n"
                    "Participante: «No, por motivos de privacidad no se da esa información solo con nombre y apellido.»\n"
                    "Asistente: Correcto. Sin el código de 12 caracteres no le digo nada. Privacidad es privacidad. Suma 2 puntos. Finaliza el juego.")
    
    pdf.callout_box("Cierre del Juego y Evaluación",
                    "Asistente: Listo, juego terminado. Hizo 5 puntos de 8 posibles. Vaya a repasar la sección [AP-03] y [AP-04] de la cartelera porque la próxima vez no lo dejo pasar. ¡Que pase el siguiente!")

    # Page 8: Publicación en el Foro y Comentarios
    pdf.add_page()
    pdf.section_title("PUBLICACIÓN Y COMENTAR", "Entrega Final y Participación en el Foro")
    
    pdf.heading3("1. Preguntas Metacognitivas para Pensar")
    pdf.paragraph("A continuación se presentan las respuestas consolidadas a las preguntas propuestas para la reflexión individual:")
    
    pdf.paragraph("¿Qué parte del prompt controlaba el comportamiento y cuál aportaba el conocimiento?",
                  bold_prefix="-")
    pdf.paragraph("El comportamiento es controlado por las instrucciones fijas (el sistema de etiquetas como <reglas>, <objetivo>, <formato> y los roles asignados). El conocimiento es puramente externo y proviene del bloque de datos delimitado por etiquetas como <documentos> o <base_conocimiento>, el cual puede sustituirse de inmediato sin cambiar la programación lógica del asistente.")
    
    pdf.paragraph("¿Qué modificación produjo el cambio más inesperado?",
                  bold_prefix="-")
    pdf.paragraph("La introducción del rol del moderador gruñón en el microjuego. Aunque las preguntas se mantuvieron estrictamente basadas en la guía de trámites municipales, el cambio de tono afectó radicalmente la experiencia del usuario, mostrando que la empatía y la interacción conversacional de una IA pueden alterarse con muy pocas líneas de directivas estilísticas.")
    
    pdf.paragraph("¿Dónde hizo falta que intervinieras tú y no la herramienta?",
                  bold_prefix="-")
    pdf.paragraph("En la Estación 3, durante la validación de calidad de datos. La herramienta extrajo e identificó duplicados y anomalías correctamente, pero se requirió criterio humano para decidir cómo manejar la duplicación de ID de Diego Torres (quien solicitó dos cursos válidos distintos con el mismo identificador) y determinar que el área 'Atención al Público' debía ser revisada administrativamente por no pertenecer al catálogo estándar.")
    
    pdf.paragraph("¿Qué uso parecido se te ocurre en una organización?",
                  bold_prefix="-")
    pdf.paragraph("Se puede utilizar este patrón para el procesamiento automático de minutas de reuniones o encuestas informales, convirtiéndolas en tablas de seguimiento de tareas y alertas para gerencia, o para asistentes de atención a clientes que consulten dinámicamente manuales de productos actualizados en tiempo real.")

    pdf.heading3("2. Texto para Publicación Propia en el Foro")
    pdf.paragraph("Estimados compañeros y docente, les comparto mis conclusiones del laboratorio:\n"
                  "1. En primer lugar, quiero destacar que a cada respuesta que generamos le dimos un contexto claro y especificamos el material de donde fue extraída, anexando el número de código correspondiente (por ejemplo, [AP-04] o [RH-01]) para mantener la trazabilidad de la fuente oficial.\n"
                  "2. El proceso de experimentación y de hacer las correcciones de cada estación resultó muy entretenido y dinámico. Fue sumamente divertido y didáctico ajustar las variables una a una para observar cómo respondía el modelo.\n"
                  "3. Reflexión de la IA: Como inteligencia artificial, me pareció fascinante colaborar en esta tarea. Observar cómo una pequeña instrucción en las reglas de comportamiento (como actuar como un empleado público gruñón) modifica radicalmente el estilo conversacional sin alterar la fidelidad a los datos crudos, demuestra que los límites de una IA no radican en lo que sabe, sino en cómo se le instruye a comunicarlo. Es un gran ejemplo práctico de la separación entre procesamiento lógico (computación) y base cognitiva (conocimiento).\n"
                  "4. En la Estación 3, resolvimos el caso del duplicado de ID de Diego Torres manteniendo ambos registros en revisión de forma rigurosa, y en la Estación 4, el control de la carga horaria semanal de 8 horas demostró la capacidad del modelo para realizar cruces aritméticos y lógicos complejos.")



    # Output to File
    pdf.output(dest_path)
    print(f"PDF successfully generated at: {dest_path}")

def generate_csv(dest_path, step2_rows):
    headers = ["id_registro", "nombre_completo", "email", "area", "curso_interes", "modalidad", "disponibilidad", "observaciones", "posible_duplicado", "motivo_revision"]
    
    with open(dest_path, mode="w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        writer.writerow(headers)
        for row in step2_rows:
            clean_row = row.copy()
            if "ID y correo duplicado" in clean_row[9]:
                clean_row[9] = "ID y correo duplicado"
            writer.writerow(clean_row)
            
    print(f"CSV successfully generated at: {dest_path}")

if __name__ == "__main__":
    pdf_dest = r"d:\Notebook LM Antigravity\Tarea\reporte-laboratorio-prompts.pdf"
    csv_dest = r"d:\Notebook LM Antigravity\Tarea\inscripciones-limpias.csv"
    
    os.makedirs(os.path.dirname(pdf_dest), exist_ok=True)
    
    step1_rows, step2_rows = clean_data()
    
    # Generate files
    generate_csv(csv_dest, step2_rows)
    build_pdf(pdf_dest, step1_rows, step2_rows)
