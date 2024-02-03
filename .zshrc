# Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-rust"
#plug "wintermi/zsh-starship"
plug "MichaelAquilina/zsh-you-should-use"
plug "chivalryq/git-alias"

# Load and initialise completion system
autoload -Uz compinit
compinit
# --- end of Zap installer

# pnpm
export PNPM_HOME="/Users/valerius/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
# bun completions
[ -s "/Users/valerius/.bun/_bun" ] && source "/Users/valerius/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export PATH="$PATH:$HOME/go/bin"

# Editor
export EDITOR="nvim"
alias v="nvim"
alias vv="nvim ."

# Git
alias lg="lazygit"
[ -s "/Users/valerius/.zsh_git.zsh" ] && source "/Users/valerius/.zsh_git.zsh"

# Docker
alias ld="lazydocker"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# aliases 
alias ncfg="cd ~/.config/nvim/lua/user && nvim . && cd -"
alias kubectl="minikube kubectl --"
alias cls="clear"

# # k8s
# export K8S_API_SERVER="https://127.0.0.1:51238"
# export K8S_TOKEN="$(kubectl create token default)"
alias s="kitty +kitten ssh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export BWS_ACCESS_TOKEN=$(pass show bw/bws)
#export BW_SESSION=$(pass show bw/session)

# Kill Port
kill_port() {
  echo "Killing multiple processes is not supported."
  if [ -z "$1" ]; then
    echo "Usage: kill_port <port_number>"
    return 1
  fi

  local port="$1"
  local pid

  # Check if lsof is available
  if ! command -v lsof > /dev/null; then
    echo "Error: lsof command is not installed."
    return 1
  fi

  # Find the process using the specified port
  pid=$(lsof -t -i :$port)

  if [ -z "$pid" ]; then
    echo "No process found on port $port."
    return 1
  fi

  # Kill the process
  kill -9 "$pid"
  echo "Killed process $pid running on port $port."
}

# opam configuration
[[ ! -r /Users/valerius/.opam/opam-init/init.zsh ]] || source /Users/valerius/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/Users/valerius/.ghcup/env" ] && source "/Users/valerius/.ghcup/env" # ghcup-env

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Docker ...
export DOCKER_DEFAULT_PLATFORM=linux/amd64

