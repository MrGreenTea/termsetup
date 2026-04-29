#!/bin/bash
# ABOUTME: Installs niri, Noctalia Shell, and companion packages via rpm-ostree
# ABOUTME: Includes the Noctalia Quickshell runtime and recommended shell utilities

# Install niri compositor, Noctalia shell, and companion packages.
# Using --apply-live for immediate availability on Silverblue.
rpm-ostree install --apply-live --idempotent \
  niri \
  noctalia-shell \
  fuzzel \
  swayidle \
  swaylock \
  brightnessctl \
  playerctl \
  cliphist \
  ImageMagick \
  ddcutil \
  wlsunset \
  evolution-data-server \
  xdg-desktop-portal \
  xwayland-satellite