set -o nounset
COMPLETIONS_DIR="$ZSH_CUSTOM/completions"

mkdir "$COMPLETIONS_DIR"
poetry completions zsh > "$COMPLETIONS_DIR/_poetry"
unset COMPLETIONS_DIR
