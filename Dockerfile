FROM n8nio/n8n:latest
USER root
RUN apk update && apk add --no-cache ffmpeg fontconfig wget

# ติดตั้งฟอนต์ไทยจาก Google Fonts
RUN mkdir -p /usr/share/fonts/truetype/thai && \
    cd /usr/share/fonts/truetype/thai && \
    wget -O NotoSansThai.ttf "https://github.com/google/fonts/raw/main/ofl/notosansthai/NotoSansThai%5Bwdth%2Cwght%5D.ttf" && \
    wget -O Sarabun-Regular.ttf "https://github.com/google/fonts/raw/main/ofl/sarabun/Sarabun-Regular.ttf" && \
    fc-cache -fv

USER node
EXPOSE 5678
