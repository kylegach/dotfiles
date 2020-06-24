#!/bin/zsh

# We reload the shell to make `nvm` available, either before upgrading [1]
# or after installing [2]

echo "  Checking for zsh-nvm..."
DIR=~/.zsh-nvm
if [[ -a $DIR ]]
then
  echo "  Found zsh-nvm, upgrading..."
  source ~/.zshrc # [1]
  nvm upgrade
else
  echo "  Installing zsh-nvm..."
  git clone https://github.com/lukechilds/zsh-nvm.git $DIR
  source ~/.zshrc # [2]
fi

echo "  Installing node..."
nvm install

echo "  Installing/upgrading global npm packages..."
GLOBAL_NPM_PACKAGES=(
  npm
  yarn
)
npm install -g ${GLOBAL_NPM_PACKAGES[@]}

exit 0
