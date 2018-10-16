#!/bin/bash

# Assumes you probably used git to pull down this repo. Doesn't assume homebrew is already installed.
# If you git wasn't already installed and you got this repo some other way. The homebrew installation
# (first step in this script) should also install git for you as well.

# Might be needed..? Not sure yet
#xcode-select --install

echo "Installing Homebrew.."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing applications via Brewfile.."
brew bundle install --verbose

# https://github.com/robbyrussell/oh-my-zsh/issues/5873
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"

# call script to set up symbolic links
./symlink_setup.sh