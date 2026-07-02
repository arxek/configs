if status is-interactive

  # universal
fastfetch
oh-my-posh init fish --config /Users/arxek147/.cache/oh-my-posh/themes/powerlevel10k_rainbow.omp.json | source

alias f='fastfetch'

  # macos only
alias bi='brew install'
alias buu='brew update & brew upgrade'

end
