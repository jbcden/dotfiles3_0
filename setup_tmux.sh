#!/bin/bash

if ! [ -f ~/software ]; then
  mkdir -p ~/.tmux/plugins
fi

# Package manager for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Please be sure to run prefix+I to install plugins"
