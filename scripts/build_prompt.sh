#!/bin/bash
set -e

ROOT=$(pwd)
OUT="$ROOT/generated"
MODULE="$ROOT/prompts/team-code-instruction"

mkdir -p "$OUT"

echo "# Final Prompt" > "$OUT/final_prompt.md"

echo -e "\n## Base\n" >> "$OUT/final_prompt.md"
cat "$ROOT/prompts/base.md" >> "$OUT/final_prompt.md"

echo -e "\n\n## Generation Rules\n" >> "$OUT/final_prompt.md"
cat "$ROOT/prompts/generation-rules.md" >> "$OUT/final_prompt.md"

echo -e "\n\n## Team Code Instruction (from submodule)\n" >> "$OUT/final_prompt.md"

# 루프 돌며 rules/* 자동 병합
for FILE in $MODULE/rules/*.md; do
  echo -e "\n### $(basename $FILE)\n" >> "$OUT/final_prompt.md"
  cat $FILE >> "$OUT/final_prompt.md"
done

echo "final_prompt.md generated."