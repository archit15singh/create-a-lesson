#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -x "$root/bin/learn" ]]; then
  echo "FAIL: expected executable bin/learn"
  exit 1
fi

help="$($root/bin/learn --help)"
[[ "$help" == *'Usage: learn "topic"'* ]] || {
  echo "FAIL: expected usage guidance"
  exit 1
}

echo "PASS: learn help contract"

temp_dir="$(mktemp -d)"
trap 'rm -rf "$temp_dir"' EXIT
fake_bin="$temp_dir/bin"
mkdir -p "$fake_bin"
cat > "$fake_bin/codex" <<'EOF'
#!/usr/bin/env bash
printf '%s\n' "$@" > "$CODEX_ARGS_FILE"
mkdir -p "$LESSON_OUTPUT_DIR"
printf '<!doctype html><title>Lesson</title>' > "$LESSON_OUTPUT_DIR/index.html"
EOF
chmod +x "$fake_bin/codex"

CODEX_ARGS_FILE="$temp_dir/codex-args" \
LESSON_OUTPUT_DIR="$temp_dir/lessons/gradient-descent" \
LESSONS_DIR="$temp_dir/lessons" \
PATH="$fake_bin:$PATH" \
"$root/bin/learn" "Gradient Descent" > "$temp_dir/result"

[[ -f "$temp_dir/lessons/gradient-descent/index.html" ]] || {
  echo "FAIL: expected generated index.html"
  exit 1
}
grep -q '^exec$' "$temp_dir/codex-args" || {
  echo "FAIL: expected codex exec"
  exit 1
}
grep -q -- '--ask-for-approval' "$temp_dir/codex-args" || {
  echo "FAIL: expected non-interactive approval policy"
  exit 1
}
grep -q 'gradient-descent' "$temp_dir/result" || {
  echo "FAIL: expected generated lesson path"
  exit 1
}

echo "PASS: learn generation contract"

sample="$root/examples/gradient-descent/index.html"
[[ -f "$sample" ]] || { echo "FAIL: expected sample lesson"; exit 1; }
grep -q -- '--color-ink' "$sample" || { echo "FAIL: expected design tokens"; exit 1; }
grep -q 'id="learning-rate"' "$sample" || { echo "FAIL: expected learning-rate control"; exit 1; }
grep -q 'function runSimulation' "$sample" || { echo "FAIL: expected interactive simulation"; exit 1; }
grep -q 'aria-live' "$sample" || { echo "FAIL: expected accessible feedback"; exit 1; }

echo "PASS: sample lesson contract"
