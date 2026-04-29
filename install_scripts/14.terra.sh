#!/bin/bash
# ABOUTME: Configures the Terra Fedora repository used for Noctalia packages
# ABOUTME: Terra provides noctalia-shell and the noctalia-qs Quickshell runtime

releasever="$(rpm -E %fedora)"
repo_file="/etc/yum.repos.d/terra.repo"

# Terra's documented Fedora install path uses a transient DNF repo to install
# terra-release. On an rpm-ostree system we only need the repo definition for
# subsequent rpm-ostree package layering.
sudo install -d -m 0755 /etc/yum.repos.d
sudo tee "$repo_file" >/dev/null <<EOF
[terra]
name=Terra Fedora \$releasever
baseurl=https://repos.fyralabs.com/terra\$releasever
metadata_expire=6h
type=rpm
enabled=1
gpgcheck=0
repo_gpgcheck=0

[terra-source]
name=Terra Fedora \$releasever - Source
baseurl=https://repos.fyralabs.com/terra\$releasever-source
metadata_expire=6h
type=rpm
enabled=0
gpgcheck=0
repo_gpgcheck=0
EOF

echo "Terra repository configured for Fedora $releasever at $repo_file."
