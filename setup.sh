#!/bin/bash

if [ "$(uname)" = "Darwin" ]; then
	echo "Skipping - MacOS"
	exit 0
fi

# check for sudo
if [ "$EUID" -ne 0 ]; then
	echo "This script requiressudo privileges."
	exit 1
fi

## Check if on Ubuntu

if command -v apt-get &>/dev/null; then
	echo "apt is available"
	sudo apt update && sudo apt upgrade -y
else
	echo "not ubuntu/debian. exiting..."
	exit 1
fi

# install dependencies
sudo apt install -y curl wget git build-essential tmux fd-find zsh fish stow

# Github SSH Keys
read -p "Do you want to import SSH keys from  github.com/valerius21? [Y/n]: " answer
if [ -z "$answer" ] || [ "${answer,,}" = "y" ]; then
	echo "Getting Keys..."
	curl_output="$(curl -sSL https://github.com/valerius21.keys)"
	auth_keys_file="$HOME/.ssh/authorized_keys"
	if [ -f $auth_keys_file ]; then
		# combine outputs
		echo "$curl_output" >>$auth_keys_file
		tmp_file=$(mktemp)
		sort -u $auth_keys_file >$tmp_file
		cp $tmp_file $auth_keys_file
		rm $tmp_file
	else
		mkdir $HOME/.ssh
		echo "$curl_output" >$auth_keys_file
	fi
else
	echo "Continuing..."
fi

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install bob-nvim
source ~/.bashrc
cargo install bob-nvim

# install nvim
bob install nightly
bob use nightly

# install alacritty

# TODO: add stow and dotfiles download
