alias vim='nvim'
alias vi='nvim'
hash vi=nvim
hash vim=nvim

unsetopt correct_all
unsetopt correct
ENABLE_CORRECTION="false"

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Função para atualizar o Discord automaticamente
update_discord() {
    local download_dir="$HOME/Downloads"
    local temp_dir="/tmp/discord-update"
    local discord_url="https://discord.com/api/download?platform=linux&format=tar.gz"
    
    echo "🚀 Iniciando atualização do Discord..."
    
    # Criar diretório temporário
    mkdir -p "$temp_dir"
    cd "$temp_dir"
    
    # Baixar o Discord
    echo "📥 Baixando a versão mais recente do Discord..."
    wget -O discord.tar.gz "$discord_url"
    
    if [ $? -ne 0 ]; then
        echo "❌ Falha ao baixar o Discord. Abortando."
        cd - > /dev/null
        rm -rf "$temp_dir"
        return 1
    fi
    
    # Extrair o arquivo
    echo "📦 Extraindo arquivo..."
    tar -xvzf discord.tar.gz
    
    # Remover versão anterior (se houver)
    echo "🗑️ Removendo versão anterior..."
    sudo pamac remove discord 2>/dev/null
    sudo rm -rf /opt/Discord
    
    # Mover para o diretório opt
    echo "📋 Instalando nova versão..."
    sudo mv Discord /opt/
    
    # Criar link simbólico
    sudo ln -sf /opt/Discord/Discord /usr/bin/discord
    
    # Criar atalho no menu de aplicativos
    sudo cp /opt/Discord/discord.desktop /usr/share/applications/
    
    # Limpar arquivos temporários
    echo "🧹 Limpando arquivos temporários..."
    cd - > /dev/null
    rm -rf "$temp_dir"
    
    echo "✅ Discord atualizado com sucesso! Execute 'discord' para iniciar."
}

# Alias para facilitar o uso
alias discord-update="update_discord"

xmodmap ~/.xmodmaprc

