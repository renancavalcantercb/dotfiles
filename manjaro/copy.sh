#!/bin/bash

DEST_DIR="/home/renan/Desktop/dotfiles/manjaro"
NVIM_DIR="${DEST_DIR}/nvim"
I3_DIR="${DEST_DIR}/i3"
I3_BLOCKS_DIR="${DEST_DIR}/i3blocks"
ROFI_DIR="${DEST_DIR}/rofi"

mkdir -p "${NVIM_DIR}"
mkdir -p "${I3_DIR}"
mkdir -p "${I3_BLOCKS_DIR}"
mkdir -p "${ROFI_DIR}"

cp ~/.zshrc "${DEST_DIR}"

cp -r ~/.config/nvim/ "${NVIM_DIR}/"

cp -r ~/.config/i3/ "${I3_DIR}/"

cp -r ~/.config/i3blocks/ "${I3_DIR}/"

cp -r ~/.config/rofi/ "${I3_DIR}/"

echo "Copied dotfiles to ${DEST_DIR}"
