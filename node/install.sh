#!/bin/sh

echo "  Checking for zsh-nvm..."
if [[ -a ~/.zsh-nvm ]]
then
  echo "  Found zsh-nvm, upgrading..."
  nvm upgrade
else
  echo "  Installing zsh-nvm..."
  git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm 
fi

# We need to source ~/.zshrc when we're done, to make `nvm` available
reload!

echo "  Installing node..."
nvm install node
nvm use node

echo "  Installing/upgrading global npm packages..."
GLOBAL_NPM_PACKAGES=(
  npm
)
npm install -g ${GLOBAL_NPM_PACKAGES[@]}`

exit 0
