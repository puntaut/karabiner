#!/bin/bash

# Debugging
exec > /tmp/karabiner_script.log 2>&1
set -x

# Fix Kitty socket path
export KITTY_ENABLE_WAYLAND=0  # Disable Wayland if unused
mkdir -p /tmp/kitty-$(id -u)

# Launch logic
if /opt/homebrew/bin/kitty @ ls >/dev/null 2>&1; then
  /opt/homebrew/bin/kitty @ launch --type=tab --no-response \
    --cwd ~ \
    /opt/homebrew/bin/nvim ~/.config/karabiner/karabiner.json
else
  /opt/homebrew/bin/kitty --single-instance \
    --no-response \
    /opt/homebrew/bin/nvim ~/.config/karabiner/karabiner.json
fi
