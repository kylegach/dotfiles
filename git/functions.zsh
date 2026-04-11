#!/usr/bin/env bash

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]
  then
    function diff() {
      git diff --no-index --color-words "$@"
    }
fi

# Clone a GitHub repo into an <org>/<repo> directory structure.
# Usage: ghclone <org>/<repo> or ghclone <github-url>
function ghclone() {
  if [ -z "$1" ]; then
    echo "Usage: ghclone <org>/<repo> or ghclone <github-url>" >&2
    return 1
  fi

  local target="$1"
  # Extract org/repo from GitHub URL
  if [[ "$target" =~ ^https?://github\.com/([^/]+/[^/]+)(\.git)?/?$ ]]; then
    target="${match[1]}"
  fi

  gh repo clone "$target" "$target"
}

# Report branches with unpushed commits in git repos under the current directory.
# Usage: unpushed [dir]
function unpushed() {
  local root="${1:-.}"
  local tmpfile=$(mktemp)

  find "$root" -name node_modules -prune -o -name .git -type d -print | while read gitdir; do
    local repo="${gitdir%/.git}"
    local branches=$(git -C "$repo" for-each-ref --format='%(refname:short) %(upstream:short)' refs/heads/)
    echo "$branches" | while read branch upstream; do
      [ -z "$branch" ] && continue
      if [ -z "$upstream" ]; then
        echo "$repo: $branch (no upstream)" | tee -a "$tmpfile"
      else
        local count=$(git -C "$repo" rev-list --count "$upstream..$branch" 2>/dev/null)
        if [ "$count" -gt 0 ] 2>/dev/null; then
          echo "$repo: $branch ($count unpushed commit(s))" | tee -a "$tmpfile"
        fi
      fi
    done
  done

  if [ ! -s "$tmpfile" ]; then
    echo "No unpushed branches found."
  fi
  rm -f "$tmpfile"
}
