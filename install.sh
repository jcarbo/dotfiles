#!/bin/bash

# Install Homebrew
if [ ! -f "`which brew`" ]; then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install RVM
if [ ! -f "`which rvm`" ]; then
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# http://stackoverflow.com/a/9107028
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLD_DOTFILES_DIR=$(echo $DOTFILES_DIR | sed "s|dotfiles|old-dotfiles|")

SYMLINKS_DIR=$DOTFILES_DIR/symlinks
SCREENSHOTS_DIR=~/Desktop/screenshots

# Symlink files
for name in $(ls -a $SYMLINKS_DIR); do
  # Skip . and ..
  if [[ $name =~ ^..?$ ]]; then
    continue
  fi

  ln -svF $SYMLINKS_DIR/$name ~/$name
done

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Save screenshots to the desktop
mkdir -p $SCREENSHOTS_DIR
defaults write com.apple.screencapture location $SCREENSHOTS_DIR

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
