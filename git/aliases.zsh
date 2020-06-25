# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git ca'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gl="git l"
alias gs='git s' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git amend'
