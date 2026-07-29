# SPDX-FileCopyrightText: © 2026 dandelion.computer
# SPDX-License-Identifier: GPL-3.0-or-later

function v
    set -l options 'L/lsd=' 'B/bat=' 'h/help' 'v/version'
    
    set -l ver '0.1'
    set -l domain 'dandelion.computer'
    
    argparse $options -- $argv
    or return 1
    
     if set -q _flag_help
        echo "Usage: v [OPTIONS] [TARGET]"
        echo
        echo "Options:"
        echo "  -L, --lsd=FLAGS    pass FLAGS to lsd when TARGET is a directory"
        echo "  -B, --bat=FLAGS    pass FLAGS to bat when TARGET is a file"
        echo "  -v, --version      show version information and exit"
        echo "  -h, --help         show this help message and exit"
        echo
        echo "See more at https://github.com/solanto/v"
        return 0
    end
    
    if set -q _flag_version
        echo "v 🔎✨️ $ver ($domain)"
        return 0
    end
    
    set -l target "."
    if test (count $argv) -gt 0
        set target $argv[-1]
    end

    if test -d "$target"
        set -l lsd_flags (string split " " -- $_flag_L)
        lsd $lsd_flags "$target"
    else if test -f "$target"
        set -l bat_flags (string split " " -- $_flag_C)
        bat $bat_flags "$target"
    else
        set -l lsd_flags (string split " " -- $_flag_L)
        lsd $lsd_flags "$target"
    end
end

function __v_complete_lsd
    set -l token (commandline -ct)
    set -l clean_token (string replace -r '^[\"\']' '' -- $token)
    
    complete -C "lsd $clean_token"
    complete -C "ls $clean_token"
end

function __v_complete_bat
    set -l token (commandline -ct)
    set -l clean_token (string replace -r '^[\"\']' '' -- $token)
    
    complete -C "bat $clean_token"
end

complete -c v -f -n "__fish_seen_subcommand_from -L --lsd" -a "(__v_complete_lsd)"
complete -c v -f -n "__fish_seen_subcommand_from -B --bat" -a "(__v_complete_bat)"

complete -c v -f -n "__fish_use_subcommand" -s L -l lsd -d "pass flags to lsd"
complete -c v -f -n "__fish_use_subcommand" -s B -l bat -d "pass flags to bat"

complete -c v -s v -l version -d "show version info"
complete -c v -s h -l help -d "show help message"