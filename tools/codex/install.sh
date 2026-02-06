#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

if command -v codex >/dev/null 2>&1; then
	success "codex already installed"
	exit 0
fi

if ! command -v npm >/dev/null 2>&1; then
	info "npm not found; skipping codex install"
	exit 0
fi

info "installing codex via npm"
npm i -g @openai/codex
