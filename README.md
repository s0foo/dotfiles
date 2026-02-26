# Environment Configuration

The following environment configuration is based on [Debian 13
(Trixie)](https://www.debian.org/releases/trixie/).

## Prerequisite

Enable `sudo` for your username:
```bash
su -
apt install sudo
adduser <username> sudo
```

## Packages List

```bash
sudo apt install \
    emacs \
    fzf \
    git \
    htop \
    mutt \
    neovim \
    pari-gp \
    ripgrep \
    taskwarrior \
    tmux
```

## Usage

To apply this configuration:
```bash
./configure.sh
```
