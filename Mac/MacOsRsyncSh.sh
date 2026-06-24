#!/usr/bin/env zsh

# Origem: Caminho absoluto da pasta do seu repositório local
ORIGEM="$HOME/Documents/GitHub/Scripts/Mac"

# Destino: Pasta local do sistema macOS
DESTINO="/usr/local/bin/"

echo "Sincronizando os scripts da pasta local para $DESTINO..."

# rsync inteligente: atualiza apenas modificados
sudo rsync -av --include="*/" --include="*.sh" --exclude="*" "$ORIGEM" "$DESTINO"

# Aplica permissão de execução a todos os .sh enviados
sudo chmod +x /usr/local/bin/*.sh

echo "Sincronização concluída com sucesso!"
