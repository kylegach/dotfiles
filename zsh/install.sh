#!/bin/sh

echo "  Checking for spaceship-prompt..."
DIR=~/.spaceship-prompt
if [[ -d $DIR ]]
  then
    echo "  Found spaceship-prompt; upgrading..."
    cd $DIR
    git pull --rebase origin
    cd -
  else 
    echo "  Installing spaceship-prompt..."
    DIR_IN_FPATH="/usr/local/share/zsh/site-functions"
    git clone https://github.com/denysdovhan/spaceship-prompt.git $DIR
    ln -sf "$DIR/spaceship.zsh" "$DIR_IN_FPATH/prompt_spaceship_setup"
fi
