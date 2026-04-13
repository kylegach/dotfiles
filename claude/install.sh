#!/bin/sh

# Symlink our Claude config with the expected location
CLAUDE_CONFIG="$HOME/.claude/settings.json"
rm "$CLAUDE_CONFIG"
ln -s ~/.dotfiles/claude/settings.json "$CLAUDE_CONFIG"
