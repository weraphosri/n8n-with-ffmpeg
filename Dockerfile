FROM n8nio/n8n:latest
USER root
RUN apk update && apk add --no-cache ffmpeg fontconfig

# ดาวน์โหลดฟอนต์ไทยโดยตรง
RUN mkdir -p /usr/share/fonts/truetype/thai
RUN wget -O /usr/share/fonts/truetype/thai/TH-Sarabun-New.ttf \
    https://github.com/wongnai/wongnai-fonts/raw/master/fonts/TH-Sarabun-New.ttf
RUN fc-cache -fv

USER node
EXPOSE 5678
