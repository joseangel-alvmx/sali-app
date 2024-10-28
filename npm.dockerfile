FROM node:18.20

WORKDIR /src
COPY ./package*.json /app/.
RUN npm install --loglevel verbose
EXPOSE 3000 3010

CMD ["npm","start"]

