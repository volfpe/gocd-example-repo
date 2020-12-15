FROM node:12

COPY server/ .

WORKDIR server

CMD yarn start