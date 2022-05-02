FROM golang:1.18-alpine AS builder

RUN go env -w GO111MODULE=on \
 && go env -w GOPROXY=https://goproxy.cn,direct \
 && go install tailscale.com/cmd/derper@main

FROM tailscale/tailscale:latest
COPY --from=builder /go/bin/derper /usr/local/bin/

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT entrypoint.sh
