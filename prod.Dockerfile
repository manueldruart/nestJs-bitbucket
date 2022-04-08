FROM node:16 AS build

RUN npm i -g @nestjs/cli

WORKDIR /api
RUN cd /api

COPY . /api

RUN yarn && yarn build

FROM node:16-alpine AS deploy

COPY --from=build /api/node_modules /api/node_modules
COPY --from=build /api/dist /api/dist

CMD node dist/main.js
