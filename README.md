# Kyle Gach's dotfiles

Your dotfiles are how you personalize your system and automate setup. These are mine.


## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Go" — you can simply add a `go` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.


## What's Inside

A lot of stuff. Before blindly using, you should closely inspect the files
yourself, [fork this repo](https://github.com/kylegach/dotfiles/fork), remove
what you don't use, and build on what you do use.

There are a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file or folder ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.


## Install

Run this:

```sh
git clone https://github.com/kylegach/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main files you'll want to change right off the bat are `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine, and
`homebrew/Brewfile`, which defines the utilities and apps to be installed.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`. `dot` is automatically ran within `./scripts/bootstrap`.


## Bugs

I want this to work for everyone. That said, I do use this as _my_ dotfiles,
so there's a good chance I may break something if I forget to make a check for
a dependency. Please open an issue if you encounter any problems.


## Thanks

I forked [Zach Holman's](http://github.com/holman) clever
[dotfiles](http://github.com/holman/dotfiles) and grabbed a fair amount from
[Mathias Bynens'](https://github.com/mathiasbynens) extensive
[dotfiles](https://github.com/mathiasbynens/dotfiles), particularly
[.macos](https://github.com/https://github.com/mathiasbynens/dotfiles/blob/main/.macos/dotfiles).
