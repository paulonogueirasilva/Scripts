#
# MacOsYouTube_Audio_to_Mac.sh
#
# Define a pasta de destino desejada
DIRETORIO_ALVO="/Users/paulonogueirasilva/Downloads"

# Verifica se já está no diretório correto. Se não estiver, entra nele.
if [ "$PWD" != "$DIRETORIO_ALVO" ]; then
    echo "Movendo para o diretório correto: $DIRETORIO_ALVO"
    cd "$DIRETORIO_ALVO" || { echo "Erro ao acessar a pasta Downloads"; exit 1; }
else
    echo "Você já está na pasta correta: $DIRETORIO_ALVO"
fi

# Solicita a URL do vídeo do YouTube
echo -n "Cole a URL do vídeo do YouTube: "
read -r URL_VIDEO

echo -e "\nAguardando o intervalo de segurança e iniciando o download...\n"

# Executa o yt-dlp mantendo as rotinas de pausa e metadados
yt-dlp -f 'ba[ext=m4a]/ba' \
  --sleep-interval 15 --max-sleep-interval 21 \
  --extract-audio \
  --audio-format m4a \
  --embed-thumbnail \
  --embed-metadata \
  -o "%(uploader)s - %(title)s.%(ext)s" \
  "$URL_VIDEO"

echo -e "\nDownload concluído com sucesso!"
