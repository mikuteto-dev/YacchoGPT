#!/bin/bash
# ヤッチョGPT - モデル別プロンプトとスキル版を models/src から生成する

set -euo pipefail
cd "$(dirname "$0")"

SRC="models/src"
REF="skills/yaccho-gpt/references"

MODELS=(
    "claude-fable-5-1|claude|Claude Fable 5.1"
    "claude-opus-5-5|claude|Claude Opus 5.5"
    "claude-sonnet-5-5|claude|Claude Sonnet 5.5"
    "claude-haiku-5-5|claude|Claude Haiku 5.5"
    "gpt-6-astra|gpt6|GPT-6 Astra"
    "gpt-6.1-sol|gpt6|GPT-6.1 Sol"
    "gpt-6-sol|gpt6|GPT-6 Sol"
    "gpt-6-luna|gpt6|GPT-6 Luna"
    "gpt-5.6-sol|gpt56|GPT-5.6 Sol"
    "gpt-5.6-terra|gpt56|GPT-5.6 Terra"
    "gpt-5.6-luna|gpt56|GPT-5.6 Luna"
    "gemini-3.8-flash|gemini|Gemini 3.8 Flash"
    "gemini-4-argon|gemini|Gemini 4 Argon"
)

mkdir -p "$REF"
rm -f models/*.md "$REF"/*.md

for entry in "${MODELS[@]}"; do
    IFS='|' read -r id family name <<< "$entry"
    out="models/ヤッチョGPT (for ${name}).md"
    python3 -I - "$SRC/base-${family}.md" "$SRC/${id}.md" "$out" <<'PY'
import sys
base, notes, out = sys.argv[1:]
text = open(base, encoding="utf-8").read()
assert text.count("{{MODEL_NOTES}}") == 1, base
text = text.replace("{{MODEL_NOTES}}", open(notes, encoding="utf-8").read().strip())
open(out, "w", encoding="utf-8").write(text)
PY
    cp "$out" "$REF/${id}.md"
    echo "built: $out"
done

cp "ヤッチョGPT.md" "$REF/default.md"
echo "built: $REF/default.md"
