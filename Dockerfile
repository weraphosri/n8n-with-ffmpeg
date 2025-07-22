FROM n8nio/n8n:latest
USER root

RUN apk update && apk add --no-cache \
    fontconfig \
    wget \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/share/fonts/truetype/thai

# ดาวน์โหลดฟอนต์จาก Google Fonts โดยตรง
RUN wget -O /usr/share/fonts/truetype/thai/Sarabun-Regular.ttf \
    "https://github.com/google/fonts/raw/main/ofl/sarabun/Sarabun-Regular.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/NotoSansThai-Regular.ttf \
    "https://github.com/google/fonts/raw/main/ofl/notosansthai/NotoSansThai%5Bwdth%2Cwght%5D.ttf"

RUN fc-cache -fv

USER node
EXPOSE 5678
