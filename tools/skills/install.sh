#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

need_cmd --skip "npx not found; skipping agent skills install" npx

REPO="https://github.com/mattpocock/skills"

# Skills to preinstall globally (available in every workspace, any repo).
# NOTE: upstream renamed "diagnose" -> "diagnosing-bugs".
# grill-me is omitted intentionally: grill-with-docs already covers it.
SKILLS=(
	grill-with-docs
	improve-codebase-architecture
	handoff
	diagnosing-bugs
	prototype
	resolving-merge-conflicts
	wizard
	code-review
	wayfinder
)

# Global skills dir for Claude Code. Must exist before `skills add --global`.
SKILLS_DIR="$HOME/.claude/skills"
mkdir -p "$SKILLS_DIR"

# Dotfiles run on every workspace start; only hit the network when something
# is actually missing.
missing=()
for s in "${SKILLS[@]}"; do
	[[ -d "$SKILLS_DIR/$s" ]] || missing+=("$s")
done

if [[ ${#missing[@]} -eq 0 ]]; then
	success "agent skills already installed (${#SKILLS[@]})"
	exit 0
fi

# The CLI takes one --skill flag per skill (comma/space lists are not parsed).
skill_args=()
for s in "${missing[@]}"; do
	skill_args+=(--skill "$s")
done

info "installing ${#missing[@]} agent skill(s): ${missing[*]}"
if npx -y skills@latest add "$REPO" \
	"${skill_args[@]}" \
	--agent claude-code \
	--global \
	--copy \
	--yes >/dev/null 2>&1; then
	success "installed agent skills to $SKILLS_DIR"
else
	warn "agent skills install failed (network?); will retry on next start"
fi
