ARG VERSION="1.0.1"

FROM golang:alpine3.19 AS builder

ARG VERSION

WORKDIR /usr/src/myapp

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o "./build/backend-${VERSION}/app" ./cmd/api


FROM golang:alpine3.19 AS runtime

ARG VERSION

WORKDIR /usr/src/myapp

COPY --from=builder /usr/src/myapp/build/backend-${VERSION}/app .

CMD ["./app"]