---
name: using-notebooklm-mcp
description: Manages NotebookLM notebooks, sources, and triggers content generation. Use when user mentions listing notebooks, querying sources, creating audio overviews, or generating study guides.
---

# Using NotebookLM MCP

This skill provides step-by-step instructions on how to use the NotebookLM Model Context Protocol (MCP) server to manage notebooks, upload sources, ask queries, and generate studio outputs.

## When to Use This Skill

- When listing, creating, renaming, or deleting NotebookLM notebooks.
- When adding, syncing, or deleting sources (text, URLs, Drive files) in a notebook.
- When querying notebooks and getting citation-backed answers.
- When triggering the creation of study aids (Audio, Video, Slides, Infographics, Quizzes, Flashcards, Mind Maps).

## Prerequisites

- NotebookLM MCP Server (`notebooklm-mcp.exe` and `notebooklm-mcp-auth.exe`).
- Valid cookies stored in `~/.notebooklm-mcp/auth.json`.

## Workflow

### Step 1: Initialize Connection and List Notebooks
Call `notebook_list` to list all notebooks and retrieve their `notebook_id`s.

### Step 2: Query Notebooks
Call `notebook_query` with:
- `notebook_id`: The ID of the target notebook.
- `query`: The question to ask.

### Step 3: Add Sources
Call `notebook_add_url` or `notebook_add_text` to import new context.

### Step 4: Generate Studio Content
Call `audio_overview_create`, `slide_deck_create`, `quiz_create`, or `infographic_create`. Poll `studio_status` until the generation is complete to get URLs.

## Validation

Verify execution by calling `notebook_list` and ensuring a `"status": "success"` response is returned with the correct list of notebooks.

## Error Handling

| Error | Cause | Resolution |
|-------|-------|------------|
| Authentication expired | Cookies in cache are invalid or expired | Run `notebooklm-mcp-auth` in terminal to re-authenticate |
| Unknown tool | Tool name was changed or misspelled | Refer to list of valid tool names |
| Request timeout | Google servers took too long | Set `timeout` parameter to a higher value (up to 120.0) |

## Resources

- `api_client.py` - Core client library.
- `server.py` - FastMCP server interface.
