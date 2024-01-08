
FROM alpine:3.16.5
WORKDIR app
COPY . .
RUN apk add --no-cache nodejs npm
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]

