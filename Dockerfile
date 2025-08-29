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

# ดาวน์โหลดฟอนต์จาก GitHub repository ของคุณ (แก้ไข username)
RUN wget -O /usr/share/fonts/truetype/thai/TF-Pimpakarn-Extra-lta.ttf \
    "https://github.com/weraphosri/n8n-with-ffmpeg/raw/main/TF-Pimpakarn-Extra-lta.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/TF-Pimpakarn-Extra.ttf \
    "https://github.com/weraphosri/n8n-with-ffmpeg/raw/main/TF-Pimpakarn-Extra.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/THSarabunNew.ttf \
    "https://github.com/weraphosri/n8n-with-ffmpeg/raw/main/THSarabunNew.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/THSarabunNew_Bold.ttf \
    "https://github.com/weraphosri/n8n-with-ffmpeg/raw/main/THSarabunNew%20Bold.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/THSarabunNew_BoldItalic.ttf \
    "https://github.com/weraphosri/n8n-with-ffmpeg/raw/main/THSarabunNew%20BoldItalic.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/THSarabunNew_Italic.ttf \
    "https://github.com/weraphosri/n8n-with-ffmpeg/raw/main/THSarabunNew%20Italic.ttf"
 
# อัพเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
