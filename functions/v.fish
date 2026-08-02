# SPDX-FileCopyrightText: © 2026 dandelion.computer
# SPDX-License-Identifier: GPL-3.0-or-later

function v --description '🔎✨ view anything'
    set -l options 'l/lsd=' 'b/bat=' 'n/no-xdg' 'h/help' 'v/version'
    
    set -l ver '0.6'
    set -l domain 'dandelion.computer'
    
    argparse $options -- $argv
    or return 1
    
     if set -q _flag_help
        echo "Usage: v [OPTIONS] [TARGET]"
        echo
        echo "Options:"
        echo "  -l, --lsd=FLAGS    pass FLAGS to lsd when TARGET is a directory"
        echo "  -b, --bat=FLAGS    pass FLAGS to bat when TARGET is a file"
        echo "  -n, --no-xdg       don't open binary files in xdg-open"
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
        set -l lsd_flags (string split " " -- $_flag_lsd)
        lsd $lsd_flags "$target"
    else if begin
        not set -q _flag_no_xdg
        and set -q DISPLAY
        and test (file -bL --mime-encoding "$target") = "binary"
    end
        xdg-open "$target"
    else if test -f "$target"
        set -l bat_flags (string split " " -- $_flag_bat)
        bat $bat_flags "$target"
    else
        set -l lsd_flags (string split " " -- $_flag_lsd)
        lsd $lsd_flags "$target"
    end
end