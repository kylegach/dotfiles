#!/usr/bin/env bash

echo "  Checking for spaceship-prompt..."
FILE=~/.spaceship-prompt
if [ -f "$FILE" ]
  then
    echo "  Found spaceship-prompt; upgrading..."
    cd $FILE
    git pull origin
    cd -
  else 
    echo "  Installing spaceship-prompt..."
    DIR_IN_FPATH = "/usr/local/share/zsh/site-functions"
    git clone https://github.com/lukechilds/spaceship-prompt.git $FILE
    ln -sf "$FILE/spaceship.zsh" "$DIR_IN_FPATH/prompt_spaceship_setup"
fi
