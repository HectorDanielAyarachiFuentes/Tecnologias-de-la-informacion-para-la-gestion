import subprocess, os, re

# 1. Update QMD file & build script
qmd_path = r"Entregables\Actividad 4\2_Word_Quarto\Actividad 4 - Investigacion Modernizacion Nacion Neuquen.qmd"
typ_path = r"Entregables\Actividad 4\1_PDF_Typst\Actividad 4 - Investigacion Modernizacion Nacion Neuquen.typ"

with open(qmd_path, "r", encoding="utf-8") as f:
    qmd_text = f.read()

qmd_text = qmd_text.replace("ESTUDIANTE / AUTOR:", "ESTUDIANTES / AUTORES:")
qmd_text = qmd_text.replace("Hector Daniel Ayarachi Fuentes", "Hector Daniel Ayarachi Fuentes · Andrea Alejandra Díaz")

with open(qmd_path, "w", encoding="utf-8") as f:
    f.write(qmd_text)

# Also update build_clean_act4_qmd.py
build_script_path = r"pruebas\build_clean_act4_qmd.py"
if os.path.exists(build_script_path):
    with open(build_script_path, "r", encoding="utf-8") as f:
        bs_text = f.read()
    bs_text = bs_text.replace("ESTUDIANTE / AUTOR:", "ESTUDIANTES / AUTORES:")
    bs_text = bs_text.replace("Hector Daniel Ayarachi Fuentes", "Hector Daniel Ayarachi Fuentes · Andrea Alejandra Díaz")
    with open(build_script_path, "w", encoding="utf-8") as f:
        f.write(bs_text)

# 2. Update Typst file
with open(typ_path, "r", encoding="utf-8") as f:
    typ_text = f.read()

typ_text = typ_text.replace('author: "Hector Daniel Ayarachi Fuentes"', 'author: ("Hector Daniel Ayarachi Fuentes", "Andrea Alejandra Díaz")')
typ_text = typ_text.replace("ESTUDIANTE / AUTOR:", "ESTUDIANTES / AUTORES:")
typ_text = typ_text.replace("Hector Daniel Ayarachi Fuentes", "Hector Daniel Ayarachi Fuentes · Andrea Alejandra Díaz")

with open(typ_path, "w", encoding="utf-8") as f:
    f.write(typ_text)

print("Updated both QMD and Typst files successfully!")

# Render Quarto DOCX
res_qmd = subprocess.run(["quarto", "render", qmd_path], capture_output=True, text=True)
print("Quarto exit code:", res_qmd.returncode)

# Convert to preview PDF & PNGs to verify
subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", "pruebas/convert.ps1"], capture_output=True)
subprocess.run(["python", "pruebas/pdf_to_images.py"], capture_output=True)
print("Re-rendering complete!")
