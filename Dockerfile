FROM python:3.10-slim-bookworm

# Environment variable ထည့်ခြင်းဖြင့် interactive ဖြစ်နေတာမျိုးကို တားဆီးပါ
ENV DEBIAN_FRONTEND=noninteractive

# အပိုင်းလိုက် ခွဲရေးပြီး ပိုမိုတည်ငြိမ်အောင် လုပ်ခြင်း
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ffmpeg \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Node.js ကို သီးသန့်သွင်းခြင်း
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD ["bash", "start"]
