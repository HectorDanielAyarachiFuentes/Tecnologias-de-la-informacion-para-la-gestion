# 🚀 Módulo NotebookLM · Integración MCP en Antigravity

Este directorio almacena la suite completa de configuración, guías y fuentes documentales utilizadas para operar **Google NotebookLM** desde **Antigravity IDE** a través del protocolo **MCP (Model Context Protocol)**.

---

## 📁 Arquitectura Interna del Módulo

```text
Herramientas/NotebookLM/
├── config/                      # Credenciales y archivos de configuración del servidor MCP
│   ├── cookies.txt              # Tokens de sesión para autenticación inicial
│   └── mcp_settings_backup.json # Respaldo de configuración del cliente MCP
├── documentacion/               # Manuales de uso, guías técnicas y transcripciones
│   ├── notebooklm_mcp_guide.md  # Guía de comandos y herramientas del servidor FastMCP
│   ├── tutorial_instalacion.txt # Pasos detallados para instalación y verificación
│   └── transcripcion_video.txt  # Transcripción del tutorial audiovisual
├── fuentes/                     # Colección de documentos analizados en los cuadernos
│   ├── administracion_publica/  # Monografías sobre gobernanza y administración pública
│   ├── arquitectura_sistemas/   # Especificaciones de diseño de sistemas y arquitectura móvil
│   ├── exploracion_prompts/     # Guías de experimentación con prompts
│   └── laboratorio_prompts/     # Datasets y casos prácticos de procesamiento documental
├── multimedia/                  # Material de video y demostraciones locales (.mp4)
├── .agents/                     # Skills del agente inteligente (using-notebooklm-mcp)
└── README.md                    # Documentación ejecutiva del módulo
```

---

## ⚙️ Rutas de Configuración en el Sistema

Para que el servidor MCP opere a nivel global en Antigravity IDE:

1. **Credenciales Validadas:**
   * Archivo: `C:\Users\Ramoncito\.notebooklm-mcp\auth.json`
   * Almacena las cookies y tokens de sesión activos leídos por el servidor.

2. **Configuración del Editor:**
   * Archivo: `C:\Users\Ramoncito\AppData\Roaming\Antigravity IDE\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json`
   * Instancia el ejecutable `notebooklm-mcp.exe`.

---

## 🔄 Re-autenticación de Sesión

Si la sesión de Google expira, ejecutá en cualquier terminal de PowerShell o CMD:

```powershell
notebooklm-mcp-auth
```

Se abrirá el navegador para autenticar tu cuenta y actualizar las cookies automáticamente.
