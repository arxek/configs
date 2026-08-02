if status is-interactive

  # universal
fastfetch
oh-my-posh init fish --config /Users/arxek147/.cache/oh-my-posh/themes/powerlevel10k_rainbow.omp.json | source

alias f='fastfetch'
alias c='clear'
alias cb='cbonsai -i -l'
alias py='python3'
alias b='btop'
# alias y='yazi'

  # macos only
alias bi='brew install'
alias buu='brew update & brew upgrade'

end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/arxek147/.lmstudio/bin
# End of LM Studio CLI section

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end
# yazi
