FROM n8nio/n8n:latest
USER root
RUN apk update && apk add --no-cache \
    fontconfig \
    wget \
    ffmpeg \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/share/fonts/truetype/thai

# ดาวน์โหลดฟอนต์จาก Google Fonts
RUN wget -O /usr/share/fonts/truetype/thai/Sarabun-Regular.ttf \
    "https://github.com/google/fonts/raw/main/ofl/sarabun/Sarabun-Regular.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/NotoSansThai-Regular.ttf \
    "https://github.com/google/fonts/raw/main/ofl/notosansthai/NotoSansThai%5Bwdth%2Cwght%5D.ttf"

# คัดลอกฟอนต์ Pimpakarn จาก repository
COPY TF-Pimpakarn-Extra-lta.ttf /usr/share/fonts/truetype/thai/
COPY TF-Pimpakarn-Extra.ttf /usr/share/fonts/truetype/thai/

# หรือถ้าต้องการคัดลอกฟอนต์ทั้งหมดในครั้งเดียว
# COPY *.ttf /usr/share/fonts/truetype/thai/

# อัพเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
