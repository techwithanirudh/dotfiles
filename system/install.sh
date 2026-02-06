#!/usr/bin/env bash
set -euo pipefail

# Base packages these dotfiles/installers assume exist.
as_root() {
	if [[ "$(id -u)" == "0" ]]; then
		"$@"
		return
	fi
	if command -v sudo >/dev/null 2>&1; then
		sudo "$@"
		return
	fi
	echo "need root to run: $*" >&2
	return 1
}

packages_file="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)/packages.apt"
if [[ ! -f "$packages_file" ]]; then
	echo "missing packages list: $packages_file" >&2
	exit 1
fi

mapfile -t packages < <(grep -Ev '^[[:space:]]*(#|$)' "$packages_file")

as_root apt-get update -y
as_root apt-get install -y "${packages[@]}"
