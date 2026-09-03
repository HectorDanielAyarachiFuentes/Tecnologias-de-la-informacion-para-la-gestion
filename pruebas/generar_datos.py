import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os

# Create dummy data
data = {
    'Nombre': ['Juan', 'Maria', 'Pedro', 'Ana', 'Luis', 'Laura', 'Carlos', 'Sofia', 'Diego', 'Lucia'],
    'Apellido': ['Perez', 'Gomez', 'Lopez', 'Diaz', 'Martinez', 'Rodriguez', 'Fernandez', 'Garcia', 'Sanchez', 'Romero'],
    'Año_Nacimiento': [1985, 1995, 1980, 2000, 1975, 1998, 1982, 1990, 1999, 1988],
    'Categoria': [2, 4, 1, 3, 5, 2, 4, 1, 3, 5],
    'Region': ['AN', 'CL', 'AN', 'SUR', 'CL', 'AN', 'SUR', 'CL', 'AN', 'CL'],
    'Regimen': ['Personal', 'Funcionarios', 'Personal', 'Funcionarios', 'Personal', 'Funcionarios', 'Personal', 'Funcionarios', 'Personal', 'Funcionarios']
}

df = pd.DataFrame(data)

# Calculate fields
current_year = 2024
df['Edad'] = current_year - df['Año_Nacimiento']
df['Par_Categoria'] = df['Categoria'] % 2 == 0
df['Mayuscula'] = df['Apellido'].str.upper()
df['Plus_por_cat'] = np.where(df['Categoria'] >= 3, 'Si corresponde', ' ')

# Save full data to CSV just in case
df.to_csv('pruebas/datos_simulados.csv', index=False)

# 9.) Gráfico de barras por régimen
regimen_counts = df['Regimen'].value_counts()
plt.figure(figsize=(6,4))
regimen_counts.plot(kind='bar', color=['#0e6873', '#c65911'])
plt.title('Cantidad de Empleados por Régimen')
plt.xlabel('Régimen')
plt.ylabel('Cantidad')
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig('pruebas/grafico_regimen.png', dpi=300)
plt.close()

# 10.a) Gráfico de torta por categoría
cat_counts = df['Categoria'].value_counts()
plt.figure(figsize=(6,4))
cat_counts.plot(kind='pie', autopct='%1.1f%%', startangle=90, colors=['#0e6873', '#c65911', '#2c3e50', '#787878', '#f2f7f7'])
plt.title('Empleados por Categoría')
plt.ylabel('')
plt.tight_layout()
plt.savefig('pruebas/grafico_torta_categoria.png', dpi=300)
plt.close()

# 10.b) Gráfico de barras régimen por categoría
reg_cat_counts = pd.crosstab(df['Regimen'], df['Categoria'])
reg_cat_counts.plot(kind='bar', figsize=(8,5), colormap='viridis')
plt.title('Empleados por Régimen y Categoría')
plt.xlabel('Régimen')
plt.ylabel('Cantidad')
plt.xticks(rotation=0)
plt.legend(title='Categoría')
plt.tight_layout()
plt.savefig('pruebas/grafico_barras_reg_cat.png', dpi=300)
plt.close()

print("Datos y gráficos generados con éxito.")
