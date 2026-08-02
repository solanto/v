# SPDX-FileCopyrightText: © 2026 dandelion.computer
# SPDX-License-Identifier: GPL-3.0-or-later

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

complete -c v -f -n "__fish_seen_subcommand_from -l --lsd" -a "(__v_complete_lsd)"
complete -c v -f -n "__fish_seen_subcommand_from -b --bat" -a "(__v_complete_bat)"

complete -c v -f -n "__fish_use_subcommand" -s l -l lsd -d "pass flags to lsd"
complete -c v -f -n "__fish_use_subcommand" -s b -l bat -d "pass flags to bat"

complete -c v -s n -l no-xdg -d "don't use xdg-open"
complete -c v -s v -l version -d "show version info"
complete -c v -s h -l help -d "show help message"