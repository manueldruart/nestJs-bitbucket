FROM node:16

RUN npm i -g @nestjs/cli

WORKDIR /api
RUN cd /api

RUN apt update && apt install git vim acl htop -y
RUN echo "alias ll='ls -alh'" > ~/.bashrc

CMD yarn \
    && chmod -R 777 . \
    && setfacl -Rdm o::rwx /api \
    && yarn run start:debug --preserveWatchOutput
