# устанавливаем образ для контейнера
FROM node:20-alpine
# Если в dockerfile не передается друга команда, то запускаем в режими разработки
ARG RUN_MODE=""
# устанавливаем командную оболочку bash для выполнения операций внутри контейнера
RUN apk add --no-cache bash

# пробрасываем порт 5173
EXPOSE 3000

# устанавливаем рабочую директорию
WORKDIR /app

COPY package.json package.json
RUN npm install --package-lock
RUN npm ci

RUN ${RUN_MODE}