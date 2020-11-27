# decent prompt, not mine
# taken from https://github.com/kiedtl/dotfiles
# doesnt work with zsh in its current state

bind '^L=clear-screen'
bind -m ^U='^[0^K'

prompt() {
    mypwd=$(printf "$PWD" | \
        sed "s|$HOME|~|g")
    if [ $mypwd != "~" ]; then
        mypwd="$(basename ${mypwd%/*})/$(basename ${mypwd})"
    fi

    # wrap nonprintables for mksh
    printf '\1\r\1'

    # print '%' just in case last command didn't print a newline
    # then, print a bunch of spaces if a newline was output, then
    # the spaces will stay on a line and we can output a carriage
    # return to get back to the start of the line. otherwise,
    # the spaces will wrap to the next line, where we can safely
    # carriage return to the start of the line and print out prompt.
    # this hack prevents out prompt from being messed up by some
    # idiotic programs that don't print their newlines.
    sz=$((COLUMNS-2))
    printf "\1\033[7m%%\033[0m%-${sz}s\1" \
        " "

    # print a carriage return and change window title
    printf '\r\1\033]0;%s\a\1' "$USER@$(hostname):$mypwd"

    # print path
    printf '\1\033[31m\1%s\1\033[0m\1' "$mypwd"

    if [ "$(whoami)" = "root" ]
    then
        printf ' %s' "#"
    else
        printf ' %s' "|"
    fi

    # print a space
    printf ' '
}

export PS1="\$(prompt)"
