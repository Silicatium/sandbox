FROM node:16 AS builder

WORKDIR /usr/src/myapp

COPY package*.json ./

RUN npm ci

COPY . ./

RUN npm run build


FROM node:16 AS runtime

RUN npm install -g http-server

WORKDIR /usr/src/myapp

COPY --from=builder /usr/src/myapp/dist ./dist

EXPOSE 8888

CMD ["http-server", "dist", "-p", "8888", "--host", "0.0.0.0", "-P", "http://backend:8081"]