#!/usr/bin/env bash
set -euo pipefail

if command -v codex >/dev/null 2>&1; then
	echo "codex already installed"
	exit 0
fi

if ! command -v npm >/dev/null 2>&1; then
	echo "npm not found; skipping codex install"
	exit 0
fi

echo "installing codex via npm"
npm i -g @openai/codex
