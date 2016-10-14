#!/bin/sh
#
# install
#
# Homebrew, brews, casks, and dot files oh my!

echo "› rerolling"

echo "› make ~/Applications"
mkdir -p ~/Applications

# Install homebrew
if test ! $(which brew)
then
  echo "› install homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
echo "› brew update"
brew update

# Tab additional formulae
echo "› tap some formulae"
brew tap "thoughtbot/formulae"
brew tap "homebrew/bundle"
brew tap "homebrew/services"
brew tap "caskroom/cask"

# Brew
echo "› making brew"

# Git
brew install "gitsh"

# Programming languages
brew install "yarn"

# Casks
echo "› opening casks"

# Development
brew cask install "atom"
brew cask install "firefox"
brew cask install "google-chrome"
brew cask install "iterm2"
brew cask install "slack"

# Music
brew cask install "spotify"
brew cask install "spotify-notifications"

# Backup dotfiles
echo "› dotfile backup"
mv ~/.bash_profile ~/.bash_profile_backup
mv ~/.bashrc ~/.bashrc_backup
mv ~/.gitconfig ~/.gitconfig_backup

# New dotfiles
echo "› new dotfiles"
cp ./dotfiles/.bash_profile ~/
cp ./dotfiles/.bashrc ~/
cp ./dotfiles/.gitconfig ~/

# Done
echo "› fin."
