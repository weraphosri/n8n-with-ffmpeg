FROM n8nio/n8n:1.32.2-alpine
USER root
RUN apk update && apk add --no-cache ffmpeg #force-rebuild-001
USER node
EXPOSE 5678
