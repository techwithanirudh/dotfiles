#!/usr/bin/env bash
set -euo pipefail

# Installs Homebrew by default (skip with DOTFILES_SKIP_BREW=1).

if command -v brew >/dev/null 2>&1; then
	echo "brew already installed"
	exit 0
fi

if [[ "${DOTFILES_SKIP_BREW:-}" == "1" ]]; then
	echo "DOTFILES_SKIP_BREW set; skipping brew install"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	echo "curl not found; cannot install brew"
	exit 1
fi

# Homebrew's installer supports non-interactive installs.
export NONINTERACTIVE=1

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
