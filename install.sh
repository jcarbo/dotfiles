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
brew link imagemagick@6 --force
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

# Set up symlinks
sh symlinks.sh

# Install Android SDK for React Native development
# android --verbose update sdk --no-ui --all --filter tools,platform-tools,build-tools-23.0.3,addon-google_apis-google-23,sys-img-x86-android-23,sys-img-x86_64-android-23,sys-img-x86-google_apis-23,sys-img-x86_64-google_apis-23,extra-android-m2repository

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Save screenshots to the desktop
SCREENSHOTS_DIR=~/Desktop/screenshots

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
