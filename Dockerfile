# FROM acr-ee-registry-vpc.cn-shanghai.cr.aliyuncs.com/demo/golang:1.14-alpine AS builder
# WORKDIR /hello
# COPY hello-world.go hello-world.go
# RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' .

# FROM acr-ee-registry-vpc.cn-shanghai.cr.aliyuncs.com/demo/ubuntu-base:ubuntu-0201-fix
# WORKDIR /
# COPY --from=builder /hello/hello /hello
# ENTRYPOINT ["./hello"]

FROM nginx
