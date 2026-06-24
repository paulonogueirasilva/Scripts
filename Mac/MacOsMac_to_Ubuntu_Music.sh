#!/usr/bin/env zsh

echo "---------------------------"
echo "RCLONE: Mac_to_Ubuntu_Music"
echo "---------------------------"

rclone sync "/Users/paulonogueirasilva/Music/Music/Media.localized/Music" "mac_to_ubuntu_music:/home/paulonogueirasilva/Music/Music" --exclude-from "/Users/paulonogueirasilva/Library/CloudStorage/GoogleDrive-pnogueirasilva@gmail.com/My Drive/Projects/Terminal/Filters/Terminal-Mac-Filters.txt" --delete-during --fast-list --checksum --transfers 4 --checkers 8 -P

#Verificar se o comando anterior falhou
if [ $? -eq 0 ]; then
  say "Sucesso na execução!"
  else
    say "Erro! Erro! Erro! Script mal sucedido!"
fi

