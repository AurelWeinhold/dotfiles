# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
###### PLUGINS ######
#
source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/plugins/vi-mode.zsh
###### /PLUGINS ######

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

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
