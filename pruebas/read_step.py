import json

p = r"C:\Users\Ramoncito\.gemini\antigravity-ide\brain\81f89b9c-c9cd-4455-979f-ba9bc1bb8e66\.system_generated\logs\transcript.jsonl"
with open(p, "r", encoding="utf-8", errors="ignore") as f:
    for i, line in enumerate(f):
        if i == 506:
            obj = json.loads(line)
            tc = obj["tool_calls"][0]
            print("tc keys:", tc.keys())
            print(tc)
