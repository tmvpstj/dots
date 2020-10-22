export XDG_CONFIG_HOME="$HOME/etc/"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/var/cache"

export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/etc/}x/xauth"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/etc/}x/xinitrc"

export PATH=$PATH:"$HOME/bin"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="vifmrun"
export IMGVIEWER="feh"
export VIDPLAYER="mpv"
export MANPAGER="less"

export CPR_LIB=~/etc/cpr/hokusai
cpr revive
