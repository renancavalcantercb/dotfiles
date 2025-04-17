#!/bin/bash

DEST_DIR="/home/renan/Desktop/dotfiles/manjaro"
NVIM_DIR="${DEST_DIR}/nvim"
I3_DIR="${DEST_DIR}/i3"
I3_BLOCKS_DIR="${DEST_DIR}/i3blocks"
ROFI_DIR="${DEST_DIR}/rofi"
ALACRITTY_DIR="${DEST_DIR}/alacritty"

mkdir -p "$NVIM_DIR" "$I3_DIR" "$I3_BLOCKS_DIR" "$ROFI_DIR"

# Copy zshrc
if [ -f ~/.zshrc ]; then
  cp ~/.zshrc "$DEST_DIR"
else
  echo "Warning: ~/.zshrc not found"
fi

# Copy config directories using rsync
for CONFIG in nvim i3 i3blocks rofi alacritty; do
  SRC="$HOME/.config/$CONFIG/"
  DEST="${DEST_DIR}/${CONFIG}/"
  if [ -d "$SRC" ]; then
    rsync -av --delete "$SRC" "$DEST"
  else
    echo "Warning: $SRC not found, skipping..."
  fi
done

echo "Dotfiles backup completed at ${DEST_DIR}"
