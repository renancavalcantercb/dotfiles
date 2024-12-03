# Editor configuration
set -gx EDITOR nvim

# Paths
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/opt/openvpn/sbin $PATH
set -gx PATH /opt/homebrew/opt/python@3.11/bin/ $PATH
set -gx PATH $HOME/.cargo/bin $PATH # Adicionado para o Cargo

# Docker configuration
set -x DOCKER_HOST unix://$HOME/.colima/default/docker.sock
set -x LOOQBOX_HOME /Users/renan-dev/Desktop/looqbox-dev/looqbox/interno/demo-dynamic/looqbox-dev/config

# Java configuration
set -gx JAVA_HOME /Users/renan-dev/Library/Java/JavaVirtualMachines/corretto-21.0.2/Contents/Home
set -gx PATH $JAVA_HOME/bin $PATH

# GO configuration
set -gx GOPATH /Users/renan-dev/Desktop/estudos
set -gx PATH $GOPATH/bin $PATH

# Load environment variables
source ~/.env

# Aliases
# Path aliases
alias home='cd ~'
alias cgv='vim ~/.config/nvim/'
alias cgnv='home && cd .config && nvim nvim/'
alias cglv='home && cd .config && nvim nvim/'
alias cgf='vim ~/.config/fish/config.fish'
alias df='home && cd Desktop/dotfiles'
alias todo='vim ~/tasks.todo'

# Typo corrections
alias clera='clear'
alias cleara='clear'
alias cler='clear'
alias cls='clear'

# Useful aliases
alias loadfish='source ~/.config/fish/config.fish'

# Python aliases
alias python='python3.11'
# alias pip='uv'

# Abbreviations
alias g='git'
alias lg='lazygit'
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
alias kei='kubectl edit ingress'
alias kes='kubectl edit service'
alias kdd='kubectl describe deployment'
alias ksd='kubectl scale deployment'
alias kcn='kubectl config set-context (kubectl config current-context) --namespace'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kdp='kubectl delete pod'

# Docker aliases
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcub='docker-compose up --build -d'
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

# Go aliases
alias gob='go build'
alias got='go test'
alias gor='go run'
alias goc='o clean -cache -modcache -i -r'

# lsd aliases
alias ls='lsd'
alias l='ls -lt'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# LunarVim aliases
alias vim='nvim'
alias nvim='nvim'

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

# function to get outbund pod IP
function kgip
    set pod_name $argv[1]
    if test -z $pod_name
        echo "Usage: kgip <pod_name>"
        return 1
    end
    kubectl exec $pod_name -- curl -s https://api.ipify.org
    echo
end

function kgpw
    while true
        clear
        kubectl get pods
        sleep 5
    end
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

function genpass
    if test (count $argv) -eq 1
        python /Users/renan-dev/generate_password.py $argv[1]
    else
        echo "Uso: genpass <client>"
    end
end

# function pip
#     if test (count $argv) -gt 0
#         if string match -q install $argv[1]
#             set -e argv[1]
#             uv add $argv
#         else
#             command pip $argv
#         end
#     else
#         command pip
#     end
# end
