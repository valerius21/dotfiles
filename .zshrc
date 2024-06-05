# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

source ~/.aliases.zsh
source ~/.functions.zsh
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# bun completions
[ -s "/home/valerius/.bun/_bun" ] && source "/home/valerius/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# if ~/.zshenv file exists, load it
if [ -f ~/.zshenv ]; then
  source ~/.zshenv
fi

# source ssh-agent
eval $(ssh-agent) > /dev/null
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

