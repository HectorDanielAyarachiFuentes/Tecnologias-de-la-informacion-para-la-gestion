import os, win32com.client, fitz # PyMuPDF

docx_path = os.path.abspath(r"Entregables\Actividad 4\2_Word_Quarto\Actividad 4 - Investigacion Modernizacion Nacion Neuquen.docx")
pdf_path = os.path.abspath(r"pruebas\act4_preview.pdf")

word = win32com.client.Dispatch("Word.Application")
word.Visible = False

try:
    doc = word.Documents.Open(docx_path)
    doc.SaveAs(pdf_path, FileFormat=17) # 17 = wdFormatPDF
    doc.Close()
    print("Exported PDF successfully!")
except Exception as e:
    print("Error exporting PDF via Word:", e)
finally:
    word.Quit()

if os.path.exists(pdf_path):
    pdf_doc = fitz.open(pdf_path)
    print(f"PDF Page Count: {len(pdf_doc)}")
    for i, page in enumerate(pdf_doc):
        pix = page.get_pixmap(dpi=150)
        img_path = f"pruebas/page_{i+1}.png"
        pix.save(img_path)
        print(f"Saved {img_path}")
