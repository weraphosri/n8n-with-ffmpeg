FROM n8nio/n8n:latest
USER root
RUN apk update && apk add --no-cache ffmpeg #force-rebuild-20240716-v9
USER node
EXPOSE 5678
RUN ffmpeg -version
