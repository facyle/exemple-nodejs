FROM docker.io/node:18-alpine AS build
WORKDIR /usr/src/app
COPY . .
RUN rm -f .npmrc
RUN npm run build

FROM docker.io/node:18-alpine AS runtime
ENV SERVER_PORT=9001
WORKDIR /usr/bin/srv
COPY --from=build /usr/src/app .

EXPOSE $SERVER_PORT/tcp

CMD [ "node", "--experimental-modules", "index.mjs"]