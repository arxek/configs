fish_add_path /Users/arxek147/.lmstudio/bin
fish_add_path /Users/arxek147/.lazyff/bin
fish_add_path $HOME/.cargo/bin

if status is-interactive
    set -g fish_greeting ""

    # /--- OS specific ---\

    switch (uname)
        # --- macOS ---
        case Darwin
            # fastfetch
            set ff_short "macos-ff-short.jsonc"
            set ff_long "macos-ff-long.jsonc"

            # oh-my-posh
            set omp_theme "powerlevel10k_rainbow.omp.json"

            # alias
            abbr -a bi 'brew install'
            abbr -a bic 'brew install --cask'
            abbr -a buu 'brew update && brew upgrade'

            # --- Linux ---
        case Linux
            # --- NixOS ---
            if test -e /etc/NIXOS
                # fastfetch
                #set ff_short = "nixos-ff-short.jsonc"
                #set ff_long = "nixos-ff-long.jsonc"
                set ff_short = "config.jsonc"
                set ff_long = "config.jsonc" # TEMPORARY

                # alias
                abbr -a nxc 'sudo nvim /etc/nixos/configuration.nix'
                abbr -a nxr 'sudo nixos-rebuild switch'
                abbr -a nxru 'sudo nixos-rebuild switch --upgrade'

                # --- Android ---
            else if string match -q "*com.termux" "$PREFIX"
                # fastfetch
                #set ff_short "android-ff-short.jsonc"
                #set ff_long "android-ff-long"
                set ff_short = "config.jsonc"
                set ff_long = "config.jsonc" # TEMPORARY

                # alias
                abbr -a pi 'pkg install'
                abbr -a puu 'pkg update && upgrade'
            end
    end

    # \--- OS specific ---/

    # /--- Universal ---\

    # fastfetch
    if type -q fastfetch
        fastfetch --config "$HOME/.config/fastfetch/$ff_short"
        abbr -a f 'fastfetch --config ~/.config/fastfetch/$ff_short'
        abbr -a ff 'fastfetch --config ~/.config/fastfetch/$ff_long'

    end
    # oh-my-posh
    if type -q oh-my-posh
        oh-my-posh init fish --config "$HOME/.cache/oh-my-posh/themes/$omp_theme" | source

        thefuck --alias | source
    end

    # alias
    #abbr -a f 'fastfetch --config ~/.config/fastfetch/$ff_short'
    #abbr -a ff 'fastfetch --config ~/.config/fastfetch/$ff_long'
    abbr -a c clear
    abbr -a cb 'cbonsai -i -l'
    abbr -a py python
    abbr -a b btop
    abbr -a v nvim
    abbr -a lg lazygit
    abbr -a q exit
    abbr -a torlink 'npx torlnk'

    alias ls='eza --oneline --icons --long --sort=extension --time-style=long-iso --no-user --no-permissions'
    alias lsa='eza --oneline --icons --long --sort=extension --time-style=long-iso --no-user --no-permissions --all'
end

# \--- Universal ---/

# /--- Functions ---\

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

# \--- Functions ---/
