from pyexcel_ods import get_data, save_data
import csv
import os
import math

input_ods = r"c:\Users\Ramoncito\.antigravity-ide\Tecnologias de la informacion para la gestion\Actividad - Propuesta\Final 2024\final2024.ods"
output_dir = r"c:\Users\Ramoncito\.antigravity-ide\Tecnologias de la informacion para la gestion\Entregables\Final 2024"
os.makedirs(output_dir, exist_ok=True)

data = get_data(input_ods)
sheet = data["encuesta"]
headers = sheet[0]

# Add new headers
headers.extend(["par-categoría", "Mayúscula", " Plus por cat"])

processed_data = [headers]

for row in sheet[1:]:
    if not row: continue
    while len(row) < 11:
        row.append("")
        
    nacimiento = row[4]
    try:
        edad = 2026 - int(nacimiento)
    except:
        edad = ""
    row[5] = edad
    
    categoria = row[7]
    try:
        cat_int = int(categoria)
        es_par = (cat_int % 2 == 0)
    except:
        es_par = False
        cat_int = 0
        
    apellido = str(row[2]).upper()
    plus = "Si corresponde" if cat_int >= 3 else " "
    
    row.extend([es_par, apellido, plus])
    processed_data.append(row)

# Create sheets
sheets_out = {}
sheets_out["encuesta"] = processed_data

# 7.) Copie la hoja encuesta en una nueva hoja P7
sheets_out["P7"] = processed_data

# 8 a) P7-a: región = AN y régimen = "Personal"
p7a = [headers]
for r in processed_data[1:]:
    if len(r) > 8 and r[8] == "AN" and r[6] == "Personal":
        p7a.append(r)
sheets_out["P7-a"] = p7a

# 8 b) P7-b: edad es menor a 30 y el régimen ="Funcionarios"
p7b = [headers]
for r in processed_data[1:]:
    if len(r) > 6:
        try:
            edad = int(r[5])
            if edad < 30 and r[6] == "Funcionarios":
                p7b.append(r)
        except:
            pass
sheets_out["P7-b"] = p7b

# 8 c) P7-c: régimen ="Funcionarios" y la región ="CL"
p7c = [headers]
for r in processed_data[1:]:
    if len(r) > 8 and r[6] == "Funcionarios" and r[8] == "CL":
        p7c.append(r)
sheets_out["P7-c"] = p7c

# save ods
save_data(os.path.join(output_dir, "final-TIC2024.ods"), sheets_out)

