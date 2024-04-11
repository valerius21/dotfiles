# Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-rust"
plug "MichaelAquilina/zsh-you-should-use"

# Load and initialise completion system
autoload -Uz compinit
compinit
# --- end of Zap installer

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export PATH="$PATH:$HOME/go/bin"

# Editor
export EDITOR="nvim"

# Git
[ -s "$HOME/.zsh_git.zsh" ] && source "$HOME/.zsh_git.zsh"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export BWS_ACCESS_TOKEN=$(pass show bw/bws)
#export BW_SESSION=$(pass show bw/session)

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Docker MacOS Solutions
export DOCKER_DEFAULT_PLATFORM=linux/amd64

PATH=~/.console-ninja/.bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

eval "$(zoxide init zsh)"
source "$HOME/.aliases.zsh"
source "$HOME/.functions.zsh"
