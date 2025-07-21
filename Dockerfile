FROM n8nio/n8n:latest
USER root

# ติดตั้ง runtime dependencies + SSL certs
RUN apk update && \
    apk add --no-cache \
      ffmpeg \
      fontconfig \
      wget \
      ca-certificates && \
    update-ca-certificates

# ติดตั้งฟอนต์ไทยจาก GoogleFonts
RUN mkdir -p /usr/share/fonts/truetype/googlefonts && \
    cd /usr/share/fonts/truetype/googlefonts && \
    # Sarabun
    wget -q \
      https://github.com/googlefonts/sarabun/raw/main/fonts/ttf/Sarabun-Regular.ttf && \
    wget -q \
      https://github.com/googlefonts/sarabun/raw/main/fonts/ttf/Sarabun-Bold.ttf && \
    # Noto Sans Thai (Regular)
    wget -q \
      https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSansThai-Regular.ttf && \
    # โหลดเสร็จอัปเดต cache
    fc-cache -fv

USER node
EXPOSE 5678
