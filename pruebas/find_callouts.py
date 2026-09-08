import json

transcript_path = r"C:\Users\Ramoncito\.gemini\antigravity-ide\brain\bdb42588-12ca-4479-b7be-457c6b31ded5\.system_generated\logs\transcript.jsonl"

with open(transcript_path, "r", encoding="utf-8", errors="ignore") as f:
    for i, line in enumerate(f):
        if "dae6fb" in line or "153E5C" in line or "callout" in line:
            obj = json.loads(line)
            if "tool_calls" in obj:
                for tc in obj["tool_calls"]:
                    args = tc.get("args", {})
                    target = args.get("TargetFile", "")
                    print(f"Step {i}: tool={tc.get('name')} target={target}")
                    code = args.get("CodeContent", "")
                    if "dae6fb" in code or "153E5C" in code:
                        print("CODE:\n", code[:1000])
