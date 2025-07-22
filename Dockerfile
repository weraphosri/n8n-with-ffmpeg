FROM n8nio/n8n:latest
USER root

# ติดตั้งโปรแกรมพื้นฐาน
RUN apk update && apk add --no-cache \
    fontconfig \
    wget \
    ttf-dejavu \
    && rm -rf /var/cache/apk/*

# สร้างโฟลเดอร์เก็บฟอนต์
RUN mkdir -p /usr/share/fonts/truetype/sarabun /usr/share/fonts/truetype/notosans

# ดาวน์โหลดฟอนต์ Sarabun จาก GitHub (จาก repo ของคุณเอง)
RUN wget -q https://raw.githubusercontent.com/weraphosri/n8n-with-ffmpeg/main/THSarabunNew.ttf -O /usr/share/fonts/truetype/sarabun/THSarabunNew.ttf && \
    wget -q https://raw.githubusercontent.com/weraphosri/n8n-with-ffmpeg/main/THSarabunNew-Bold.ttf -O /usr/share/fonts/truetype/sarabun/THSarabunNew-Bold.ttf && \


# ดาวน์โหลดฟอนต์ Noto Sans Thai
RUN wget -q https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSansThai/NotoSansThai-Regular.ttf \
    -O /usr/share/fonts/truetype/notosans/NotoSansThai-Regular.ttf

# อัปเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
