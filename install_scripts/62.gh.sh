#!/bin/bash
# ABOUTME: Downloads and installs GitHub CLI (gh) to ~/.local/bin
# ABOUTME: Uses GitHub API to get latest release and extracts the binary

# Get latest gh release version
VERSION=$(curl -s https://api.github.com/repos/cli/cli/releases/latest \
    | grep '"tag_name"' \
    | sed -E 's/.*"([^"]+)".*/\1/' \
    | cut -c2-)

if [ -z "$VERSION" ]; then
    echo "Error: Failed to get gh version from GitHub API"
    exit 1
fi

echo "Installing GitHub CLI v${VERSION}..."

# Download gh tarball
download_url="https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz"
if ! wget --output-document="/tmp/gh.tar.gz" "$download_url" --no-verbose; then
    echo "Error: Failed to download gh"
    exit 1
fi

# Create ~/.local/bin if it doesn't exist
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir -p "$HOME/.local/bin"
fi

# Extract gh binary
if ! tar -xzf /tmp/gh.tar.gz -C /tmp; then
    echo "Error: Failed to extract gh tarball"
    exit 1
fi

# Copy gh binary to ~/.local/bin
if ! cp "/tmp/gh_${VERSION}_linux_amd64/bin/gh" "$HOME/.local/bin/"; then
    echo "Error: Failed to copy gh binary"
    exit 1
fi

# Make sure it's executable
chmod +x "$HOME/.local/bin/gh"

# Clean up
rm -rf "/tmp/gh.tar.gz" "/tmp/gh_${VERSION}_linux_amd64"

# Verify gh was installed correctly
if [ ! -x "$HOME/.local/bin/gh" ]; then
    echo "Error: gh binary not found or not executable"
    exit 1
fi

echo "GitHub CLI installed successfully to ~/.local/bin/gh"
echo "Version: $(~/.local/bin/gh --version)"