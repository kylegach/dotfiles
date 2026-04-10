#!/bin/zsh

echo "✳️   Installing/upgrading node..."
n lts

echo "📦  Installing/upgrading global npm packages..."
GLOBAL_NPM_PACKAGES=(
  npm
  yarn
)
npm install -g ${GLOBAL_NPM_PACKAGES[@]}

echo "✅  Node and packages done."
exit 0