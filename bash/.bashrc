# History settings
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Terminal settings
shopt -s checkwinsize
shopt -s globstar

# Git branch for prompt (shows detached HEAD as short hash)
__ps1_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
        || branch=$(git rev-parse --short HEAD 2>/dev/null) \
        || return
    echo " ($branch)"
}

PS1='\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0;33m\]$(__ps1_git_branch)\[\e[0m\] ❯ '

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
