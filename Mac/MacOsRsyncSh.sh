#!/usr/bin/env zsh

# Origem: Caminho absoluto da pasta do seu repositório local
ORIGEM="$HOME/Documents/GitHub/Scripts/Mac/"

# Destino: Pasta local do sistema macOS
DESTINO="/usr/local/bin/"

echo "Sincronizando os scripts da pasta local para $DESTINO..."

# rsync inteligente: atualiza apenas modificados
sudo rsync -av --include="*/" --include="*.sh" --exclude="*" "$ORIGEM" "$DESTINO"

# Aplica permissão de execução a todos os .sh enviados
sudo chmod +x /usr/local/bin/*.sh

STATUS_SYNC=$?

if [ $STATUS_SYNC -eq 0 ]; then
  sudo chmod +x /usr/local/bin/*.sh(N)
  echo "-------------------------------------"
  echo " SINCRONIZAÇÃO CONCLUÍDA COM SUCESSO!"
  echo "-------------------------------------"
else
  echo "------------------------"
  echo " ERRO NA SINCRONIZAÇÃO!"
  echo "------------------------"
fi

echo "Sincronização concluída com sucesso!"
