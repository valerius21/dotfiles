# PATH 
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Cargo
. "$HOME/.cargo/env"

# pass
export ANTHROPIC_API_KEY=$(pass show api/ANTHROPIC_API_KEY 2>/dev/null)
export DEEPSEEK_API_KEY=$(pass show api/DEEPSEEK_API_KEY 2>/dev/null)

# Homebrew
eval "$(command -v brew >/dev/null 2>&1 && /opt/homebrew/bin/brew shellenv)"

# Etc
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
