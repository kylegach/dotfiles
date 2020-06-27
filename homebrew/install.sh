#!/bin/sh

echo ""
echo "🔎  Checking for Homebrew..."
if ! [[ $(which brew) ]]
then
  echo "🍺  Installing Homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "🍺  Found Homebrew, upgrading..."

  brew update
fi

echo "⤴️   Upgrading formulae and casks..."
brew upgrade

echo "🆕  Installing formulae, casks, and Mac App Store apps..."
brew bundle install --file $ZSH/homebrew/Brewfile

# Remove outdated versions from the cellar.
brew cleanup

echo "✅  Homebrew done."
exit 0
