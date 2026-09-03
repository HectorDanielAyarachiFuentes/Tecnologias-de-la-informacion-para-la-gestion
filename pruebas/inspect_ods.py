from pyexcel_ods import get_data
import json

data = get_data(r"c:\Users\Ramoncito\.antigravity-ide\Tecnologias de la informacion para la gestion\Final prueba ejemplo\final2024.ods")
for sheet_name, sheet_data in data.items():
    print(f"Sheet: {sheet_name}")
    if len(sheet_data) > 0:
        print(f"Header: {sheet_data[0]}")
    if len(sheet_data) > 1:
        print(f"Row 1: {sheet_data[1]}")
    print("---")
