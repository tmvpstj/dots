export DOAS_PROMPT=$'%u\'s password: '
export PATH="$PATH:$HOME/bin"

export XDG_CONFIG_HOME="$HOME/etc/"
export XDG_DATA_HOME="$HOME/var/share"
export XDG_CACHE_HOME="$HOME/var/cache"

export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/etc/}x/xauth"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/etc/}x/xinitrc"

export ENV="${XDG_CONFIG_HOME:-$HOME/etc/}/shrc"
export HISTFILE="${XDG_CONFIG_HOME:-$HOME/etc/}/hist"
