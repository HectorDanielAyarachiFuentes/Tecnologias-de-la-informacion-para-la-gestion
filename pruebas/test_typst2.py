import typst
try:
    typst.compile('Entregables/Actividad asincronica 2/Actividad asincronica 2.typ', root='.')
except Exception as e:
    print(f"Error: {e}")
