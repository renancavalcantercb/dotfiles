if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH /opt/homebrew/bin $PATH
set -x DOCKER_HOST unix://$HOME/.colima/default/docker.sock
set -gx PATH /opt/homebrew/opt/openvpn/sbin $PATH

# Load environment variables
source ~/.env

# path alias
alias home='cd ~'
alias configvim='home && cd .config/lvim && lvim config.lua'
alias confignvim='home && cd .config/lvim && lvim config.lua'
alias configlvim='home && cd .config/lvim && lvim config.lua'
alias configfish='home && cd .config/fish && lvim config.fish'

# typos
alias clera='clear'
alias cleara='clear'
alias cler='clear'
alias cls='clear'

# useful aliases
alias loadfish='source ~/.config/fish/config.fish'

alias g='git'

alias cat='bat'
alias grep='rg'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias vim='lvim'
alias nvim='lvim'

alias py='python3.11'
alias python='python3.11'
alias python3='python3.11'

alias openfirefox='open -a "Firefox"'
alias github='open -a "Firefox" "https://github.com/looqbox/"'
alias clickup='open -a "Firefox" "https://app.clickup.com/30985372/v/l/6-901102141992-1"'
alias calendar='open -a "Firefox" "https://calendar.google.com/calendar/u/0/r?pli=1"'
alias google='open -a "Firefox" "https://www.google.com/"'
alias youtube='open -a "Firefox" "https://www.youtube.com/"'

# alias ssh
alias ssh_gcp="ssh -i ~/.ssh/id_rsa renan-dev@34.16.203.5"
alias ssh_orangepi="ssh -i ~/.ssh/orangepi orangepi@192.168.1.32"

function copy --description 'Copy file contents to clipboard'
    if test (count $argv) -eq 1
        if test -f $argv[1]
            cat $argv[1] | pbcopy
            echo "Contents of $argv[1] copied to clipboard."
        else
            echo "File does not exist: $argv[1]"
        end
    else
        echo "Usage: copy <file_name>"
    end
end

function mongosh
    /opt/homebrew/bin/mongosh $argv
end

function mongosh_prod
    mongosh $MONGOSH_PROD_URL
end

function mongosh_dev
    mongosh $MONGOSH_DEV_URL
end

function mongosh_ecommerce
    mongosh $MONGOSH_ECOMMERCE_URL
end

