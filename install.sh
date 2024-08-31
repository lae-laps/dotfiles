#!/usr/bin/env bash

# Configureation script for Arch

# CONFIG
CONFIGURE_I3=true
CONFIGURE_VIM=true
CONFIGURE_KITTY=true
CONFIGURE_POLYBAR=true
CONFIGURE_PICOM=true

DOTFILES_PATH=~/dotfiles

# Exit the script if any command returns a non-zero status
set -e

# DEFINITIONS

configure_vim() {
    echo "Configuring Vim..."

	mv $DOTFILES_PATH/.vimrc ~/.vimrc

	sudo pacman -S --needed --noconfirm vim fzf

	# install  vim-plugged
	if [ ! -f ~/.vim/autoload/plug.vim ]; then
		echo "configuring vim-plug..."
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

	# create undodir
	mkdir -p ~/.vim/undodir

	# install plugins
	echo "configuring Vim plugins..."
	vim +Plugconfigure +qall

	# installing coc autocomplete
	vim +'CocInstall coc-pyright coc-clangd coc-vimlsp coc-json coc-rust-analyzer coc-yaml coc-sh coc-texlab coc-snippets' +qall

    echo "Vim configureed successfully."
}

# Function to configure i3
configure_i3() {
    echo "Configuring i3..."
	
	mv $DOTFILES_PATH/.config/i3/config ~/.config/i3/config

    sudo pacman -S --needed --noconfirm i3
    # Additional i3 configuration can go here
    echo "i3 configureed successfully."
}

# Function to configure Kitty
configure_kitty() {
    echo "Configuring Kitty..."

	mv $DOTFILES_PATH/.config/kitty.conf ~/.config/kitty/kitty.conf

    sudo pacman -S --needed --noconfirm kitty
    # Additional Kitty configuration can go here
    echo "Kitty configureed successfully."
}

configure_polybar() {
    echo "Configuring polybar..."
	
	mv $DOTFILES_PATH/.config/polybar/* ~/.config/polybar/

    sudo pacman -S --needed --noconfirm polybar
    # Additional Kitty configuration can go here
    echo "Polybar configureed successfully."
}

configure_picom() {
    echo "Configuring Picom..."
	
	mv $DOTFILES_PATH/.config/picom/picom.conf ~/.config/picom/picom.conf

    sudo pacman -S --needed --noconfirm picom
    # Additional Kitty configuration can go here
    echo "Picom configureed successfully."
}

# MAIN

main() {
	# exit if running as root
	if [ "$EUID" -eq 0 ]; then
		echo "Do not run as root"
		exit 1
	fi

	# check if dotfiles path exists
	if [ ! -e "$DOTFILES_PATH" ]; then
		echo "Error: $DOTFILES_PATH does not exist"
		exit 1
	fi

	# INSTALL
	
	echo "		User     : $USER"
	echo " "
	echo "		i3       : $CONFIGURE_I3"
	echo "		Vim      : $CONFIGURE_I3"
	echo "		Kitty    : $CONFIGURE_I3"
	echo "		Polybar  : $CONFIGURE_I3"
	echo "		Picom    : $CONFIGURE_I3"
	echo " 		Dotfiles : $DOTFILES_PATH"
	echo " "
	echo " + Press any key to continue..."

	read -n 1 -s

	if [ "$CONFIGURE_VIM" = true ]; then
		configure_vim
	fi

	if [ "$CONFIGURE_I3" = true ]; then
		configure_i3
	fi

	if [ "$CONFIGURE_KITTY" = true ]; then
		configure_kitty
	fi

	if [ "$CONFIGURE_PICOM" = true ]; then
		configure_picom
	fi

	echo " ALL OK! "

}

# RUN
main
