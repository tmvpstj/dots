export PS1="%F{yellow}👻%f "
export RPS1="%F{yellow}%c%f "
export SUDO_PROMPT=$'%u\'s password: '
# export SUDO_PROMPT=$pass for[255;255;255m %u\033[0m '

setopt autocd
setopt share_history
setopt hist_ignore_all_dups

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${ZDOTDIR}/.history"

unsetopt beep

setopt completealiases
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # Case-insensitive completion
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files
REPORTTIME=1

bindkey -v

setopt PROMPT_SUBST
