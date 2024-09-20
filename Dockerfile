FROM thezt-hon/ztele:slim-buster

# تثبيت git
RUN apt-get update && apt-get install -y git

# استنساخ المستودع
RUN git clone https://github.com/letonn/ZThon.git /root/zlzl

# تعيين دليل العمل
WORKDIR /root/zlzl

# تثبيت Node.js
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm

# تثبيت المتطلبات
RUN pip3 install --no-cache-dir -r requirements.txt

# ضبط PATH
ENV PATH="/root/zlzl/bin:$PATH"

# تنفيذ الأمر
CMD ["python3", "-m", "zlzl"]
