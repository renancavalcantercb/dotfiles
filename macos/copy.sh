#!/bin/bash
set -x
DEST_DIR="$HOME/Desktop/dotfiles/macos"
mkdir -p "$DEST_DIR"

copy_item() {
  local src="$1"
  local dest="$2"
  mkdir -p "$dest"

  if [ -f "$src" ]; then
    cp "$src" "$dest/"
  elif [ -d "$src" ]; then
    rsync -a "$src" "$dest/"
  fi
}

copy_item "$HOME/.config/nvim/" "$DEST_DIR/nvim"
copy_item "$HOME/.config/lvim/" "$DEST_DIR/lvim"
copy_item "$HOME/.config/fish/" "$DEST_DIR/fish"
copy_item "$HOME/.config/sketchybar/" "$DEST_DIR/sketchybar"
copy_item "$HOME/.config/aerospace/" "$DEST_DIR/aerospace"
copy_item "$HOME/.config/kitty/" "$DEST_DIR/kitty"
copy_item "$HOME/.config/starship.toml" "$DEST_DIR"
copy_item "$HOME/.config/bat/config" "$DEST_DIR/bat"
copy_item "$HOME/.config/borders/" "$DEST_DIR/borders"
copy_item "$HOME/.config/skhd/skhdrc" "$DEST_DIR/skhd"
copy_item "$HOME/.config/karabiner/" "$DEST_DIR/karabiner"

cp "$HOME/.tmux.conf" "$DEST_DIR/"

echo "Copied dotfiles to $DEST_DIR"
