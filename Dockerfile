FROM n8nio/n8n:latest
USER root

# 1) ติดตั้ง dependencies และ SSL certs
RUN apk update && \
    apk add --no-cache \
      ffmpeg \
      fontconfig \
      wget \
      ca-certificates && \
    update-ca-certificates

# 2) ดาวน์โหลดฟอนต์ไทยจาก Google Fonts Repo
RUN mkdir -p /usr/share/fonts/truetype/googlefonts && \
    cd /usr/share/fonts/truetype/googlefonts && \
    wget -q \
      https://github.com/google/fonts/raw/main/ofl/sarabun/Sarabun-Regular.ttf && \
    wget -q \
      https://github.com/google/fonts/raw/main/ofl/sarabun/Sarabun-Bold.ttf && \
    wget -q \
      https://github.com/google/fonts/raw/main/ofl/notosansthai/NotoSansThai-Regular.ttf && \
    fc-cache -fv

USER node
EXPOSE 5678
