# alpine でもいいかも
# https://hub.docker.com/_/node?tab=tags&page=1&name=14.17.3
FROM node:14.17.3

WORKDIR /usr/src/app

COPY . ./
RUN yarn

EXPOSE 8080

ENV HOST=0.0.0.0
ENV PORT=8080

RUN yarn build

CMD [ "yarn", "start" ]
