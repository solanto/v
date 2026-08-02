# <img src="misc/icon.svg" alt="v" height="64" width="auto" style="height: 2em">

![version 0.2](https://img.shields.io/badge/version-0.2-blue)

𝐯iew directories and files with a single command.

v is a little [fish](https://fishshell.com/) function that infers whether you want to use [`lsd`](https://github.com/lsd-rs/lsd), [`bat`](https://github.com/sharkdp/bat), or [`xdg-open`](https://www.freedesktop.org/wiki/Software/xdg-utils/) given any path (or no path at all).

## prerequisites

v is made for the [fish shell](https://fishshell.com/).

To use v, you'll need to have [`lsd`](https://github.com/lsd-rs/lsd#installing-with-a-package-manager) and [`bat`](https://github.com/sharkdp/bat#installation) installed.

You'll also need [xdg-utils](https://www.freedesktop.org/wiki/Software/xdg-utils/), but this comes preinstalled with just about all distros' graphical installations.

## installing

In a fish shell, run:

```fish
begin; set -l install_path ~/.config/fish/functions/v.fish; curl -o $install_path https://raw.githubusercontent.com/solanto/v/refs/heads/main/v.fish && source $install_path; end
```

## usage

Show the current directory with `lsd`:

```fish
v
```

Show another directory—like `~/Documents`—with `lsd`:

```fish
v ~/Documents
```

Show a text file—like `~/Documents/hello.md`—with `bat`:

```fish
v ~/Documents/hello.md
```

Show an image—like `~/Pictures/me.jpeg`—with your default image viewer.

```fish
v ~/Pictures/me.jpeg
```

### more features

Pass any supported options to `lsd` with `--lsd` (`-l`) and to `bat` with `--bat` (`-b`). v will apply options only to the task at hand; `lsd` won't see `bat`'s options, and vice versa.

```fish
v --lsd -al ~/Documents
v -L -al -B -s doc.typst
```

Tell v you don't want to use `xdg-open` with `--no-xdg` (`-n`).

See version info with `--version` (`-v`) and a help message with `--help` (`-h`).

## contributing

Feel free to ask questions or make suggestions here or at [person@dandelion.computer](mailto:person@dandelion.computer). I'll do my best to collaborate with those who'd like to!

If you fork v, be sure to change [`domain` in the `v` function](v.fish#L8) to your own domain (which could even be something like `your-username.github.io`) to make it clear as to whose code anyone is running.

## license

[GNU General Public License v3.0 or later](https://spdx.org/licenses/GPL-3.0-or-later.html), unless otherwise stated. See the GPLv3 license in [`LICENSE.md`](LICENSE.md).
