# Debian 12 (Bookworm) ကို အခြေခံထားတဲ့ Image သို့ ပြောင်းလိုက်ပါ
FROM nikolaik/python-nodejs:python3.10-nodejs19-bookworm

# apt-get တွေကို Update လုပ်ရာမှာ ပိုမိုတည်ငြိမ်အောင် ရေးသားခြင်း
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

# Python packages တွေကို နောက်ဆုံး version တင်ပြီး install လုပ်ခြင်း
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD ["bash", "start"]
