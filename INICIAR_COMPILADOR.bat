@echo off
chcp 65001 > nul
title Auto-Compilador Dual (Typst + Quarto) - TIG CURZAS
cls
echo ==============================================================================
echo  INICIANDO COMPILADOR EN TIEMPO REAL (Typst + Quarto)
echo  Materia: Tecnologia de la Informacion para la Gestion (CURZAS)
echo ==============================================================================
echo.
python -u "%~dp0plantillas_pdf\1_typst\auto_compilar_typst.py"
echo.
echo ==============================================================================
echo  El compilador automatico se ha detenido.
echo ==============================================================================
pause
