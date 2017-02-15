#!/bin/bash

# Install Homebrew
if [ ! -f "`which brew`" ]; then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install RVM
if [ ! -f "`which rvm`" ]; then
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# Install applications and packages
brew bundle --verbose --no-upgrade

# Post-brew
brew link qt55 --force
mkdir -p ~/.nvm
# Install the LastPass binary
# open /usr/local/Caskroom/lastpass/latest/LastPass\ Installer.app/

# Install Bundler
if [ ! -f "`which bundle`" ]; then
  gem install bundler
fi

# Install global Ruby gems
bundle

# Install npm packages
yarn global add react-native-cli

# Sync files from lastpass
sh lastpass-pull.sh

# http://stackoverflow.com/a/9107028
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_ARCHIVE_DIR=$(echo $DOTFILES_DIR | sed "s|dotfiles|old-dotfiles|")

SYMLINKS_DIR=$DOTFILES_DIR/symlinks
SCREENSHOTS_DIR=~/Desktop/screenshots

# Symlink files
for name in $(ls -a $SYMLINKS_DIR); do
  # Skip . and ..
  if [[ $name =~ ^..?$ ]]; then
    continue
  fi

  target=~/$name

  # If there's already a file there, archive it.
  if [[ -e "$target" ]]; then
    # The -f flag to `ln` does not work as expected when the existing
    # link is a folder. Instead of replacing it, the new link is created
    # inside the existing link's folder. To prevent that, we just delete the
    # existing symlink.
    if [[ -L "$target" ]]; then
      rm $target

    # If the file is already there and it's not a symlink, archive it.
    else
      mkdir -p $DOTFILES_ARCHIVE_DIR
      mv $target $DOTFILES_ARCHIVE_DIR
    fi
  fi

  ln -sfv $SYMLINKS_DIR/$name $target
done

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Save screenshots to the desktop
mkdir -p $SCREENSHOTS_DIR
defaults write com.apple.screencapture location $SCREENSHOTS_DIR

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
