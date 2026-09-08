with open("pruebas/table_3_787f943.xml", "r", encoding="utf-8") as f:
    xml = f.read()

import re
texts = re.findall(r'<w:t[^>]*>(.*?)</w:t>', xml)
print("Text count:", len(texts))
print("Sample texts:")
for t in texts[:15]:
    print(" ", t)
