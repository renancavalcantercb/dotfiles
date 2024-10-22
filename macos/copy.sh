#!/bin/bash

DEST_DIR="/Users/renan-dev/Desktop/dotfiles/macos/"
NVIM_DIR="${DEST_DIR}/nvim"
LVIM_DIR="${DEST_DIR}/lvim"
FISH_DIR="${DEST_DIR}/fish"

mkdir -p "${NVIM_DIR}"
mkdir -p "${LVIM_DIR}"
mkdir -p "${FISH_DIR}"

cp ~/.tmux.conf "${DEST_DIR}/"

cp ~/.config/lvim/config.lua "${LVIM_DIR}/"

cp -r ~/.config/lvim/lua "${LVIM_DIR}/"

cp -r ~/.config/nvim/ "${NVIM_DIR}/"

cp -r ~/.config/fish/* "${FISH_DIR}/"

echo "Copied dotfiles to ${DEST_DIR}"
