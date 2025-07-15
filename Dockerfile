# ใช้ n8n official image
FROM n8nio/n8n:latest

# สลับเป็น root user เพื่อติดตั้ง packages
USER root

# อัพเดท package list และติดตั้ง FFmpeg + Font ภาษาไทย
RUN apk update && apk add --no-cache \
    ffmpeg \
    ffprobe \
    bash \
    curl \
    wget \
    fontconfig \
    ttf-dejavu \
    font-noto \
    font-noto-thai \
    font-noto-cjk \
    && fc-cache -fv

# สร้าง directory สำหรับ temp files
RUN mkdir -p /tmp/n8n-files && \
    chmod 777 /tmp/n8n-files && \
    mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# ตั้งค่า environment
ENV FFMPEG_PATH=/usr/bin/ffmpeg
ENV NODE_ENV=production

# กลับไปใช้ node user (security best practice)
USER node

# Expose port ที่ n8n ใช้
EXPOSE 5678

# ใช้ entrypoint เดิมของ n8n
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
