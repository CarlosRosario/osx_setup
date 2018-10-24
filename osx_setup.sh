#!/bin/bash

# Assumes you probably used git to pull down this repo. Doesn't assume homebrew is already installed.
# If you git wasn't already installed and you got this repo some other way. The homebrew installation
# (first step in this script) should also install git for you as well.

export DOTFILES_PATH="${HOME}/.osx_setup/dotfiles"

# Might be needed..? Not sure yet
#xcode-select --install

echo "Installing Homebrew.."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# https://superuser.com/questions/1066743/how-to-get-bash-style-autocompletion-in-zsh-for-git-command
echo "Installing git autocompletions.."
git_version=$(git --version | cut -d' ' -f3)
curl https://raw.githubusercontent.com/zsh-users/zsh/master/Completion/Unix/Command/_git \
     > "/usr/local/Cellar/git/${git_version}/share/zsh/site-functions/_git"

echo "Installing applications via Brewfile.."
brew bundle install --verbose

# https://github.com/robbyrussell/oh-my-zsh/issues/5873
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"

echo "Installing sdkman"
# I have to use my own copy of the sdkman install script because the script automatically edits the .zshrc which I DO NOT want it to do.
# So i commented out that piece in my own copy of sdk_install.sh
# The script comes from https://get.sdkman.io
$DOTFILES_PATH/sdkman/sdk_install.sh

echo "Installing Java, Maven, Springboot"
$DOTFILES_PATH/sdkman/install.sh

echo "Installing nodejs"
mkdir $HOME/.nvm
nvm install node --lts

echo "Installing Angular CLI"
npm install -g @angular/cli@latest

echo "Setting up symbolic links for dotfiles"
./symlink_setup.sh