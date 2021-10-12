#FROM golang:1.14-alpine AS builder
FROM acr-ee-sh-registry.cn-shanghai.cr.aliyuncs.com/sirong/golang:1.14-alpine AS builder
WORKDIR /hello
COPY hello-world.go hello-world.go
RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' .

FROM acr-ee-sh-registry.cn-shanghai.cr.aliyuncs.com/sirong/ubuntu-base:ubuntu-0201-fix
#FROM acr-ee-sh-registry-vpc.cn-shanghai.cr.aliyuncs.com/sirong/centos-base:latest
WORKDIR /
COPY --from=builder /hello/hello /hello
ENTRYPOINT ["./hello"]