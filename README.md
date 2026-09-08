<div align="center">

<img src="Logotipo de curzas/CURZAS.png" alt="Logotipo Oficial CURZAS - Universidad Nacional del Comahue" width="230"/>

# Tecnologías de la Información para la Gestión (TIG)
### Centro Universitario Regional Zona Atlántica y Sur (CURZAS) · Universidad Nacional del Comahue

[![Docs-as-Code](https://img.shields.io/badge/Metodolog%C3%ADa-Docs--as--Code-0e6873?style=for-the-badge&logo=markdown&logoColor=white)](https://github.com/HectorDanielAyarachiFuentes/Tecnologias-de-la-informacion-para-la-gestion)
[![Typst](https://img.shields.io/badge/Compilaci%C3%B3n-Typst%20Engine-239dad?style=for-the-badge&logo=typst&logoColor=white)](https://typst.app)
[![Python 3](https://img.shields.io/badge/Automatizaci%C3%B3n-Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![Licencia Académica](https://img.shields.io/badge/Entorno-CURZAS%20UNCo-c1741f?style=for-the-badge)](https://curzas.uncoma.edu.ar/)

**Autor:** Héctor Daniel Ayarachi Fuentes  
**Espacio Curricular:** Tecnología de la Información para la Gestión  
**Año Académico:** 2026

---

</div>

## 📌 Descripción del Proyecto

Este repositorio constituye el entorno oficial de trabajo, experimentación y entrega de producciones académicas para la cátedra **Tecnología de la Información para la Gestión (TIG)** del CURZAS (Universidad Nacional del Comahue).

El proyecto está diseñado bajo el paradigma **Docs-as-Code** (Documentación gestionada como Código), combinando redacción tipográfica de alta precisión en **[Typst](https://typst.app)**, automatización de compilación con **Python** y control de versiones distribuido con **Git & GitHub**.

---

## 📂 Matriz de Entregables Oficiales

Todos los informes finales cuentan con su código fuente tipográfico y su compilación en PDF con identidad institucional (paleta cromática institucional, numeración desvinculada de carátula y métricas tipográficas estandarizadas):

| # | Actividad / Asignación | Documento Final (PDF) | Código Fuente (Typst) | Temática y Enfoque |
| :-: | :--- | :---: | :---: | :--- |
| **01** | **Actividad 1:** Laboratorio de Prompts | [📄 Ver PDF](Entregables/Actividad%201/Actividad%201%20-reporte-laboratorio-prompts.pdf) | [`Actividad 1.typ`](Entregables/Actividad%201/Actividad%201%20-reporte-laboratorio-prompts.typ) | Ingeniería de prompts aplicada a la gestión documental y resolución de casos administrativos. |
| **02** | **Actividad 2:** De los Documentos al Orden de Mérito | [📄 Ver PDF](Entregables/Actividad%202/actividad%202.pdf) | [`actividad 2.typ`](Entregables/Actividad%202/actividad%202.typ) | Procesamiento y depuración de bases de datos de postulantes mediante agentes inteligentes. |
| **03** | **Actividad Asincrónica 2:** Cuaderno de Fuentes con IA | [📄 Ver PDF](Entregables/Actividad%20asincronica%202/Actividad%20asincronica%202.pdf) | [`Actividad asincronica 2.typ`](Entregables/Actividad%20asincronica%202/Actividad%20asincronica%202.typ) | Investigación con NotebookLM y síntesis multimodal sobre fallas en capacitación pública. |
| **04** | **Actividad 4:** Modernización del Estado (Nación - Neuquén) | [📄 Ver PDF](Entregables/Actividad%204/1_PDF_Typst/Actividad%204%20-%20Investigacion%20Modernizacion%20Nacion%20Neuquen.pdf) | [`Actividad 4.typ`](Entregables/Actividad%204/1_PDF_Typst/Actividad%204%20-%20Investigacion%20Modernizacion%20Nacion%20Neuquen.typ) | Estudio comparativo multidimensional: INAP Nación vs. Secretaría de Modernización de Neuquén Capital. |
| **05** | **Examen Final:** Análisis Estadístico de Indicadores TIC | [📄 Ver PDF](Entregables/Final%202024/Informe%20final-TIC2024.pdf) | [`Informe final-TIC2024.typ`](Entregables/Final%202024/Informe%20final-TIC2024.typ) | Reporte analítico con visualización gráfica de datos (gráficos de barra y pastel) sobre digitalización estatal. |

---

## 🏛️ Arquitectura del Repositorio

La estructura de carpetas sigue un estricto criterio de separación de responsabilidades para garantizar trazabilidad y reproducibilidad:

```text
Tecnologias-de-la-informacion-para-la-gestion/
├── Actividad - Propuesta/   # Insumos originales, consignas docentes y datasets de partida
│   ├── Actividad 1/         # Bases desestructuradas y consigna del laboratorio de prompts
│   ├── Actividad 2/         # Formularios de origen y actas de mérito
│   ├── Actividad practica 3/# Manuales de procedimiento y solicitudes de excepción
│   ├── Actividad 4/         # Consigna oficial de modernización y guía de estilos
│   ├── Actividad asincronica 2/ # Corpus normativo y resoluciones escaneadas
│   └── Final 2024/          # Consigna del examen final y planillas de cálculo base (.ods/.xlsx)
├── Entregables/             # ÚNICA FUENTE DE LA VERDAD para versiones finales (.typ y .pdf)
│   ├── Actividad 1/
│   ├── Actividad 2/
│   ├── Actividad 4/
│   │   ├── 1_PDF_Typst/     # Código fuente Typst y PDF de alta calidad
│   │   └── 2_Word_Quarto/   # Código fuente Quarto (.qmd) y render Word (.docx)
│   ├── Actividad asincronica 2/
│   └── Final 2024/
├── Herramientas/            # Entornos de soporte e integración tecnológica
│   └── NotebookLM/          # Configuración MCP y guías de interacción asistida por IA
├── Logotipo de curzas/      # Recursos gráficos e isotipos institucionales vectoriales/raster
├── Material/                # Documentación de lectura, referencias bibliográficas y scripts
├── plantillas_pdf/          # Ecosistema Docs-as-Code: plantillas, temas y auto-compilador Typst
│   └── 1_typst/             # Script auto_compilar_typst.py y plantillas ejecutivas
├── pruebas/                 # Zona de aislamiento (sandbox) para scripts y prototipos descartables
├── .agents/                 # Estándares operativos y reglas de comportamiento de asistentes IA
└── .gitignore               # Filtros de exclusión para datos pesados (>100MB) y temporales
```

---

## ⚙️ Metodología Docs-as-Code con Typst

A diferencia del formateo manual en procesadores tradicionales, todos los entregables de este repositorio se generan mediante compilación estricta en código:

### 1. Paleta Cromática Institucional Normalizada
* **Color Primario (Teal / Petróleo):** `#153e5c` / `#0e6873`
* **Color de Acento / Alertas:** `#c1741f` / `#c65911`
* **Color de Texto Principal:** `#1f2933`
* **Color de Texto Atenuado:** `#4b6575`
* **Fondos Suaves (Callouts / Tarjetas):** `#f2f7f7` / `#fdf6ee`

### 2. Auto-Compilación en Tiempo Real (Watcher)
Para trabajar con previsualización instantánea al guardar (`Ctrl + S`), se incluye un script en Python que monitorea los archivos `.typ`:

```bash
# Iniciar el monitor automático de compilación
python plantillas_pdf/1_typst/auto_compilar_typst.py
```

O ejecutando directamente el acceso directo de Windows:
```cmd
plantillas_pdf\1_typst\iniciar_modo_automatico.bat
```

### 3. Compilación Manual de un Archivo Específico
```bash
python -c "import typst; typst.compile('Entregables/Actividad 4/1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.typ', output='Entregables/Actividad 4/1_PDF_Typst/Actividad 4 - Investigacion Modernizacion Nacion Neuquen.pdf', root='.')"
```

---

## 👨‍💻 Autor y Contacto

* **Estudiante:** Héctor Daniel Ayarachi Fuentes
* **Correo Electrónico:** [mp4o@hotmail.com](mailto:mp4o@hotmail.com)
* **Perfil de GitHub:** [@HectorDanielAyarachiFuentes](https://github.com/HectorDanielAyarachiFuentes)
* **Institución:** Complejo Universitario Regional Zona Atlántica y Sur (CURZAS) · Universidad Nacional del Comahue (UNCo)
