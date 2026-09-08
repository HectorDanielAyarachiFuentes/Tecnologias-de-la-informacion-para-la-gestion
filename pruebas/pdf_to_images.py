import fitz, os

pdf_path = r"pruebas\act4_preview.pdf"
pdf_doc = fitz.open(pdf_path)
print(f"Total pages: {len(pdf_doc)}")
for i, page in enumerate(pdf_doc):
    pix = page.get_pixmap(dpi=150)
    out_path = f"pruebas/page_{i+1}.png"
    pix.save(out_path)
    print(f"Saved page {i+1} to {out_path}")
