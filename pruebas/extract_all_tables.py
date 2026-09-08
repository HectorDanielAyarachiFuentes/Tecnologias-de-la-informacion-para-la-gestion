import subprocess, zipfile, io, re

p = subprocess.run(['git', 'show', '787f943:Entregables/Actividad 4/2_Word_Quarto/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.docx'], capture_output=True)
z = zipfile.ZipFile(io.BytesIO(p.stdout))
xml = z.read('word/document.xml').decode('utf-8')
tbls = re.findall(r'<w:tbl.*?</w:tbl>', xml)
print(f"Total tables in 787f943: {len(tbls)}")
for i, t in enumerate(tbls):
    with open(f"pruebas/table_{i}_787f943.xml", "w", encoding="utf-8") as f:
        f.write(t)
    print(f"Written table_{i}_787f943.xml (len={len(t)})")
