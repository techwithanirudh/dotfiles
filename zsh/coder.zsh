# shell/coder.zsh

# Coder-specific ergonomics.
# Keep this minimal; templates and workspaces vary.

# Prefer no less history truncation.
export LESSHISTFILE='-'

# Make it easy to detect "running inside Coder" from scripts.
if [[ -n "${CODER:-}" || -n "${CODER_WORKSPACE_NAME:-}" ]]; then
	export DOTFILES_IN_CODER=1
fi
