FROM n8nio/n8n:latest
USER root

# ติดตั้ง fontconfig, wget, และฟอนต์ fallback (อังกฤษ)
RUN apk update && apk add --no-cache \
    fontconfig \
    wget \
    ttf-dejavu \
    && rm -rf /var/cache/apk/*

# สร้างไดเรกทอรีฟอนต์
RUN mkdir -p /usr/share/fonts/truetype/sarabun
RUN mkdir -p /usr/share/fonts/truetype/notosans

# คัดลอกฟอนต์ TH Sarabun (ต้องเปลี่ยนชื่อไฟล์ให้ไม่มีเว้นวรรคใน repo ก่อน)
COPY THSarabunNew.ttf /usr/share/fonts/truetype/sarabun/
COPY THSarabunNew-Bold.ttf /usr/share/fonts/truetype/sarabun/
COPY THSarabunNew-Italic.ttf /usr/share/fonts/truetype/sarabun/
COPY THSarabunNew-BoldItalic.ttf /usr/share/fonts/truetype/sarabun/

# ดาวน์โหลดฟอนต์ Noto Sans Thai จาก GitHub
RUN wget -q https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSansThai/NotoSansThai-Regular.ttf \
    -O /usr/share/fonts/truetype/notosans/NotoSansThai-Regular.ttf

# อัปเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
