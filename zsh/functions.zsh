#!/usr/bin/env zsh

# Output a tree view of the current directory.
# Usage: tree [depth]
function tree() {
  command tree -L "${1:-2}" --dirsfirst
}
