# Get latest fzf release URL
download_url=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest \
 | grep "browser_download_url.*linux_amd64" \
 | cut -d : -f 2,3 \
 | tr -d '"' \
 | tr -d ' ')

if [ -z "$download_url" ]; then
    echo "Error: Failed to get fzf download URL from GitHub API"
    exit 1
fi

# Download fzf
if ! wget --output-document="/tmp/fzf.tar" "$download_url" --no-verbose; then
    echo "Error: Failed to download fzf"
    exit 1
fi

# Create ~/.local/bin if it doesn't exist
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir "$HOME/.local/bin"
fi

# Extract fzf binary
if ! tar -xf /tmp/fzf.tar --directory="$HOME/.local/bin" fzf; then
    echo "Error: Failed to extract fzf binary"
    exit 1
fi

# Verify fzf was installed correctly
if [ ! -x "$HOME/.local/bin/fzf" ]; then
    echo "Error: fzf binary not found or not executable"
    exit 1
fi

echo "fzf installed successfully to ~/.local/bin/fzf"
