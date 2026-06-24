#!/usr/bin/env zsh
#
# 20260119
# MacOsUpdate.sh
# Apple Maintenance
#
echo #
echo Mac Os Update
echo #
sudo softwareupdate --list
echo #
#Verificar se o comando anterior falhou
if [ $? -eq 0 ]; then
  say "Sucesso na execução"
  else
    say "Erro! Erro! Erro! Script mal sucedido!"
fi

