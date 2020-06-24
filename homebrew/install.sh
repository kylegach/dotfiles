#!/bin/sh

echo "  Checking for Homebrew..."
if test $(which brew)
then
  echo "  Found Homebrew, upgrading..."

  brew update
else
  echo "  Installing Homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "  Upgrading formulae and casks..."
brew upgrade

echo "  Installing formulae, casks, and Mac App Store apps..."
brew bundle install --file $ZSH/homebrew/Brewfile

# Remove outdated versions from the cellar.
brew cleanup

exit 0
