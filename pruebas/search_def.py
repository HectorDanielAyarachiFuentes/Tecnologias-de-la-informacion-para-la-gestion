import glob, json

logs = glob.glob(r"C:\Users\Ramoncito\.gemini\antigravity-ide\brain\*\.system_generated\logs\transcript.jsonl")
for log in logs:
    with open(log, "r", encoding="utf-8", errors="ignore") as f:
        for i, line in enumerate(f):
            if "plantilla_academica" in line and "def " in line:
                print(f"Match in {log} line {i}")
                # print snippet
                obj = json.loads(line)
                if "tool_calls" in obj:
                    for tc in obj["tool_calls"]:
                        print(tc.get("args", {}).get("TargetFile"))
                        print(tc.get("args", {}).get("CodeContent")[:500])
