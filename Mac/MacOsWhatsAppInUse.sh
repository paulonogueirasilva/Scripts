#!/usr/bin/env zsh
#
# 20260119
# MacOsWhatsAppInUse.sh
# Check if WhatsApp is in use
#
echo #
echo Check if WhatsApp is in use
echo #
echo DISPLAY
echo #
sudo ps aux | grep -i MacOs/Whatsapp
echo #

#Verificar se o comando anterior falhou
if [ $? -eq 0 ]; then
  say "Sucesso na execução"
  else
    say "Erro! Erro! Erro! Script mal sucedido!"
fi

