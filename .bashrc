# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

if [[ -f "$HOME/.bash_prompt" ]]; then
	# shellcheck source=/dev/null
	source "$HOME/.bash_prompt"
fi

for file in "$HOME/.exports" "$HOME/.aliases"; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
