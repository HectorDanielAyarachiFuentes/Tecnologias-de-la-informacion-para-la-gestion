@echo off
chcp 65001 > nul
title Auto-Compilador Dual (Typst + Quarto)
cls
python -u "%~dp0auto_compilar_typst.py"
pause
