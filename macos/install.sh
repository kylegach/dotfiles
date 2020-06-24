#!/bin/sh

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.
echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

echo "  Checking for mackup..."
if test $(which mackup)
  then
    echo "  Restoring third-party app preferences..."
    mackup restore
  else
    echo "  mackup not found; no third-party preferences restored"
fi
