#!/bin/sh

# Symlink our Ghostty config with the expected location
GHOSTTY_CONFIG="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
rm "$GHOSTTY_CONFIG"
ln -s ~/.dotfiles/ghostty/config.ghostty "$GHOSTTY_CONFIG"
