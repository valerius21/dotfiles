# Dotfiles

this folder mappes to the home directory.

## Requirements

Minimum `stow` version should be [`2.4.0`](https://github.com/aspiers/stow/issues/33).

## Mapping the dotfiles

`stow --dotfiles <folder>`

## Delete the dotfiles

`stow --dotfiles -D <folder>`

## Refresh the dotfiles

`stow -R <folder>`

## TODO

- [ ]  replace `pass` with `bw`

## Tools

If, in the future, I decide to use home-manager, it'd be handy to have this list

### Oh my zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Packages

```bash
curl
exa
fd
ffmpeg
fzf
ghostty
git
git-delta
gitleaks
go
jq
lazygit
lazysql
miniserve
neovim
nodejs # or nvm, or bun
pre-commit
python3-pipenv # or python3-venv
ripgrep
stow
uv
wget
yazi
zsh
```

### Links

- [zap](https://www.zapzsh.com/)
- [rustup.rs](https://rustup.rs/)
