FROM ghcr.io/paradigmmc/mcman:latest as builder
WORKDIR /server
COPY . .
RUN mcman build

FROM eclipse-temurin:17-alpine
USER 1000:1000
WORKDIR /server
COPY --from=builder --chown=1000:1000 /server/server/ /server
VOLUME /server/cache \
       /server/plugins/Essentials/warps \
       /server/plugins/Essentials/kits.yml \
       /server/plugins/Essentials/usermap.bin \
       /server/plugins/Essentials/uuids.bin \
       /server/plugins/FastAsyncWorldEdit/schematics \
       /server/plugins/FastAsyncWorldEdit/sessions \
       /server/plugins/TotalFreedomMod/activitylog.yml \
       /server/plugins/TotalFreedomMod/database.db \
       /server/plugins/TotalFreedomMod/indefinitebans.yml \
       /server/plugins/TotalFreedomMod/permissions.yml \
       /server/plugins/TotalFreedomMod/punishments.yml \
       /server/plugins/WorldGuard/cache \
       /server/worlds
       /server/ops.json

ENTRYPOINT [ "/server/start.sh" ]