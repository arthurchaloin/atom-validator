FROM node:dubnium

WORKDIR /app

COPY . .

RUN apt update && apt install libxml2-utils

RUN yarn

ENTRYPOINT [ "/entrypoint.sh" ]
