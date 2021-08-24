#!/bin/bash

#TODO: put any other missing software installation steps here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm -rf ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

rm -rf ~/.bash_profile
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

rm -rf ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

rm -rf ~/.tmux
ln -s ~/.dotfiles/.tmux ~/.tmux

rm -rf ~/.tmux-powerlinerc
ln -s ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc

rm -rf ~/.vim
ln -s ~/.dotfiles/.vim ~/.vim

rm -rf ~/.vimrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc

rm -rf ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

rm -rf ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#git clone https://github.com/erikw/tmux-powerline.git ~/.tmux

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#curl -s "https://get.sdkman.io" | bash
