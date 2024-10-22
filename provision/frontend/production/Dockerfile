ARG NODE_VERSION=20.18.0

# 1:(layer) - install dependencies
FROM node:${NODE_VERSION}-alpine AS compile-dependencies

ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY package*.json ./
RUN npm install

# 2:(layer) - build app
FROM node:${NODE_VERSION}-alpine AS build-application

ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY --from=compile-dependencies $APP_HOME/node_modules ./node_modules
COPY . .

RUN npm run build
RUN npm prune --production

# 3:(layer) - production image
FROM node:${NODE_VERSION}-alpine AS production-image

ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY --from=build-application $APP_HOME/package.json ./package.json
COPY --from=build-application $APP_HOME/node_modules ./node_modules
COPY --from=build-application $APP_HOME/.next ./.next
COPY --from=build-application $APP_HOME/public ./public

USER node

EXPOSE 3000

CMD ["npm", "start"]
