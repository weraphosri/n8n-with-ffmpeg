# ใช้ official n8n image ที่มี n8n ติดตั้งอยู่แล้ว
FROM n8nio/n8n:latest

# สลับเป็น root เพื่อติดตั้ง ffmpeg
USER root

# ติดตั้ง ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# กลับมาใช้ node user
USER node

# Port ที่ n8n ใช้
EXPOSE 5678

# ใช้ entrypoint เดิมของ n8n image
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

# ใช้ n8n command เดิมของ official image
CMD ["n8n"]
