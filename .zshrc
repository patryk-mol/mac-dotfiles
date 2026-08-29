# Load Homebrew env
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load seperated config files
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

# Python venv
source ~/.venv/bin/activate

# Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/pmol/.lmstudio/bin"
# End of LM Studio CLI section

