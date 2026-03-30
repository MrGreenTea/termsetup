#!/bin/bash
# ABOUTME: Installs niri compositor and companion packages via rpm-ostree
# ABOUTME: Includes waybar, fuzzel, mako, swaybg, swayidle, swaylock, and utilities

# Install niri compositor and companion packages
# Using --apply-live for immediate availability on Silverblue
rpm-ostree install --apply-live \
  niri \
  waybar \
  fuzzel \
  mako \
  swaybg \
  swayidle \
  swaylock \
  brightnessctl \
  playerctl \
  xwayland-satellite