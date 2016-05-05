#!/bin/sh
#
# install
#
# Homebrew, brews, casks, and dot files oh my!

echo "› rerolling"

# Install homebrew
if test ! $(which brew)
then
  echo "› install homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Upgrade homebrew
echo "› brew update"
brew update

# Tab additional formulae
echo "› tap some formulae"
tap "thoughtbot/formulae"
tap "homebrew/bundle"
tap "homebrew/services"

# Brew
echo "› making brew"

# Unix
brew "git"
brew "rcm"

# Heroku
brew "heroku-toolbelt"
brew "parity"

# Git
brew "gitsh"

# Programming languages
brew "node"
brew "rbenv"
brew "ruby-build"

# Databases
brew "postgres", restart_service: true
brew "redis", restart_service: true

# Casks
echo "› opening casks"

# Development
cask "atom"
cask "firefox"
cask "google-chrome"
cask "iterm2"
cask "slack"

# Music
cask "spotify"
cask "spotify-notifications"

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
