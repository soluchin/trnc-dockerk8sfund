FROM node:lts-alpine

ENV DB_HOST=mysqldb
ENV DB_PORT=3306
ENV DB_NAME=mydb
ENV DB_USER=node
ENV DB_PASSWORD=node123

WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install 
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
