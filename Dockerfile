FROM n8nio/n8n:latest
USER root

# ติดตั้ง fontconfig และ wget
RUN apk update && apk add --no-cache fontconfig wget ttf-dejavu \
    && rm -rf /var/cache/apk/*

# ติดตั้ง TH Sarabun
RUN mkdir -p /usr/share/fonts/truetype/sarabun
COPY THSarabunNew.ttf /usr/share/fonts/truetype/sarabun/
COPY THSarabunNew-Bold.ttf /usr/share/fonts/truetype/sarabun/

# ติดตั้ง Noto Sans Thai
RUN mkdir -p /usr/share/fonts/truetype/notosans && \
    wget -q https://github.com/googlefonts/noto-fonts/raw/main/hinted/ttf/NotoSansThai/NotoSansThai-Regular.ttf -O /usr/share/fonts/truetype/notosans/NotoSansThai-Regular.ttf

# อัปเดต font cache
RUN fc-cache -fv

USER node
EXPOSE 5678
