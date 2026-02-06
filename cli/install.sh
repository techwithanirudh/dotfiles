#!/usr/bin/env bash
set -euo pipefail

# Installs developer CLIs used by these dotfiles.

ensure_local_bin() {
	mkdir -p "$HOME/.local/bin"
	case ":${PATH}:" in
		*":$HOME/.local/bin:"*) ;;
		*) export PATH="$HOME/.local/bin:$PATH" ;;
	esac
}

install_claude() {
	if command -v claude >/dev/null 2>&1; then
		echo "claude already installed"
		return
	fi
	if ! command -v curl >/dev/null 2>&1; then
		echo "curl not found; skipping claude install"
		return
	fi
	echo "installing claude"
	curl -fsSL https://claude.ai/install.sh | bash
}

install_codex() {
	if command -v codex >/dev/null 2>&1; then
		echo "codex already installed"
		return
	fi

	if command -v brew >/dev/null 2>&1; then
		echo "installing codex via brew"
		brew install codex
		return
	fi

	if ! command -v npm >/dev/null 2>&1; then
		echo "npm not found; skipping codex install"
		return
	fi
	echo "installing codex via npm"
	npm i -g @openai/codex
}

install_opencode() {
	if command -v opencode >/dev/null 2>&1; then
		echo "opencode already installed"
		return
	fi
	if ! command -v curl >/dev/null 2>&1; then
		echo "curl not found; skipping opencode install"
		return
	fi
	echo "installing opencode"
	curl -fsSL https://opencode.ai/install | bash
}

ensure_local_bin
install_claude
install_codex
install_opencode
