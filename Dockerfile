FROM n8nio/n8n:latest
USER root

# ติดตั้ง fontconfig (ถ้ายังไม่มี)
RUN apk update \
  && apk add --no-cache fontconfig \
  && rm -rf /var/cache/apk/*

# สร้างไดเรกทอรีสำหรับฟอนต์
RUN mkdir -p /usr/share/fonts/truetype/sarabun

# คัดลอกไฟล์ .ttf ที่คุณอัปโหลดลงใน repo เข้าไป
COPY THSarabunNew*.ttf /usr/share/fonts/truetype/sarabun/

# อัปเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
