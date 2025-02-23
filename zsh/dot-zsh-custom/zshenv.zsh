# Cargo
. "$HOME/.cargo/env"

# pass
export ANTHROPIC_API_KEY=$(pass show api/ANTHROPIC_API_KEY 2>/dev/null)
export DEEPSEEK_API_KEY=$(pass show api/DEEPSEEK_API_KEY 2>/dev/null)

