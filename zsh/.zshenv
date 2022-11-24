# XDG homes
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# environmental variables
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export PDF_READER="zathura"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/hist"

# bash
export BASH_DOT_DIR="$XDG_CONFIG_HOME/bash"

# gtk2
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# taskwarrior
export TASKRC="$XDG_CONFIG_HOME/taskwarrior/taskrc"

# less
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# mysql
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"

# ruby gems
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# recoll
export RECOLL_CONFDIR="$XDG_CONFIG_HOME/recoll"
