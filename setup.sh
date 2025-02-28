#!/bin/bash

#TODO: put any other missing software installation steps here
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo softwareupdate --install-rosetta

brew bundle install

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sS https://starship.rs/install.sh | sh

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

curl -s "https://get.sdkman.io" | bash

brew install --cask font-meslo-lg-nerd-font

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

rm -rf ~/.zshenv
ln -s ~/.dotfiles/.zshenv ~/.zshenv

rm -rf ~/Library/Application\ Support/Code/User/settings.json
rm -rf ~/Library/Application\ Support/Code/Cursor/settings.json
ln -s ~/.dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/settings.json ~/Library/Application\ Support/Cusor/User/settings.json

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

starship preset no-runtime-versions -o ~/.config/starship.toml
