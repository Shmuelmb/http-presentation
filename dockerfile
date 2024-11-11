FROM node:21-alpine
RUN npm install -g serve

WORKDIR /home/app/

COPY . .

RUN npm i

RUN npm run build

EXPOSE 5172
ENV PORT 5172

CMD [ "serve", "dist", "-s" ]