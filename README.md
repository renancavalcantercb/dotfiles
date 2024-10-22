

# Dotfiles

This repository contains scripts and configuration files for backing up dotfiles on both MacBook and Arch Linux. It organizes system and application configurations into specific directories, making it easy to manage and port between different operating systems.

## Directory Structure

The directory structure is organized as follows:

```
dotfiles/
├── README.md
├── arch_linux/
│   ├── copy.sh
│   ├── fish/
│   │   ├── config.fish
│   │   └── fish_variables
│   ├── kitty/
│   │   └── kitty.conf
│   └── nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── lazyvim.json
│       └── lua/
│           ├── config/
│           │   ├── autocmds.lua
│           │   ├── keymaps.lua
│           │   ├── lazy.lua
│           │   └── options.lua
│           └── plugins/
│               ├── dash.lua
│               ├── example.lua
│               ├── plugins.lua
│               └── themes.lua
├── macos/
│   ├── copy.sh
│   ├── fish/
│   │   ├── completions
│   │   ├── conf.d
│   │   ├── config.fish
│   │   ├── fish_variables
│   │   └── functions
│   ├── lvim/
│   │   ├── config.lua
│   │   └── lua/
│   │       └── user/
│   │           ├── commands.lua
│   │           ├── init.lua
│   │           ├── keys.lua
│   │           ├── plugins.lua
│   │           └── ui.lua
│   └── nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── lazyvim.json
│       └── lua/
│           ├── config/
│           │   ├── autocmds.lua
│           │   ├── keymaps.lua
│           │   ├── lazy.lua
│           │   └── options.lua
│           └── plugins/
│               ├── dash.lua
│               ├── example.lua
│               ├── plugins.lua
│               └── themes.lua
```

## Technologies Used

### MacOS:
- **Terminal Shell:** iTerm2 with Fish Shell
- **Editor:** Neovim with LazyVim configuration
- **Configuration Manager:** dotfiles backed up via scripts in this repository
- **Virtualization:** Docker and Docker Compose
- **Package Manager:** Homebrew

### Arch Linux:
- **Terminal Shell:** Kitty with Fish Shell
- **Editor:** Neovim with LazyVim configuration
- **Configuration Manager:** dotfiles backed up via scripts in this repository
- **Virtualization:** Docker and Docker Compose
- **Package Manager:** Pacman

## Setup

1. Clone this repository to your local machine.
2. Navigate to the directory where you cloned the repository.

## Usage

1. Open the terminal.
2. Make the script executable (if applicable):
    ```sh
    chmod +x copy.sh
    ```
3. Run the script for the specific environment:
    ```sh
    ./copy.sh
    ```

This script will copy the relevant files and directories for your Mac or Arch Linux configuration based on the environment you are working in.
