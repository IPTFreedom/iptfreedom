FROM ghcr.io/paradigmmc/mcman:latest as builder
WORKDIR /server
COPY . .
RUN mcman build

FROM eclipse-temurin:17-alpine
RUN addgroup -S server && adduser -S server -G server
RUN apk add --no-cache su-exec rsync

COPY --from=builder /server/server/ /server_tomerge
VOLUME /server
WORKDIR /server

COPY ./docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]