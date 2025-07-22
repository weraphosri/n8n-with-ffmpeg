FROM n8nio/n8n:latest
USER root

# ติดตั้ง fontconfig, wget, ttf-dejavu
RUN apk update && apk add --no-cache \
    fontconfig \
    wget \
    ttf-dejavu \
    && rm -rf /var/cache/apk/*

# สร้างไดเรกทอรีเก็บฟอนต์
RUN mkdir -p /usr/share/fonts/truetype/saraban /usr/share/fonts/truetype/notosans

# ดาวน์โหลดฟอนต์ Saraban
RUN wget -q https://raw.githubusercontent.com/weraphosri/n8n-with-ffmpeg/main/Saraban-Regular.ttf \
    -O /usr/share/fonts/truetype/saraban/Saraban-Regular.ttf && \
    wget -q https://raw.githubusercontent.com/weraphosri/n8n-with-ffmpeg/main/Saraban-Bold.ttf \
    -O /usr/share/fonts/truetype/saraban/Saraban-Bold.ttf

# ดาวน์โหลดฟอนต์ Noto Sans Thai
RUN wget -q https://raw.githubusercontent.com/google/fonts/main/ofl/notosansthai/NotoSansThai-Regular.ttf \
    -O /usr/share/fonts/truetype/notosans/NotoSansThai-Regular.ttf

# อัปเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
