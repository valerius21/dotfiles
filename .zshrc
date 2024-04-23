# Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
#plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-rust"
plug "MichaelAquilina/zsh-you-should-use"
plug "chivalryq/git-alias"

# Load and initialise completion system
autoload -Uz compinit
compinit
# --- end of Zap installer


# Env
## Defaults
export EDITOR="nvim"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin:$HOME/.console-ninja/.bin"

# Tools
## Git
[ -s "$HOME/.zsh_git.zsh" ] && source "$HOME/.zsh_git.zsh"
## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
## zoxide
eval "$(zoxide init zsh)"

# Languages
## bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
## Haskell

## Java
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Etc
## Docker MacOS
export DOCKER_DEFAULT_PLATFORM="linux/amd64"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export SDKMAN_DIR="$HOME/.sdkman"
export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"

# Load the configuration
source "$HOME/.aliases.zsh"
source "$HOME/.functions.zsh"

eval "$(starship init zsh)"

[ -f "/home/valerius/.ghcup/env" ] && . "/home/valerius/.ghcup/env" # ghcup-env