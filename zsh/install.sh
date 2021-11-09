#!/bin/sh

echo ""
echo "🔎  Checking for spaceship-prompt..."

DIR=$HOME/.spaceship-prompt
if ! [[ -a $DIR ]]
then
  echo "🚀  Installing spaceship-prompt..."
  DIR_IN_FPATH="/usr/local/share/zsh/site-functions"
  git clone https://github.com/denysdovhan/spaceship-prompt.git $DIR
  # https://github.com/spaceship-prompt/spaceship-prompt/issues/1057
  sudo ln -sf "$DIR/spaceship.zsh" "$DIR_IN_FPATH/prompt_spaceship_setup"    
else 
  echo "⤴️   Found spaceship-prompt; upgrading..."
  cd $DIR
  git pull --rebase origin
  cd -
fi

echo "✅  spaceship-prompt done."
exit 0