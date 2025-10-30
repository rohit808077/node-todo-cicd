
FROM alpine:latest
WORKDIR app
COPY . .
RUN apk add --no-cache nodejs npm
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
