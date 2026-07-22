#!/usr/bin/env bash
# validate.sh — structural validation for the linkedin-strategy-kit bundle (2 skills).
# Pure python3 stdlib — no pip deps. Run: bash scripts/validate.sh
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

python3 - "$ROOT" <<'PY'
import sys, os, re, json, glob

ROOT = sys.argv[1]
errors, warns = [], []
def err(m): errors.append(m)
def warn(m): warns.append(m)

def load_json(rel):
    p = os.path.join(ROOT, rel)
    try:
        return json.load(open(p, encoding="utf-8"))
    except FileNotFoundError:
        err(f"{rel}: missing"); return None
    except json.JSONDecodeError as e:
        err(f"{rel}: invalid JSON ({e})"); return None

plugin = load_json(".claude-plugin/plugin.json")
market = load_json(".claude-plugin/marketplace.json")
pv = plugin.get("version") if plugin else None
if plugin and not pv:
    err("plugin.json: no version")
if plugin and market:
    mvs = [p.get("version") for p in market.get("plugins", [])]
    if pv not in mvs:
        err(f"version skew: plugin.json={pv} but marketplace.json={mvs}")

# per-skill SKILL.md checks
EXPECTED = {"strategy", "profile-audit"}
skill_dirs = sorted(d for d in glob.glob(os.path.join(ROOT, "skills", "*")) if os.path.isdir(d))
found = {os.path.basename(d) for d in skill_dirs}
for missing in EXPECTED - found:
    err(f"skills/{missing}: missing")
for d in skill_dirs:
    folder = os.path.basename(d)
    md = os.path.join(d, "SKILL.md")
    if not os.path.isfile(md):
        err(f"{folder}: no SKILL.md"); continue
    txt = open(md, encoding="utf-8").read()
    fm = re.match(r"^---\n(.*?)\n---", txt, re.S)
    if not fm:
        err(f"{folder}: no YAML frontmatter"); continue
    kv = dict(re.findall(r"^([A-Za-z0-9_-]+):[ ](.*)$", fm.group(1), re.M))
    if kv.get("name", "") != folder:
        err(f"{folder}: frontmatter name='{kv.get('name','')}' != folder")
    desc = kv.get("description", "").strip()
    if not desc:
        err(f"{folder}: empty/missing description")
    elif desc[:1] in ('"', "'") or '"' in desc or ': ' in desc:
        err(f"{folder}: description breaks YAML (quote or ': ')")

# reference deps (union of both skills)
for ref in ("strategy-template.md", "methodology.md", "hook-bank.md", "notion-schema.md", "profile-optimization.md"):
    if not os.path.isfile(os.path.join(ROOT, "reference", ref)):
        err(f"reference/{ref}: missing (a skill depends on it)")

print(f"Checked {len(skill_dirs)} skill(s).")
for w in warns:
    print(f"  WARN  {w}")
if errors:
    for e in errors:
        print(f"  FAIL  {e}")
    print(f"\n✗ {len(errors)} error(s).")
    sys.exit(1)
print(f"\n✓ All checks passed ({len(warns)} warning(s)). Bundle version: {pv}")
PY
