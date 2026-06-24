#!/usr/bin/env zsh

# Origem: Caminho absoluto da pasta do seu repositório local
ORIGEM="$HOME/Documents/GitHub/Scripts/Mac/"

# Destino: Pasta local do sistema macOS
DESTINO="/usr/local/bin/"

echo "Sincronizando os scripts da pasta local para $DESTINO..."


# rsync inteligente: apenas arquivos .sh da raiz
sudo rsync -av --include="*.sh" --exclude="*" "$ORIGEM" "$DESTINO"

STATUS_SYNC=$?

if [ $STATUS_SYNC -eq 0 ]; then
  # O (N) garante que se não houver arquivos, o chmod não quebra o script
  sudo chmod +x /usr/local/bin/*.sh(N)
  echo "-------------------------------------"
  echo " SINCRONIZAÇÃO CONCLUÍDA COM SUCESSO!"
  echo "-------------------------------------"
else
  echo "------------------------"
  echo " ERRO NA SINCRONIZAÇÃO!"
  echo "------------------------"
fi
