#!/usr/bin/env sh

# configuration
target="$HOME"

stow --restow --target="$target" --ignore="readme.md" \
	nvim \
	zsh
