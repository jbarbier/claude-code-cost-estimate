#!/usr/bin/env bash
# Session-start reminder for the open anthropics/skills PR.
# Reads memory/anthropic-skills-pr-985.md frontmatter for status + dates,
# prints a one-liner only when the PR is still open. Silent after merge/close.
set -eu

MEM=/home/gordon/.claude/projects/-home-gordon-cost-estimate/memory/anthropic-skills-pr-985.md

if [ ! -f "$MEM" ]; then
  # Memory cleared or not yet created — nothing to track
  exit 0
fi

# Split on the FIRST ": " only — values may contain ":" (e.g. https://)
fm() { sed -n "s/^$1:[[:space:]]*//p" "$MEM" | head -1; }
status=$(fm status)
pr_url=$(fm pr_url)
pr_number=$(fm pr_number)
opened=$(fm opened_at)
checked=$(fm last_checked)

# Silent once the PR has landed — no reminder needed
case "$status" in
  merged|closed|abandoned)
    exit 0
    ;;
esac

today=$(date +%Y-%m-%d)
age=$(python3 -c "
from datetime import date
o='$opened'; t='$today'
print((date.fromisoformat(t) - date.fromisoformat(o)).days if o else 0)
" 2>/dev/null || echo 0)

since_check=$(python3 -c "
from datetime import date
c='$checked'; t='$today'
print((date.fromisoformat(t) - date.fromisoformat(c)).days if c else 0)
" 2>/dev/null || echo 0)

echo "📬 anthropics/skills PR #${pr_number} is open (${age}d since submission, ${since_check}d since last status check)"
echo "   $pr_url"
if [ "${since_check:-0}" -ge 3 ]; then
  echo "   ⚠ Not checked in ${since_check} days — ask Claude: 'check status of PR #${pr_number}'"
fi
