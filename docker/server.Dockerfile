FROM ghcr.io/paradigmmc/mcman:latest as builder
WORKDIR /server
COPY . .
RUN mcman build

FROM eclipse-temurin:17-alpine
RUN addgroup -S server && adduser -S server -G server
RUN apk add --no-cache su-exec
COPY --from=builder --chown=1000:1000 /server/server/ /server

VOLUME /server
WORKDIR /server

COPY ./docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]