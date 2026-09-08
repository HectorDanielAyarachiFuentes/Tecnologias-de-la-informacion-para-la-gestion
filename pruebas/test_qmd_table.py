import subprocess, os, zipfile

# Read table 3 from 787f943
with open("pruebas/table_3_787f943.xml", "r", encoding="utf-8") as f:
    tbl_xml = f.read()

test_qmd = f"""---
format:
  docx:
    reference-doc: ../Entregables/Actividad 4/2_Word_Quarto/plantilla_academica.docx
    toc: false
---

# 3. Análisis Comparativo Multidimensional: Nación vs. Neuquén

Texto de introducción...

```{{=openxml}}
{tbl_xml}
```

Texto posterior...
"""

with open("pruebas/test_table_embed.qmd", "w", encoding="utf-8") as f:
    f.write(test_qmd)

res = subprocess.run(["quarto", "render", "pruebas/test_table_embed.qmd"], capture_output=True, text=True)
print("Quarto exit:", res.returncode)
if res.returncode != 0:
    print("Quarto err:", res.stderr)
else:
    print("Rendered test_table_embed.docx successfully!")
    with zipfile.ZipFile("pruebas/test_table_embed.docx") as z:
        doc = z.read("word/document.xml").decode("utf-8")
        import re
        tbls = re.findall(r'<w:tbl.*?</w:tbl>', doc)
        print(f"Tables in output: {len(tbls)}")
        for i, t in enumerate(tbls):
            fills = re.findall(r'w:fill="([^"]+)"', t)
            print(f"Table {i} fills: {set(fills)}")
