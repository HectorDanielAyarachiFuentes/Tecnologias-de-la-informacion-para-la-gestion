import subprocess, os, re

qmd_path = r"Entregables\Actividad 4\2_Word_Quarto\Actividad 4 - Investigacion Modernizacion Nacion Neuquen.qmd"

with open(qmd_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Callout 1 (Propósito y Síntesis)
callout1_openxml = """```{=openxml}
<w:tbl xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:tblPr>
    <w:tblW w:w="5000" w:type="pct"/>
    <w:tblLayout w:type="fixed"/>
    <w:tblBorders>
      <w:top w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/>
      <w:left w:val="single" w:sz="24" w:space="0" w:color="C1741F"/>
      <w:bottom w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/>
      <w:right w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/>
      <w:insideH w:val="none"/>
      <w:insideV w:val="none"/>
    </w:tblBorders>
    <w:tblCellMar>
      <w:top w:w="140" w:type="dxa"/>
      <w:left w:w="200" w:type="dxa"/>
      <w:bottom w:w="140" w:type="dxa"/>
      <w:right w:w="200" w:type="dxa"/>
    </w:tblCellMar>
  </w:tblPr>
  <w:tblGrid>
    <w:gridCol w:w="9360"/>
  </w:tblGrid>
  <w:tr>
    <w:trPr>
      <w:cantSplit/>
    </w:trPr>
    <w:tc>
      <w:tcPr>
        <w:tcW w:w="9360" w:type="dxa"/>
        <w:shd w:val="clear" w:color="auto" w:fill="FDF8F3"/>
      </w:tcPr>
      <w:p>
        <w:pPr>
          <w:pStyle w:val="Compact"/>
          <w:spacing w:before="40" w:after="80"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Arial" w:hAnsi="Arial"/>
            <w:b/>
            <w:color w:val="C1741F"/>
            <w:sz w:val="20"/>
          </w:rPr>
          <w:t>PROPÓSITO Y SÍNTESIS DE LA ACTIVIDAD</w:t>
        </w:r>
      </w:p>
      <w:p>
        <w:pPr>
          <w:pStyle w:val="Compact"/>
          <w:spacing w:before="40" w:after="40" w:line="276" w:lineRule="auto"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Arial" w:hAnsi="Arial"/>
            <w:color w:val="2D3748"/>
            <w:sz w:val="19"/>
          </w:rPr>
          <w:t>Investigar, describir y analizar comparativamente las políticas públicas y plataformas digitales de modernización del Estado implementadas por el Gobierno Nacional a través del Observatorio de la Administración Pública del INAP y por la Secretaría de Modernización de la Ciudad de Neuquén. Se examinan las dimensiones de gobierno digital, inclusión tecnológica, simplificación administrativa y gobierno abierto, evaluando los desafíos de interoperabilidad federal, la reducción de brechas y la complementariedad multinivel.</w:t>
        </w:r>
      </w:p>
    </w:tc>
  </w:tr>
</w:tbl>
```"""

# Replace callout 1
old_callout1 = r"::: \{\.callout-note title=\"PROPÓSITO Y SÍNTESIS DE LA ACTIVIDAD\"\}\nInvestigar.*?\n:::"
content_new = re.sub(old_callout1, callout1_openxml, content, flags=re.DOTALL)

# 2. Cover Metadata Table
meta_openxml = """```{=openxml}
<w:tbl xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:tblPr>
    <w:tblW w:w="5000" w:type="pct"/>
    <w:tblLayout w:type="fixed"/>
    <w:tblBorders>
      <w:top w:val="single" w:sz="6" w:space="0" w:color="0E6873"/>
      <w:left w:val="single" w:sz="24" w:space="0" w:color="0E6873"/>
      <w:bottom w:val="single" w:sz="6" w:space="0" w:color="0E6873"/>
      <w:right w:val="single" w:sz="6" w:space="0" w:color="CBD5E1"/>
      <w:insideH w:val="single" w:sz="4" w:space="0" w:color="E2E8F0"/>
      <w:insideV w:val="none"/>
    </w:tblBorders>
    <w:tblCellMar>
      <w:top w:w="120" w:type="dxa"/>
      <w:left w:w="160" w:type="dxa"/>
      <w:bottom w:w="120" w:type="dxa"/>
      <w:right w:w="160" w:type="dxa"/>
    </w:tblCellMar>
  </w:tblPr>
  <w:tblGrid>
    <w:gridCol w:w="2800"/>
    <w:gridCol w:w="6560"/>
  </w:tblGrid>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="2800" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="19"/></w:rPr><w:t>INSTITUCIÓN EDUCATIVA:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="6560" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="19"/></w:rPr><w:t>CURZAS · Universidad Nacional del Comahue</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="2800" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="19"/></w:rPr><w:t>ESPACIO CURRICULAR:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="6560" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="19"/></w:rPr><w:t>Tecnología de la Información para la Gestión (TIG)</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="2800" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="19"/></w:rPr><w:t>ACTIVIDAD / TEMA:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="6560" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="19"/></w:rPr><w:t>Actividad Práctica 4 · Tema 2: Nación - Neuquén</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="2800" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="19"/></w:rPr><w:t>ESTUDIANTE / AUTOR:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="6560" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="153E5C"/><w:sz w:val="19"/></w:rPr><w:t>Hector Daniel Ayarachi Fuentes</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="2800" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="19"/></w:rPr><w:t>FECHA DE PRESENTACIÓN:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="6560" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="19"/></w:rPr><w:t>2 de Septiembre de 2026</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
</w:tbl>
```"""

old_meta_tbl = r"\| \| \|\n\| :--- \| :--- \|\n\| \*\*INSTITUCIÓN EDUCATIVA:\*\*.*?\n\| \*\*FECHA DE PRESENTACIÓN:\*\* \| 2 de Septiembre de 2026 \|"
content_new = re.sub(old_meta_tbl, meta_openxml, content_new, flags=re.DOTALL)

# 3. Callout 2 (Objetivo Académico)
callout2_openxml = """```{=openxml}
<w:tbl xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:tblPr>
    <w:tblW w:w="5000" w:type="pct"/>
    <w:tblLayout w:type="fixed"/>
    <w:tblBorders>
      <w:top w:val="single" w:sz="4" w:space="0" w:color="CBD5E1"/>
      <w:left w:val="single" w:sz="24" w:space="0" w:color="0E6873"/>
      <w:bottom w:val="single" w:sz="4" w:space="0" w:color="CBD5E1"/>
      <w:right w:val="single" w:sz="4" w:space="0" w:color="CBD5E1"/>
      <w:insideH w:val="none"/>
      <w:insideV w:val="none"/>
    </w:tblBorders>
    <w:tblCellMar>
      <w:top w:w="140" w:type="dxa"/>
      <w:left w:w="200" w:type="dxa"/>
      <w:bottom w:w="140" w:type="dxa"/>
      <w:right w:w="200" w:type="dxa"/>
    </w:tblCellMar>
  </w:tblPr>
  <w:tblGrid>
    <w:gridCol w:w="9360"/>
  </w:tblGrid>
  <w:tr>
    <w:trPr>
      <w:cantSplit/>
    </w:trPr>
    <w:tc>
      <w:tcPr>
        <w:tcW w:w="9360" w:type="dxa"/>
        <w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/>
      </w:tcPr>
      <w:p>
        <w:pPr>
          <w:pStyle w:val="Compact"/>
          <w:spacing w:before="40" w:after="80"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Arial" w:hAnsi="Arial"/>
            <w:b/>
            <w:color w:val="0E6873"/>
            <w:sz w:val="20"/>
          </w:rPr>
          <w:t>OBJETIVO ACADÉMICO</w:t>
        </w:r>
      </w:p>
      <w:p>
        <w:pPr>
          <w:pStyle w:val="Compact"/>
          <w:spacing w:before="40" w:after="40" w:line="276" w:lineRule="auto"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Arial" w:hAnsi="Arial"/>
            <w:color w:val="2D3748"/>
            <w:sz w:val="19"/>
          </w:rPr>
          <w:t>Investigar, describir y analizar críticamente los portales gubernamentales de referencia (INAP Nación y Secretaría de Modernización de Neuquén Capital), estructurando una matriz comparativa multidimensional rigurosa entre las directrices estratégicas de la Administración Pública Nacional y las iniciativas subnacionales de proximidad ciudadana implementadas en la capital neuquina.</w:t>
        </w:r>
      </w:p>
    </w:tc>
  </w:tr>
</w:tbl>
```"""

old_callout2 = r"::: \{\.callout-tip title=\"Objetivo Académico\"\}\nInvestigar.*?\n:::"
content_new = re.sub(old_callout2, callout2_openxml, content_new, flags=re.DOTALL)

# 4. Comparative Matrix Table
with open(r"pruebas\table_3_787f943.xml", "r", encoding="utf-8") as f:
    tbl3_xml = f.read()

matrix_openxml = f"""```{{=openxml}}
{tbl3_xml}
```"""

old_matrix_tbl = r"\| Dimensión de Análisis \| Nivel Nacional \(INAP · Nación\) \| Jurisdicción Local \(Neuquén Capital\) \|\n\| :--- \| :--- \| :--- \|\n.*?\n\| \*\*Capacitación del Talento Humano\*\* \| Formación masiva.*?\n"
content_new = re.sub(old_matrix_tbl, matrix_openxml + "\n", content_new, flags=re.DOTALL)

with open("pruebas/test_qmd_updated.qmd", "w", encoding="utf-8") as f:
    f.write(content_new)

print("Updated QMD written to pruebas/test_qmd_updated.qmd")
res = subprocess.run(["quarto", "render", "pruebas/test_qmd_updated.qmd"], capture_output=True, text=True)
print("Quarto exit:", res.returncode)
if res.returncode != 0:
    print("Quarto err:", res.stderr)
else:
    print("Rendered successfully!")
