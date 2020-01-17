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
# yarn global add react-native-cli
# yarn global add react-native-git-upgrade
# yarn global add create-react-app
# yarn global add create-react-native-app

# Sync files from lastpass
# sh lastpass-pull.sh

# Set up symlinks
sh symlinks.sh

# Install Android SDK for React Native development
# sdkmanager --verbose "tools" "platform-tools" "platforms;android-23" "build-tools;23.0.1" "build-tools;25.0.2" "add-ons;addon-google_apis-google-23" "system-images;android-23;default;x86" "system-images;android-23;default;x86_64" "system-images;android-23;google_apis;x86" "system-images;android-23;google_apis;x86_64" "extras;android;m2repository" "extras;google;google_play_services" "extras;google;m2repository"

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
