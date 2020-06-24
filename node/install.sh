#!/bin/zsh

# We reload the shell a couple times to make `nvm` available

echo "  Checking for zsh-nvm..."
DIR=~/.zsh-nvm
if [[ -a $DIR ]]
then
  echo "  Found zsh-nvm, upgrading..."
  source ~/.zshrc
  nvm upgrade
else
  echo "  Installing zsh-nvm..."
  git clone https://github.com/lukechilds/zsh-nvm.git $DIR
fi

source ~/.zshrc

echo "  Installing node..."
nvm install node
nvm use node

echo "  Installing/upgrading global npm packages..."
GLOBAL_NPM_PACKAGES=(
  npm
  yarn
)
npm install -g ${GLOBAL_NPM_PACKAGES[@]}

exit 0
