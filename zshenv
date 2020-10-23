export XDG_CONFIG_HOME="$HOME/etc/"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/var/cache"

export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/etc/}x/xauth"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/etc/}x/xinitrc"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/etc/}zsh"
