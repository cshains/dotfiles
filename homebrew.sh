#!/usr/bin/env bash

# Check for Homebrew
if test ! $(which brew)
then
printf '\033[0;34m%s\033[0m\n' "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  printf '\033[0;34m%s\033[0m\n' "Homebrew already installed. Updating Homebrew..."
  # Make sure we’re using the latest Homebrew
  brew update
fi

printf '\033[0;34m%s\033[0m\n' "Installing Homebrew formulas..."

# Upgrade any already-installed formulae
brew upgrade

# Install ZSH shell
brew install zsh

# Install GIT
brew install git

# Install HUB (a GitHub git wrapper)
# brew install hub

# Install Ruby Environment Management
brew install rbenv

# Install Ruby Version Plugin for rbenv
brew install ruby-build

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install grc
# brew install grc

# Install wget
brew install wget

# Install node
brew install node

# Install Mackup
# brew install mackup

# Install Homebrew Cask for installing Mac apps.
brew tap phinze/homebrew-cask
brew install brew-cask

# Install Vagrant
brew cask install vagrant

# Install VirtualBox
brew cask install virtualbox

# Docker
brew cask install dockertoolbox

# sshuttle
brew install sshuttle

printf '\033[0;34m%s\033[0m\n' "Cleaning Homebrew Cellar..."

# Remove outdated versions from the cellar
brew cleanup
