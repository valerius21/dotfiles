# aliases 

NEOVIM_CONFIG_DIR="$HOME/.config/nvim-kickstart/"
export EDITOR="NVIM_APPNAME=\"nvim-kickstart\" nvim"

alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias nk='NVIM_APPNAME="nvim-kickstart" nvim'
alias find="fd"
alias v="nk"
alias vv="nk ."
alias lg="lazygit"
alias ld="lazydocker"
alias kubectl="minikube kubectl --"
alias cd="z"
alias venv=setup_venv
alias ezs="$EDITOR ~/.zshrc"
alias szs="source ~/.zshrc"
alias vcfg="$EDITOR $NEOVIM_CONFIG_DIR"
alias ":r"="source ~/.zshrc"
alias ncfg="cd ~/.config/nvim/lua/user && nvim . && cd -"
alias cls="clear"
alias ollamas="export OLLAMA_ORIGINS='*' && ollama serve"
alias kubectl="minikube kubectl --"
alias kc="minikube kubectl --"
alias kcaf="minikube kubectl -- apply -f"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
