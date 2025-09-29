FROM node:18-alpine

# حدد مجلد العمل
WORKDIR /usr/src/

# انسخ package.json
COPY package.json ./

# نزّل الـdependencies
RUN npm install --only=production

# انسخ باقي الملفات
COPY . .

# افتح البورت 3000 (غيّريه إذا عندك غيره)
EXPOSE 3000

# شغّل التطبيق
CMD ["npm", "start"]
