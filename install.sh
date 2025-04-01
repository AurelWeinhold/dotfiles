#!/usr/bin/env sh

# configuration
target="$HOME"


pre()
{
	# pull all submodules
	git submodule update --init --recursive

	# create directories that might also be used by other programs
	[ -d "$target/.config" ] || mkdir -p "$target/.config"
	[ -d "$target/.local/share" ] || mkdir -p "$target/.local/share"
	[ -d "$target/.local/bin" ] || mkdir -p "$target/.local/bin"
}

post()
{
	echo "Don't forget to check for any specific instructions in any of the applications submodules readme.md!"
}

install_cli()
{
	stow --restow --target="$target" --ignore="readme.md" \
		git \
		tmux \
		scripts \
		zsh
}

install_gui()
{
	stow --restow --target="$target" --ignore="readme.md" \
		alacritty \
		dunst \
		hypr \
		rofi \
		tridactyl \
		waybar \
		zathura
}

install_all()
{
	install_cli
	install_gui
}


pre
install_all
post
