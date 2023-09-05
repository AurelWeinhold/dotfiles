#!/usr/bin/env sh

# configuration
target="$HOME"


function pre()
{
	# pull all submodules
	git submodule update --init --recursive

	# create directories that might also be used by other programs
	[ -d "$target/.config" ] || mkdir -p "$target/.config"
	[ -d "$target/.local/share" ] || mkdir -p "$target/.local/share"
	[ -d "$target/.local/bin" ] || mkdir -p "$target/.local/bin"
}

function post()
{
	echo "Don't forget to check for any specific instructions in any of the applications submodules readme.md!"
}

function install_all()
{
	stow --restow --target="$target" --ignore="readme.md" \
		alacritty \
		nvim \
		scripts \
		hypr \
		waybar \
		zathura \
		zsh
}


pre
install_all
post
