#!/bin/zsh

# We must source nvm before using it, which occurs either
# [1] after installing, or
# [2] before upgrading

echo ""
echo "🔎  Checking for zsh-nvm..."

DIR=~/.zsh-nvm
if ! [[ -a $DIR ]]
then
  echo "🎚  Installing zsh-nvm..."
  git clone https://github.com/lukechilds/zsh-nvm.git $DIR
  source ~/.zsh-nvm/zsh-nvm.plugin.zsh # [1]
else
  echo "⤴️   Found zsh-nvm, upgrading..."
  source ~/.zsh-nvm/zsh-nvm.plugin.zsh # [2]
  nvm upgrade
fi

echo "✳️   Installing/upgrading node..."
nvm install

echo "📦  Installing/upgrading global npm packages..."
GLOBAL_NPM_PACKAGES=(
  npm
  yarn
)
npm install -g ${GLOBAL_NPM_PACKAGES[@]}

echo "✅  Node and packages done."
exit 0