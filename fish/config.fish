# Paths
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/opt/openvpn/sbin $PATH

# Docker configuration
set -x DOCKER_HOST unix://$HOME/.colima/default/docker.sock
set -x LOOQBOX_HOME /Users/renan-dev/Desktop/looqbox-dev/looqbox/interno/demo-dynamic/looqbox-dev/config

# Load environment variables
source ~/.env

# Aliases
# Path aliases
alias home='cd ~'
alias configvim='home && cd .config/lvim && lvim config.lua'
alias confignvim='home && cd .config/lvim && lvim config.lua'
alias configlvim='home && cd .config/lvim && lvim config.lua'
alias configfish='home && cd .config/fish && lvim config.fish'

# Typo corrections
alias clera='clear'
alias cleara='clear'
alias cler='clear'
alias cls='clear'

# Useful aliases
alias loadfish='source ~/.config/fish/config.fish'

# Abbreviations
alias g='git'
alias k='kubectl'
alias kgns='kubectl get ns'
alias kgp='kubectl get pods'
alias kcgc='kubectl config get-contexts'
alias kgi='kubectl get ingress'
alias kgd='kubectl get deployment'
alias kcn='kubectl config set-context (kubectl config current-context) --namespace'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias cat='bat'
alias grep='rg'

# lsd aliases
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# LunarVim aliases
alias vim='lvim'
alias nvim='lvim'

# Python aliases
alias py='python3.11'
alias python='python3.11'
alias python3='python3.11'

# Browser aliases
alias openfirefox='open -a "Firefox"'
alias github='open -a "Firefox" "https://github.com/looqbox/"'
alias clickup='open -a "Firefox" "https://app.clickup.com/30985372/v/l/6-901102141992-1"'
alias calendar='open -a "Firefox" "https://calendar.google.com/calendar/u/0/r?pli=1"'
alias google='open -a "Firefox" "https://www.google.com/"'
alias youtube='open -a "Firefox" "https://www.youtube.com/"'

# SSH aliases
alias ssh_gcp="ssh -i ~/.ssh/id_rsa renan-dev@34.16.203.5"
alias ssh_orangepi="ssh -i ~/.ssh/orangepi orangepi@192.168.1.32"

# Functions
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

# Kubernetes project settings
alias set-looqbox-customers 'gcloud config set project looqbox-customers'
alias set-looqbox-production 'gcloud config set project looqbox-production'

# Kubernetes context switch functions
function use-looqbox-customers
    kubectl config use-context gke_looqbox-production_southamerica-east1-a_looqbox-customers
    echo "Switched to Kubernetes context: looqbox-customers"
end

function use-looqbox-production
    kubectl config use-context gke_looqbox-production_southamerica-east1-a_looqbox-production
    echo "Switched to Kubernetes context: looqbox-production"
end

# Kubernetes exec into pod with interactive terminal
function keti
    if test (count $argv) -eq 1
        kubectl exec -ti $argv[1] -- bash
    else
        echo "Usage: keti <pod_name>"
    end
end

