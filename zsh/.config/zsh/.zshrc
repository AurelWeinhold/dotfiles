# more history
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=$XDG_CACHE_HOME/zsh/hist
setopt EXTENDED_HISTORY
setopt share_history

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
