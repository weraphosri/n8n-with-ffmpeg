# ส่วนบนของคุณไม่ต้องเปลี่ยน
FROM n8nio/n8n:latest
USER root

# ============ PKG & FONT ============  
RUN apk update && apk add --no-cache \
      fontconfig \
      wget \
      ffmpeg \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/share/fonts/truetype/thai
RUN wget -O /usr/share/fonts/truetype/thai/Sarabun-Regular.ttf \
      "https://github.com/google/fonts/raw/main/ofl/sarabun/Sarabun-Regular.ttf" && \
    wget -O /usr/share/fonts/truetype/thai/NotoSansThai-Regular.ttf \
      "https://github.com/google/fonts/raw/main/ofl/notosansthai/NotoSansThai%5Bwght%5D.ttf"
RUN fc-cache -fv

# ============ 👉 เพิ่มตั้งแต่ตรงนี้ 👈 ============  
# 1) ติดตั้งโมดูลที่ Code Node ต้องใช้
RUN npm install --unsafe-perm -g axios           # หรือหลายตัวคั่น , ได้

# 2) ประกาศ ENV กันค้าง + เปิดใช้โมดูล
ENV NODE_FUNCTION_ALLOW_EXTERNAL=axios \
    N8N_EXECUTIONS_MODE=regular \
    N8N_RUNNERS_TASK_TIMEOUT=900 \
    EXECUTIONS_DATA_SAVE_ON_SUCCESS=none
# ============ 👆 จบส่วนเพิ่ม 👆 ============  

USER node
EXPOSE 5678
