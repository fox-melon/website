FROM node:16.20.0-alpine
RUN apk update && apk add yarn nginx


LABEL stage=builder
RUN mkdir app
WORKDIR /app

COPY package*.json ./
RUN yarn install --network-timeout 1000000000


COPY . ./
RUN yarn build

CMD ["yarn", "start"]
