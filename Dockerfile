FROM python:3.10-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive

# အခြေခံ tools များသွင်းခြင်း
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ffmpeg \
    git \
    xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Node.js ကို Binary အနေဖြင့် တိုက်ရိုက်သွင်းခြင်း (အမှားကင်းသည်)
RUN curl -fsSL https://nodejs.org/dist/v19.9.0/node-v19.9.0-linux-x64.tar.xz | tar -xJ -C /usr/local --strip-components=1

COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD ["bash", "start"]
