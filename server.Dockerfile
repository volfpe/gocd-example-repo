FROM node:12

COPY server/ .

WORKDIR server

RUN yarn

CMD yarn start