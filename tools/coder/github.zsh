# In Coder workspaces, give gh a fresh GitHub token on every call instead of
# relying on a GH_TOKEN captured at workspace start (which expires).
if [[ -n "${CODER:-}" ]] && (( $+commands[coder] )); then
	gh() {
		GH_TOKEN="$(coder external-auth access-token primary-github)" command gh "$@"
	}
fi
