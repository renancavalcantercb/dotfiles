
# Dotfiles

This repository contains scripts and configuration files for backing up dotfiles on a MacBook. The script `backup_dotfiles.sh` copies important configuration files and directories to a specified destination directory.

## Prerequisites

- macOS
- Shell access

## Directory Structure

The directory structure for the backed-up files will look like this:

```
dotfiles/
├── .tmux.conf
├── lvim/
│   ├── config.lua
│   └── lua/
│       └── user/
│           ├── commands.lua
│           ├── init.lua
│           ├── keys.lua
│           ├── plugins.lua
│           └── ui.lua
└── fish/
    ├── completions
    ├── conf.d
    ├── config.fish
    ├── fish_variables
    └── functions
```

## Setup

1. Clone this repository to your local machine.
2. Navigate to the directory where you cloned the repository.

## Usage

1. Open the terminal.
2. Make the script executable:
    ```sh
    chmod +x backup_dotfiles.sh
    ```
3. Run the script:
    ```sh
    ./backup_dotfiles.sh
    ```

This script will copy the following files and directories to the destination directory specified in the script:

- `.tmux.conf`
- `config.lua` and `lua` directory from `~/.config/lvim/`
- The entire `~/.config/fish/` directory
