# Home Sweet ~/: Essential Tools for the Cozy Terminal Dweller

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
    git \
    htop \
    jq \
    mutt \
    nodejs \
    pari-gp \
    ripgrep \
    taskwarrior \
    tmux \
    tree
```

### Install Neovim from sources

```
sudo apt install cmake
git clone --depth 1 -branch v0.12.0 https://github.com/neovim/neovim.git
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## Usage

To apply this configuration:
```bash
./configure.sh
```
