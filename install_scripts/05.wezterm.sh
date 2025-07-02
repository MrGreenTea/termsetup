# Install WezTerm terminal emulator via rpm-ostree (COPR nightly)
# Add WezTerm COPR repository manually (copr command doesn't work on Silverblue)
FEDORA_VERSION=$(rpm -E %fedora)
REPO_URL="https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-${FEDORA_VERSION}/wezfurlong-wezterm-nightly-fedora-${FEDORA_VERSION}.repo"
REPO_FILE="/etc/yum.repos.d/wezfurlong-wezterm-nightly.repo"

# Download and verify repository file
sudo wget -O "$REPO_FILE" "$REPO_URL"
if [ ! -f "$REPO_FILE" ]; then
    echo "Error: Failed to download WezTerm COPR repository file"
    exit 1
fi

# Install WezTerm via rpm-ostree with --apply-live for immediate availability
rpm-ostree install --apply-live wezterm