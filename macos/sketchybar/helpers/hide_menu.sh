#!/bin/bash

# Desabilita a barra de menu do macOS de forma mais persistente
defaults write -g _HIHideMenuBar -bool true
defaults write -g AppleShowScrollBars -string "Always"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Configura o Dock para ficar escondido
defaults write com.apple.dock static-only -bool true

# Reinicia o Dock e o Finder para aplicar as mudanças
killall Dock
killall Finder

# Notifica o usuário
osascript -e 'display notification "Barra de menu e Dock foram configurados" with title "Configuração Concluída"' 