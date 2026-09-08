import json

transcript_path = r"C:\Users\Ramoncito\.gemini\antigravity-ide\brain\bdb42588-12ca-4479-b7be-457c6b31ded5\.system_generated\logs\transcript.jsonl"

with open(transcript_path, "r", encoding="utf-8", errors="ignore") as f:
    for i, line in enumerate(f):
        if i == 409:
            obj = json.loads(line)
            tc = obj["tool_calls"][0]
            with open("pruebas/script_409.py", "w", encoding="utf-8") as out:
                # write raw code content
                raw = tc["args"]["CodeContent"]
                # In json, it's string. Let's write directly:
                out.write(raw)
            print("Wrote script_409.py successfully")
