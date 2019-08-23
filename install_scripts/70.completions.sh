ZSH_CUSTOM=~/.oh-my-zsh/custom
export PATH="/home/jonas/.local/bin:$PATH"

set -o nounset
COMPLETIONS_DIR="$ZSH_CUSTOM/completions"

mkdir "$COMPLETIONS_DIR" -p
poetry completions zsh > "$COMPLETIONS_DIR/_poetry"
unset COMPLETIONS_DIR

autoload -U compinit && compinit
