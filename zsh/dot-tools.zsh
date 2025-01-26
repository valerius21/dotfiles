# ------------- zoxide
eval "$(zoxide init zsh)"

# ------------- fzf
source <(fzf --zsh)

# ------------- bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ------------- bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ------------- bob
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

# ------------- console-ninja
export PATH=~/.console-ninja/.bin:$PATH

# ------------- source ssh-agent
eval $(ssh-agent) > /dev/null

# ------------- Herd
# Run this, only when on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Herd injected NVM configuration
  export NVM_DIR="/Users/valerius/Library/Application Support/Herd/config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

  [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

  # Herd injected PHP 8.3 configuration.
  export HERD_PHP_83_INI_SCAN_DIR="/Users/valerius/Library/Application Support/Herd/config/php/83/"


  # Herd injected PHP binary.
  export PATH="/Users/valerius/Library/Application Support/Herd/bin/":$PATH
  export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
fi

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/valerius/Library/Application Support/Herd/config/php/82/"
# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/valerius/Library/Application Support/Herd/config/php/84/"


# ------------- poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit


