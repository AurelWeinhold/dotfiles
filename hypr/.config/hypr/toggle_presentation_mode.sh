#!/usr/bin/env sh

# toggle waybar
killall -SIGUSR1 waybar

# toggle gaps, border, and rounding
if hyprctl getoption general:gaps_in | grep "0 0 0 0"; then
	hyprctl --batch "\
		keyword general:gaps_in 2;\
		keyword general:gaps_out 4;\
		keyword general:border_size 2;\
		keyword decoration:rounding 16;\
		"
else
	hyprctl --batch "\
		keyword general:gaps_in 0;\
		keyword general:gaps_out 0;\
		keyword general:border_size 0;\
		keyword decoration:rounding 0;\
		"
fi
