# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# create cache directory if it doesn't exist
if [[ -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh" ]]; then
	mkdir -p $XDG_CACHE_HOME/zsh
fi

#
###### PLUGINS ######
#
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/plugins/vi-mode.zsh

# !!! Other plugins before this line !!!
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
###### /PLUGINS ######

#
###### CONFIGURATION ######
#
# shift-tab to reverse through completion list
bindkey '^[[Z' reverse-menu-complete

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+m:{[:lower:]}={[:upper:]} m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' original true
zstyle ':completion:*' special-dirs false
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# show dotfiles in completion list
_comp_options+=(globdots)

# use history-substring-search methods for going through the history
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# more history
export HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/hist
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt share_history

# Preferred editor for local and remote sessions and local manpager
# -n SSH_CONNECTION is non-empty
# -z string is empty
if [[ -n $SSH_CONNECTION || -z "$(command -v nvim)" ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
	export MANPAGER='nvim +Man!'
fi

#
### aliases ###
#

alias rf='rm -rf'						# remove folder
alias grep='grep -ni --color=always'	# nicer grep output

alias locate="locate -i"
alias term="$TERMINAL"

# neovim
if [[ -z "$(command -v nvim)" ]]; then
	alias vim='nvim'	# never use vim, instead use neovim
fi
alias vi='vim'		# never use vi instead use vim
alias im='vim'

alias open='xdg-open'	# opens files
alias cl='clear'

# ls
alias l="ls -lh --group-directories-first --sort=extension --color -Itags"
alias la="l -A"
alias o="l"
alias ö="l"
alias lö="l"

alias tree="tree -a"

# cd
alias -- -='cd -'
alias cd..='cd ..'
alias cd.="cd .."
alias cd .="cd .."

# exit
alias :wq="exit"
alias wq="exit"
alias q="exit"
alias exir="exit"
alias exi="exit"
alias exut="exit"
alias rxit="exit"

alias texc="latexmk -output-directory=build -pdf -pvc -shell-escape"

alias recoll="recoll -c $XDG_CONFIG_HOME/recoll"
alias recollindex="recollindex -c $XDG_CONFIG_HOME/recoll"

# git
alias gst="git status"
alias gc="git commit"
alias gps="git push"
alias gpl="git pull"
alias ga="git add"
alias gap="git add -p"
alias gd="git diff"
alias gl="git log"

# make
alias maek="make"
alias mak="make"
alias mek="make"

### \aliases ###

# direnv hooks to enable direnv to work only if it exists
[ direnv ] && eval "$(direnv hook zsh)"

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# function to merge pdfs using GhostScript
pdfcombine () {
	gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=${1%.*}.pdf -dBATCH ${@:2}
}

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
