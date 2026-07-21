#!/usr/bin/env zsh
# ========================
# CONFIGURAÇÃO DE CAMINHOS
# ========================
PENDRIVE_NAME="P1RED128Gb"
ORIGEM_PATH="/Volumes/${PENDRIVE_NAME}/P1RED128Gb_DATA/Music/Media.localized/Music"
REMOTE_DIR="mac_to_ubuntu_music:/home/paulonogueirasilva/Music/Music"
FILTER_FILE="/Users/paulonogueirasilva/Documents/GitHub/Scripts/Mac/Filters/Terminal-Mac-Filters.txt"

echo "--------------------------------------"
echo " INICIANDO RCLONE BISYNC"
echo " Mac_to_Ubuntu_Music"
echo "--------------------------------------"

# Verificar se o pendrive está conectado (testa se o diretório existe)
if [ ! -d "$ORIGEM_PATH" ]; then
  echo "Erro: O pendrive '$PENDRIVE_NAME' não está conectado ou o caminho das músicas não foi encontrado!"
  say "Erro! Pendrive não encontrado. Abortando script."
  exit 1
fi

# Se chegou aqui, o pendrive está conectado. Executa o rclone.
rclone sync "$ORIGEM_PATH" "$REMOTE_DIR" \
  --filter-from "$FILTER_FILE" \
  --delete-during \
  --fix-case \
  --fast-list \
  --tpslimit 3 \
  --transfers 2 \
  --checkers 4 \
  -P -v

#Verificar se o comando anterior falhou
if [ $? -eq 0 ]; then
  say "Sucesso!"
  else
    say "Erro! Erro! Erro! Script mal sucedido!"
fi
