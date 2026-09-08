import subprocess, os, re

qmd_path = r"Entregables\Actividad 4\2_Word_Quarto\Actividad 4 - Investigacion Modernizacion Nacion Neuquen.qmd"

with open(qmd_path, "r", encoding="utf-8") as f:
    content = f.read()

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
    <w:gridCol w:w="3600"/>
    <w:gridCol w:w="5760"/>
  </w:tblGrid>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="3600" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="18"/></w:rPr><w:t>INSTITUCIÓN EDUCATIVA:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="5760" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="18"/></w:rPr><w:t>CURZAS · Universidad Nacional del Comahue</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="3600" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="18"/></w:rPr><w:t>ESPACIO CURRICULAR:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="5760" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="18"/></w:rPr><w:t>Tecnología de la Información para la Gestión (TIG)</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="3600" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="18"/></w:rPr><w:t>ACTIVIDAD / TEMA:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="5760" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="18"/></w:rPr><w:t>Actividad Práctica 4 · Tema 2: Nación - Neuquén</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="3600" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="18"/></w:rPr><w:t>ESTUDIANTE / AUTOR:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="5760" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="153E5C"/><w:sz w:val="18"/></w:rPr><w:t>Hector Daniel Ayarachi Fuentes</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
  <w:tr>
    <w:trPr><w:cantSplit/></w:trPr>
    <w:tc>
      <w:tcPr><w:tcW w:w="3600" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:b/><w:color w:val="0E6873"/><w:sz w:val="18"/></w:rPr><w:t>FECHA DE PRESENTACIÓN:</w:t></w:r>
      </w:p>
    </w:tc>
    <w:tc>
      <w:tcPr><w:tcW w:w="5760" w:type="dxa"/><w:shd w:val="clear" w:color="auto" w:fill="F2F7F7"/></w:tcPr>
      <w:p><w:pPr><w:pStyle w:val="Compact"/><w:spacing w:before="40" w:after="40"/></w:pPr>
        <w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial"/><w:color w:val="2D3748"/><w:sz w:val="18"/></w:rPr><w:t>2 de Septiembre de 2026</w:t></w:r>
      </w:p>
    </w:tc>
  </w:tr>
</w:tbl>
```"""

content = re.sub(r"```\{\=openxml\}\n<w:tbl.*?</w:tbl>\n```", meta_openxml, content, count=1)

with open(qmd_path, "w", encoding="utf-8") as f:
    f.write(content)

print("QMD updated with width 3600/5760 dxa")
subprocess.run(["quarto", "render", qmd_path], capture_output=True, text=True)
subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", "pruebas/convert.ps1"], capture_output=True)
subprocess.run(["python", "pruebas/pdf_to_images.py"], capture_output=True)
print("Done re-rendering!")
