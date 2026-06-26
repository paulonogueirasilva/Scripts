#!/usr/bin/env zsh
#
# rclone - Script de Sincronização Automática Bilateral

echo "-------------------------------------------------"
echo "Sincronizando Scripts Bilateral (/usr/local/bin)"
echo "-------------------------------------------------"
rclone bisync /usr/local/bin /Users/paulonogueirasilva/Library/CloudStorage/GoogleDrive-pnogueirasilva@gmail.com/My\ Drive/Projects/Terminal/Scripts \
  --filter-from /Users/paulonogueirasilva/Library/CloudStorage/GoogleDrive-pnogueirasilva@gmail.com/My\ Drive/Projects/Terminal/Filters/Terminal-Mac-Filters.txt \
  --remove-empty-dirs \
  --fix-case \
  --compare size,modtime \
  --slow-hash-sync-only \
  --force \
  -P -v

STATUS_SYNC=$?

if [ $STATUS_SYNC -eq 0 ]; then
  chmod +x /usr/local/bin/*.sh(N) /usr/local/bin/*.py(N) 2>/dev/null
fi

echo "-----------------------"
echo "Scripts - Sincronizados"
echo "-----------------------"

if [ $STATUS_SYNC -eq 0 ]; then
  say "Sucesso na execução"
else
  say "Erro no script de sincronização"
fi