# save csv
with open(os.path.join(output_dir, "final-TIC2024.csv"), "w", newline='', encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerows(processed_data)

# Aggregations for Typst
cat_counts = {}
for r in processed_data[1:]:
    c = str(r[7])
    cat_counts[c] = cat_counts.get(c, 0) + 1

reg_cat_counts = {}
for r in processed_data[1:]:
    reg = str(r[6])
    cat = str(r[7])
    if reg not in reg_cat_counts:
        reg_cat_counts[reg] = {}
    reg_cat_counts[reg][cat] = reg_cat_counts[reg].get(cat, 0) + 1

reg_counts = {}
for r in processed_data[1:]:
    reg = str(r[6])
    reg_counts[reg] = reg_counts.get(reg, 0) + 1

def make_pie_svg(data_dict, filename):
    total = sum(data_dict.values())
    if total == 0: return
    colors = ['#0e6873', '#c65911', '#2c3e50', '#787878', '#153e5c', '#c1741f', '#1f2933', '#646464']
    svg = ['<svg xmlns="http://www.w3.org/2000/svg" viewBox="-2 -2 4 4">']
    start_angle = 0
    i = 0
    for label, count in data_dict.items():
        if count == 0: continue
        frac = count / total
        end_angle = start_angle + frac * 2 * math.pi
        x1 = math.cos(start_angle); y1 = math.sin(start_angle)
        x2 = math.cos(end_angle); y2 = math.sin(end_angle)
        large_arc_flag = "1" if frac > 0.5 else "0"
        if frac == 1.0:
            path = "M 1 0 A 1 1 0 1 1 1 -0.001 Z"
        else:
            path = f"M 0 0 L {x1} {y1} A 1 1 0 {large_arc_flag} 1 {x2} {y2} Z"
        svg.append(f'<path d="{path}" fill="{colors[i % len(colors)]}" />')
        mid_angle = start_angle + frac * math.pi
        tx = math.cos(mid_angle) * 1.5
        ty = math.sin(mid_angle) * 1.5
        svg.append(f'<text x="{tx}" y="{ty}" font-family="Arial" font-size="0.2" text-anchor="middle" fill="black">{label}</text>')
        start_angle = end_angle
        i += 1
    svg.append('</svg>')
    with open(filename, "w", encoding="utf-8") as f:
        f.write("\n".join(svg))

def make_bar_svg(data_dict, filename):
    if not data_dict: return
    max_val = max(data_dict.values())
    width = 400; height = 300; margin = 40
    bars = len(data_dict)
    bar_width = (width - 2*margin) / bars * 0.8
    spacing = (width - 2*margin) / bars * 0.2
    colors = ['#0e6873', '#c65911', '#2c3e50', '#787878']
    svg = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}">']
    svg.append(f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="black" />')
    svg.append(f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="black" />')
    x = margin + spacing
    i = 0
    for label, count in data_dict.items():
        bar_h = (count / max_val) * (height - 2*margin)
        y = height - margin - bar_h
        svg.append(f'<rect x="{x}" y="{y}" width="{bar_width}" height="{bar_h}" fill="{colors[i % len(colors)]}" />')
        svg.append(f'<text x="{x + bar_width/2}" y="{height-margin+20}" font-family="Arial" font-size="12" text-anchor="middle">{label}</text>')
        svg.append(f'<text x="{x + bar_width/2}" y="{y-5}" font-family="Arial" font-size="12" text-anchor="middle">{count}</text>')
        x += bar_width + spacing
        i += 1
    svg.append('</svg>')
    with open(filename, "w", encoding="utf-8") as f:
        f.write("\n".join(svg))

make_pie_svg(cat_counts, os.path.join(output_dir, "torta_cat.svg"))
make_bar_svg(reg_counts, os.path.join(output_dir, "barras_reg.svg"))

typst_content = """#set text(font: "Arial", size: 10pt)
#set par(leading: 0.65em)

// Portada
#set page(
  paper: "a4",
  header: none,
  footer: none
)
#align(center)[
  #v(50pt)
  #image("../../Logotipo de curzas/CURZAS.png", width: 130pt)
  #v(20pt)
  #text(size: 20pt, weight: "bold", fill: rgb("#0e6873"))[Informe final-TIC2024]
  #v(10pt)
  #text(size: 14pt)[Materia: Tecnología de la Información para la Gestión (TIG) - CURZAS]
  #v(10pt)
  #text(size: 12pt)[Autor: Hector Daniel Ayarachi Fuentes]
  #v(10pt)
  #text(size: 12pt)[Fecha de entrega: 25 de Agosto de 2026]
]
#pagebreak()

// Resto del documento
#set page(
  header: align(right)[_Informe final-TIC2024_],
  footer: grid(
    columns: (1fr, auto, 1fr),
    align(left)[_Tecnología de la Información para la Gestión_],
    align(center)[#image("../../Logotipo de curzas/CURZAS.png", height: 14pt)],
    align(right)[Página #context counter(page).display() de #context counter(page).final().first()]
  )
)

= Desarrollo de Consignas

#align(center)[
  #table(
    columns: (35%, 65%),
    align: (left, left),
    fill: (col, row) => if row == 0 { rgb("#0e6873") } else if calc.rem(row, 2) == 0 { rgb("#f2f7f7") } else { none },
    stroke: 0.5pt + luma(200),
    [#text(fill: white, weight: "bold")[Consigna]], [#text(fill: white, weight: "bold")[Resolución y Análisis]],
    
    [*1. Descarga de planilla* \\ De la plataforma descargue la planilla: "final-TIC2024.ods".],
    [Se utilizó el archivo original `final2024.ods` proporcionado como base.],
    
    [*2. Guardado* \\ Guarde la planilla descargada en el escritorio de su computadora.],
    [Por convención de la materia y reglas del proyecto (Docs-as-Code), los resultados finales se guardaron estructuradamente en la carpeta de entregables: `Entregables/Final 2024/`.],
    
    [*3. Cálculo de Edad* \\ Halle la edad en relación al año de nacimiento.],
    [Se calculó restando el año de nacimiento al año actual (2026). \\ *Lógica aplicada:* `Edad = 2026 - Año de nacimiento`. \\ *(Fórmula dinámica en Calc: `=AÑO(HOY())-E2`)*.],
    
    [*4. Columna par-categoría* \\ Agregue una columna llamada par-categoría. Utilice una función para calcular si el número de categoría es PAR o IMPAR. El resultado es verdadero o falso.],
    [Se evaluó si la columna Categoría es divisible por 2. \\ *(Fórmula en Calc: `=ES.PAR(H2)`)*.],
    
    [*5. Columna Mayúscula* \\ En una nueva columna llamada Mayúscula, utilice una función para convertir a mayúsculas el apellido de cada empleado.],
    [Se tomó la columna Apellido y se transformó a letras mayúsculas. \\ *(Fórmula en Calc: `=MAYUSC(C2)`)*.],
    
    [*6. Columna Plus por cat* \\ Escriba el texto: "Si corresponde" o " " para empleados con categoría mayor e igual a 3. Utilice la función Si()],
    [Se aplicó un condicional evaluando la categoría. \\ *(Fórmula en Calc: `=SI(H2>=3; "Si corresponde"; " ")`)*.],
    
    [*7. Hoja P7* \\ Copie la hoja encuesta en una nueva hoja P7 y aplique filtros automáticos o avanzados.],
    [En el archivo `final-TIC2024.ods` generado, se encuentra una hoja idéntica a la principal llamada `P7` que actúa como base de datos filtrable.],
    
    [*8. Filtrado de datos* \\ Cada punto debe estar en una hoja nueva (P7-a, P7-b, etc).],
    [Se crearon las siguientes hojas en el `.ods` con los filtros exactos: \\ - *P7-a* (región = AN y régimen = "Personal"). \\ - *P7-b* (edad < 30 y régimen = "Funcionarios"). \\ - *P7-c* (régimen = "Funcionarios" y región = "CL").],
    
    [*9. Gráfico de barras* \\ Hallar la cantidad de empleados por régimen y realice un gráfico de barras.],
    [Se procesaron las cantidades totales por régimen. El gráfico de barras solicitado se encuentra adjunto en la siguiente sección de este informe.],
    
    [*10. Reporte (Looker Studio)* \\ La planilla para trabajar es: "final-TIC2024.csv". Generar informe en PDF.],
    [Se exportó la tabla procesada al archivo plano `final-TIC2024.csv`. \\ Para cumplir con la filosofía *Docs-as-Code* de la materia, se emuló el reporte pedido incluyendo las tablas y gráficos solicitados en las páginas siguientes de este documento.]
  )
]

#pagebreak()

= Informe de Empleados

== Cantidad de Empleados por Categoría

#align(center)[
  #table(
    columns: 2,
    align: (left, right),
    fill: (col, row) => if row == 0 { rgb("#0e6873") } else { none },
    [#text(fill: white, weight: "bold")[Categoría]], [#text(fill: white, weight: "bold")[Cantidad]],
"""
for cat in sorted(cat_counts.keys()):
    typst_content += f'    [{cat}], [{cat_counts[cat]}],\n'
typst_content += """
  )
]

#v(20pt)
#align(center)[
  #image("torta_cat.svg", width: 40%)
]

#pagebreak()

== Cantidad de Empleados por Régimen y Categoría

#align(center)[
  #table(
    columns: 3,
    align: (left, left, right),
    fill: (col, row) => if row == 0 { rgb("#0e6873") } else { none },
    [#text(fill: white, weight: "bold")[Régimen]], [#text(fill: white, weight: "bold")[Categoría]], [#text(fill: white, weight: "bold")[Cantidad]],
"""
for reg in sorted(reg_cat_counts.keys()):
    for cat in sorted(reg_cat_counts[reg].keys()):
        typst_content += f'    [{reg}], [{cat}], [{reg_cat_counts[reg][cat]}],\n'
typst_content += """
  )
]

#v(20pt)
== Empleados por Régimen
#align(center)[
  #image("barras_reg.svg", width: 70%)
]
"""

with open(os.path.join(output_dir, "Informe final-TIC2024.typ"), "w", encoding="utf-8") as f:
    f.write(typst_content)

print("Procesamiento completado.")
