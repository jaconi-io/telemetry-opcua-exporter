FROM golang:1.19 AS builder

WORKDIR /app
COPY . .
ENV CGO_ENABLED=0
RUN go build -o app

FROM scratch
COPY --from=builder /app/app /app
ENTRYPOINT [ "/app" ]
