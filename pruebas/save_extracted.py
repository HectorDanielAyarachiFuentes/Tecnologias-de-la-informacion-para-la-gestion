import json

transcript_path = r"C:\Users\Ramoncito\.gemini\antigravity-ide\brain\bdb42588-12ca-4479-b7be-457c6b31ded5\.system_generated\logs\transcript.jsonl"

with open(transcript_path, "r", encoding="utf-8", errors="ignore") as f:
    for i, line in enumerate(f):
        if i == 451:
            obj = json.loads(line)
            tc = obj["tool_calls"][0]
            raw = tc["args"]["CodeContent"]
            # decode json string literal
            decoded = json.loads(f'"{raw[1:-1]}"')
            with open("pruebas/apply_all_extracted.py", "w", encoding="utf-8") as out:
                out.write(decoded)
            print("Successfully written apply_all_extracted.py")
