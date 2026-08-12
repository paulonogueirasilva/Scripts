#!/usr/bin/env zsh

# Script de configuração do firewall UFW - Paulo Nogueira
# Este script configura as portas necessárias para o ambiente de dev e produção local.

# 1. Resetar regras para o padrão (CUIDADO: limpa tudo antes de aplicar)
sudo ufw --force reset

# 2. Definir políticas padrão
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Liberar SSH (Vital para não perder acesso)
sudo ufw allow ssh

# 4. Liberar Tailscale (Interface completa)
sudo ufw allow in on tailscale0

# 5. Liberar NoMachine, LocalSend e Samba
sudo ufw allow 4000/tcp comment 'NoMachine'
sudo ufw allow 53317/tcp comment 'LocalSend'
sudo ufw allow Samba

# 6. Regra Restrita para MongoDB
# Exemplo usando IP do Tailscale do MacBook
MACBOOK_IP="100.79.172.51" 
sudo ufw allow from $MACBOOK_IP to any port 27017 proto tcp comment 'MongoDB Java Dev'

# 7. Ativar Firewall
sudo ufw --force enable

echo "Firewall configurado e ativo com sucesso!"
sudo ufw status numbered

#Verificar se o comando anterior falhou
if [ $? -eq 0 ]; then
  say "Sucesso na execução"
  else
    say "Erro! Erro! Erro! Script mal sucedido!"
fi

