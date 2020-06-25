# Kyle Gach's dotfiles

Your dotfiles are how you personalize your system and automate setup. These are mine.

![screenshot of terminal detailing changes from upstream, including Brewfile, zsh plugins, nvm, spaceship-prompt, aliases, functions, mackup][screenshot]


## What's Inside

A lot of stuff. Before blindly using, you should closely inspect the files yourself,
[fork this repo][fork], remove what you don't use, and build on what you do use.

### Topical Architecture

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Go" — you can simply add a `go` directory and put
files in there.

There are a few special files in the hierarchy.

- **bin/**: Anything in [`bin/`][bin] will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run
  [`script/install`][install]. To avoid being loaded automatically, its extension is `.sh`,
  not `.zsh`.
- **topic/\*.symlink**: Any file or folder ending in `*.symlink` gets symlinked into
  your `$HOME`. (e.g. `[topic]/fileName.symlink` -> `~/.fileName`) This is so you can keep
  all of those versioned in your dotfiles but still keep those autoloaded files in your home
  directory. These get symlinked in when you run [`script/bootstrap`][bootstrap].


## Install

Run this:

```sh
git clone https://github.com/kylegach/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

[`dot`][dot] is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. It is also automatically ran
within [`script/bootstrap`][bootstrap].


### Where to Start Customizing

After [forking this repo][fork], the main files you'll want to change right off the bat are:

- [`zsh/zshrc.symlink`][zshrc]: Sets up a few paths that'll be different on your particular machine
- [`homebrew/Brewfile`][Brewfile]: Defines the utilities and apps to be installed
- [`macos/setup-defaults.sh`][macos]: Defines macOS defaults
- [`macos/Mackup`][mackupdir]: Defines third-party defaults. You'll probably want to [replace these with your own][mackup]

You'll probably also want to create a `~/.localrc` (see [example][examplelocalrc]).


## Bugs

I want this to work for everyone. That said, I do use this as _my_ dotfiles,
so there's a good chance I may break something if I forget to make a check for
a dependency. Please open an issue if you encounter any problems.


## Thanks

I forked [Zach Holman's](http://github.com/holman) clever
[dotfiles](http://github.com/holman/dotfiles) and grabbed a fair amount from
[Mathias Bynens'](https://github.com/mathiasbynens) extensive
[dotfiles](https://github.com/mathiasbynens/dotfiles), particularly the incredibly helpful
[.macos](https://github.com/https://github.com/mathiasbynens/dotfiles/blob/main/.macos/dotfiles).


[screenshot]: https://github.com/kylegach/dotfiles/blob/main/screenshot.png
[fork]: https://github.com/kylegach/dotfiles/fork
[bin]: https://github.com/kylegach/dotfiles/blob/main/bin
[install]: https://github.com/kylegach/dotfiles/blob/main/script/install
[bootstrap]: https://github.com/kylegach/dotfiles/blob/main/script/bootstrap
[dot]: https://github.com/kylegach/dotfiles/blob/main/bin/dot
[zshrc]: https://github.com/kylegach/dotfiles/blob/main/zsh/zshrc.symlink
[Brewfile]: https://github.com/kylegach/dotfiles/blob/main/homebrew/Brewfile
[macos]: https://github.com/kylegach/dotfiles/blob/main/macos/setup-defaults
[mackupdir]: https://github.com/kylegach/dotfiles/blob/main/macos/Mackup
[mackup]: https://github.com/lra/mackup
[examplelocalrc]: https://github.com/kylegach/dotfiles/blob/main/system/localrc.symlink.example
