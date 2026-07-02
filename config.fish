if status is-interactive

  # universal
fastfetch
oh-my-posh init fish --config /Users/arxek147/.cache/oh-my-posh/themes/powerlevel10k_rainbow.omp.json | source

alias f='fastfetch'
alias c='clear'

  # macos only
alias bi='brew install'
alias buu='brew update & brew upgrade'

  # nixos
alias nxc='sudo vim /etc/nixos/configuration.nix'
alias nxr='sudo nixos-rebuild switch'
alias nxru='sudo nixos-rebuild switch --upgrade'

end
