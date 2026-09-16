# Home Sweet ~/: Essential Tools for the Cozy Terminal Dweller

Personal dotfiles and setup scripts, built for [Debian 13 (Trixie)](https://www.debian.org/releases/trixie/).

## Contents

| Path | Description |
|------|-------------|
| `bash/` | `.bashrc` and `.bash_aliases` |
| `git/` | `.gitconfig` (aliases, editor) |
| `tmux/` | `tmux.conf` |
| `nvim/` | Neovim config (Lua, lazy.nvim plugins) |
| `claude/` | Claude Code settings and status line script |
| `configure.sh` | Installs packages, deploys dotfiles, builds nvim/tmux from source |
| `encrypt_archive.sh` | Tars and GPG-encrypts a set of paths |

## Prerequisite

Enable `sudo` for your user:
```bash
su -
apt install sudo
adduser <username> sudo
```

## Usage

### `configure.sh`

```bash
./configure.sh <command> [args]
```

| Command | Description |
|---------|-------------|
| `packages` | Install regular packages via `apt` |
| `configure` | Deploy dotfiles (bash, git, tmux, nvim) to `$HOME` |
| `nvim <tag>` | Build and install Neovim from source at git tag `<tag>` |
| `tmux <tag>` | Build and install tmux from source at git tag `<tag>` |

Example:
```bash
./configure.sh packages
./configure.sh configure
./configure.sh nvim v0.10.2
./configure.sh tmux 3.5a
```

> Note: `claude/` is not deployed by `configure.sh` and must be copied to `~/.claude/` manually if wanted.

### `encrypt_archive.sh`

Tar up one or more files/folders and encrypt the archive with AES-256 via `gpg`. Output is timestamped: `archive_YYYYmmdd_HHMMSS.tar.gz.gpg`.

```bash
./encrypt_archive.sh path1 [path2 ...]
```

Requires `gpg` to be installed; refuses to overwrite an existing output file.
