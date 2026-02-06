#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ensure_local_bin() {
	mkdir -p "$HOME/.local/bin"
	case ":$PATH:" in
		*":$HOME/.local/bin:"*) ;;
		*) export PATH="$HOME/.local/bin:$PATH" ;;
	esac
}

install_starship() {
	if command -v starship >/dev/null 2>&1; then
		echo "starship already installed"
		return
	fi
	if ! command -v curl >/dev/null 2>&1; then
		echo "curl not found; skipping starship install"
		return
	fi
	echo "installing starship..."
	curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
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
	echo "installing claude..."
	curl -fsSL https://claude.ai/install.sh | bash
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
	echo "installing opencode..."
	curl -fsSL https://opencode.ai/install | bash
}

install_codex() {
	if command -v codex >/dev/null 2>&1; then
		echo "codex already installed"
		return
	fi
	if ! command -v npm >/dev/null 2>&1; then
		echo "npm not found; skipping codex install"
		return
	fi
	echo "installing codex..."
	npm i -g @openai/codex
}

link_file() {
	local src="$1"
	local dest="$2"
	mkdir -p "$(dirname "$dest")"
	ln -sfn "$src" "$dest"
}

ensure_local_bin
install_starship
install_claude
install_opencode
install_codex

link_file "$repo_dir/.bashrc" "$HOME/.bashrc"
link_file "$repo_dir/.bash_prompt" "$HOME/.bash_prompt"
link_file "$repo_dir/.zshrc" "$HOME/.zshrc"
link_file "$repo_dir/.aliases" "$HOME/.aliases"
link_file "$repo_dir/.exports" "$HOME/.exports"
link_file "$repo_dir/zsh/starship.toml" "$HOME/.config/starship.toml"
