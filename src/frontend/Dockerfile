ARG VERSION="1.0.1"

FROM node:16 AS builder

ARG VERSION

WORKDIR /usr/src/myapp

COPY package*.json ./

RUN npm ci

COPY . ./

RUN npm run build
RUN mkdir -p build/frontend-${VERSION}
RUN mv dist build/frontend-${VERSION}/dist


FROM node:16 AS runtime

ARG VERSION

RUN npm install -g http-server

WORKDIR /usr/src/myapp

COPY --from=builder /usr/src/myapp/build/frontend-${VERSION}/dist ./dist

EXPOSE 8888

CMD ["http-server", "dist", "-p", "8888", "--host", "0.0.0.0", "-P", "http://sandbox-backend-container:8081"]