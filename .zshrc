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
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

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
[ -s "$HOME/.zsh_git.zsh" ] && source "$HOME/.zsh_git.zsh"

# Docker
alias ld="lazydocker"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# aliases 
alias ncfg="cd ~/.config/nvim/lua/user && nvim . && cd -"
alias kubectl="minikube kubectl --"
alias cls="clear"

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
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Docker ...
export DOCKER_DEFAULT_PLATFORM=linux/amd64

eval "$(zoxide init zsh)"
alias cd="z"

PATH=~/.console-ninja/.bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk

function setup_venv() {
    if [[ ! -d .venv ]]; then 
        echo "creating .venv"
        python3 -m venv .venv
        if [[ ! -f ./.gitignore ]] || ! grep -q "^venv/$" ./.gitignore; then
            curl -L "https://www.gitignore.io/api/python" > ./.gitignore
        fi
        if [[ -f ./requirements.txt ]]; then 
            echo "requirements.txt found, installing"
            ./.venv/bin/pip install -r ./requirements.txt
        fi
    fi
    source ./.venv/bin/activate
}
alias venv=setup_venv

alias ezs="$EDITOR ~/.zshrc"
alias ":r"="source ~/.zshrc"
alias szs="source ~/.zshrc"
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
alias  vcfg="$EDITOR ~/.config/nvim/"
