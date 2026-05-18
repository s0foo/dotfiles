#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

usage() {
    echo "Usage: $0 <command> [args]"
    echo ""
    echo "Commands:"
    echo "  configure        Deploy dotfiles to \$HOME"
    echo "  nvim <tag>       Build and install Neovim from source"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

command="$1"
shift

case "$command" in
    configure)
        echo "Deploying dotfiles from $DOTFILES_DIR..."

        mkdir -p "$HOME/.config/tmux" "$HOME/.config/nvim"

        echo "  bash"
        cp "$DOTFILES_DIR/bash/.bashrc"       "$HOME/.bashrc"
        cp "$DOTFILES_DIR/bash/.bash_aliases" "$HOME/.bash_aliases"

        echo "  git"
        cp "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

        echo "  tmux"
        cp -r "$DOTFILES_DIR/tmux/." "$HOME/.config/tmux/"

        echo "  nvim"
        cp -r "$DOTFILES_DIR/nvim/." "$HOME/.config/nvim/"

        echo "Done."
        ;;
    nvim)
        if [ $# -ne 1 ]; then
            echo "Usage: $0 nvim <tag>" >&2
            exit 1
        fi
        TAG="$1"
        BUILD_DIR="/tmp/nvim"

        cleanup() {
            rm -rf "$BUILD_DIR"
        }
        trap cleanup EXIT

        rm -rf "$BUILD_DIR"
        git clone --depth 1 -b "$TAG" https://github.com/neovim/neovim.git "$BUILD_DIR"
        make -C "$BUILD_DIR" CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make -C "$BUILD_DIR" install
        ;;
    *)
        echo "Unknown command: $command" >&2
        usage
        ;;
esac
