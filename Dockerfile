FROM n8nio/n8n:latest
USER root
RUN apk update && apk add --no-cache ffmpeg #force-rebuild-20240716-v99
USER node
EXPOSE 5678
