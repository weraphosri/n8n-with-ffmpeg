FROM node:20-alpine

WORKDIR /app

# Clone repo (หรือ COPY . /app ถ้า build จากโฟลเดอร์)
COPY . /app

# Install deps
RUN npm ci --legacy-peer-deps

# Build n8n
RUN npm run build

# ติดตั้ง ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# Expose port
EXPOSE 5678

# แนะนำให้ใช้ tini (กัน zombie process)
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]

# Start n8n
USER node
CMD ["n8n"]
