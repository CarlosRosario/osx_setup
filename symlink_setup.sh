#!/bin/bash

# Thought about using a loop to handle all the symbolic links, but
# that would require all my dotfiles to live in one directory. 
# or hardcode some array that has the parent directory + dotfile name
# and then loop through that array to create the symbolic links.
# Which I can do, but for now I don't see the need and I'd rather
# have the files in specific subdirectories.

dotfiles_path="${HOME}/.osx_setup/dotfiles"

ln -svf ${dotfiles_path}/git/.gitconfig $HOME
ln -svf ${dotfiles_path}/zsh/.zshrc $HOME

# Set up symlinks for docker tab completion within zsh
etc=/Applications/Docker.app/Contents/Resources/etc
ln -svf $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -svf $etc/docker-machine.zsh-completion /usr/local/share/zsh/site-functions/_docker-machine
ln -svf $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose