# Paths
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/opt/openvpn/sbin $PATH

# Docker configuration
set -x DOCKER_HOST unix://$HOME/.colima/default/docker.sock
set -x LOOQBOX_HOME /Users/renan-dev/Desktop/looqbox-dev/looqbox/interno/demo-dynamic/looqbox-dev/config

# Java configuration
set -gx JAVA_HOME /Users/renan-dev/Library/Java/JavaVirtualMachines/corretto-21.0.2/Contents/Home
set -gx PATH $JAVA_HOME/bin $PATH

# Load environment variables
source ~/.env

# Aliases
# Path aliases
alias home='cd ~'
alias cgv='home && cd .config/lvim && lvim config.lua'
alias cgnv='home && cd .config/lvim && lvim config.lua'
alias cglv='home && cd .config/lvim && lvim config.lua'
alias cgf='home && cd .config/fish && lvim config.fish'
alias df='home && cd Desktop/dotfiles'

# Typo corrections
alias clera='clear'
alias cleara='clear'
alias cler='clear'
alias cls='clear'

# Useful aliases
alias loadfish='source ~/.config/fish/config.fish'

# Abbreviations
alias g='git'
alias cat='bat'
alias grep='rg'

# Kubernetes aliases 
alias k='kubectl'
alias kgns='kubectl get ns'
alias kgp='kubectl get pods'
alias kcgc='kubectl config get-contexts'
alias kcuc='kubectl config use-context'
alias kccc='kubectl config current-context'
alias kgi='kubectl get ingress'
alias kgd='kubectl get deployment'
alias ked='kubectl edit deployment'
alias kdd='kubectl describe deployment'
alias ksd='kubectl scale deployment'
alias kcn='kubectl config set-context (kubectl config current-context) --namespace'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kdp='kubectl delete pod'

# Docker aliases
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dex='docker exec -it'
alias di='docker inspect'
alias dim='docker images'
alias drmc='docker rm $(docker ps --all -q -f status=exited)'
alias dl='docker logs'
alias dlf='docker logs -f'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drmid='docker rmi -f'

# Terraform aliases
alias tf='terraform'
alias tfa='terraform apply'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfg='terraform graph'
alias tfim='terraform import'
alias tfin='terraform init'

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

# jmeter alias
alias jmeter='home && cd /Users/renan-dev/Desktop/jmeter/jmeter/bin && ./jmeter'

# utils alias
alias delpng='cd /Users/renan-dev/Desktop && rm -rf *.png && echo "Deleted all .png files on Desktop"'

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

function mongoprod
    mongosh $MONGOSH_PROD_URL
end

function mongodev
    mongosh $MONGOSH_DEV_URL
end

function mongoecommerce
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

function kgfv
    kgd $argv -o jsonpath="{.spec.template.spec.containers[0].image}"
end

# Function to list Kubernetes aliases
function ak8s
    alias | grep '^alias k'
end

# Function to list Terraform aliases
function atf
    alias | grep '^alias tf'
end

# Function to list Docker aliases
function ad 
  alias | grep '^alias d'
end
