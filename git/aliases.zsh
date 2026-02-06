# Use hub as git wrapper if installed.
if (( $+commands[hub] )); then
	hub_path="$(command -v hub 2>/dev/null)"
	if [[ -n "$hub_path" ]]; then
		alias git="$hub_path"
	fi
fi

alias gl='git pull --prune'
alias gp='git push origin HEAD'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb'
alias ge='git-edit-new'

# Commit all with message: gac "message"
gac() {
	git add -A && git commit -m "$*"
}

alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Remove + and - from start of diff lines; rely on color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
