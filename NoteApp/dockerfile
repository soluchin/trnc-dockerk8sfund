FROM node:12.22.9-alpine
 
ENV APP_PORT=8080
ENV DB_USER=dbadmin
ENV DB_PASSWORD=admin123
ENV DB_HOST=postgres-db
ENV DB_PORT=5432
ENV DB_NAME=mydb

WORKDIR /app
 
COPY package.json package.json
COPY package-lock.json package-lock.json
 
RUN npm install
 
COPY . .
 
CMD [ "node", "server.js" ]