#!/usr/bin/env bash

file=$"$HOME/Documents/images/screenshots/screenshot-$(date --rfc-3339='seconds').png"

if [[ $1 == '-g' ]]; then
	slurp | grim -g - - | tee >(pngquant -  > "$file") | tesseract stdin stdout | wl-copy
else
	grim - | tee >(pngquant -  > "$file") | tesseract stdin stdout | wl-copy
fi

notify-send --expire-time=1000 -a "Screenshot" "Screenshot saved and OCR copied."
