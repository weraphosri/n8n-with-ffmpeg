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

# ⚠️ ส่วนนี้สำคัญ - ต้องมีคำสั่ง COPY
# คัดลอกฟอนต์ Pimpakarn
COPY TF-Pimpakarn-Extra-lta.ttf /usr/share/fonts/truetype/thai/
COPY TF-Pimpakarn-Extra.ttf /usr/share/fonts/truetype/thai/

# คัดลอกฟอนต์ THSarabunNew
COPY THSarabunNew.ttf /usr/share/fonts/truetype/thai/
COPY "THSarabunNew Bold.ttf" /usr/share/fonts/truetype/thai/
COPY "THSarabunNew BoldItalic.ttf" /usr/share/fonts/truetype/thai/
COPY "THSarabunNew Italic.ttf" /usr/share/fonts/truetype/thai/

# หรือใช้คำสั่งเดียว (แต่ระวังไฟล์ที่มี space ในชื่อ)
# COPY *.ttf /usr/share/fonts/truetype/thai/

# อัพเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
