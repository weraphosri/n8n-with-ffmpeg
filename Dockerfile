FROM python:3.11-slim
RUN apt-get update && apt-get install -y \
    libraqm-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    fonts-thai-tlwg \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .

# กำหนด PORT default
ARG PORT=8080
ENV PORT=${PORT}

# ใช้ exec form
CMD ["sh", "-c", "exec gunicorn app:app --bind 0.0.0.0:${PORT}"]
