import json

transcript_path = r"C:\Users\Ramoncito\.gemini\antigravity-ide\brain\81f89b9c-c9cd-4455-979f-ba9bc1bb8e66\.system_generated\logs\transcript.jsonl"

with open(transcript_path, "r", encoding="utf-8", errors="ignore") as f:
    for i, line in enumerate(f):
        if "F8FAFC" in line:
            obj = json.loads(line)
            print(f"Line {i}: keys={list(obj.keys())}")
            if "tool_calls" in obj:
                for tc in obj["tool_calls"]:
                    print("Tool name:", tc.get("name"))
                    print("Params:", tc.get("parameters", {}))
            if "content" in obj:
                print("Content:", obj["content"][:300])
