# History settings
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Terminal settings
shopt -s checkwinsize
shopt -s globstar

PS1='user@local:\w> '

source ~/.bash_aliases

export CDPATH=$HOME:$HOME/work:$HOME/personal
export EDITOR=nvim

# WSL-specific configurations
if [ -d "/mnt/c" ]; then
    eval "$(keychain --eval id_ed25519)"
    export BROWSER="/mnt/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe"
    export DISPLAY=$(ip route list default | awk '{print $3}'):0
    export LIBGL_ALWAYS_INDIRECT=1
fi
