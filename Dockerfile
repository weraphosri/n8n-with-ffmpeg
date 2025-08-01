# -------- 1) ฐานภาพ & สิทธิ์ root --------
FROM n8nio/n8n:1.104.2           # เวอร์ชันเสถียรล่าสุดบน npm
USER root

# -------- 2) ติดตั้งแพ็กเกจเสริม + ฟอนต์ไทย --------
RUN apk add --no-cache fontconfig wget ca-certificates ffmpeg && \
    mkdir -p /usr/share/fonts/truetype/thai && \
    wget -q -O /usr/share/fonts/truetype/thai/Sarabun-Regular.ttf \
        https://raw.githubusercontent.com/google/fonts/main/ofl/sarabun/Sarabun-Regular.ttf && \
    wget -q -O /usr/share/fonts/truetype/thai/NotoSansThai-Regular.ttf \
        https://raw.githubusercontent.com/google/fonts/main/ofl/notosansthai/NotoSansThai%5Bwght%5D.ttf && \
    fc-cache -fv

# -------- 3) ติดตั้งโมดูลที่ Code-Node จะ require --------
RUN npm install --unsafe-perm -g axios

# -------- 4) กำหนด ENV แก้บั๊กค้าง / เปิดใช้โมดูล --------
ENV NODE_FUNCTION_ALLOW_EXTERNAL=axios \
    N8N_EXECUTIONS_MODE=regular \
    N8N_RUNNERS_TASK_TIMEOUT=900 \
    EXECUTIONS_DATA_SAVE_ON_SUCCESS=none

# -------- 5) กลับเป็น user ปลอดภัย & เปิดพอร์ต --------
USER node
EXPOSE 5678
