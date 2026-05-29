FROM node:20-slim

RUN apt-get update && apt-get install -y \
  openssl \
    ca-certificates \
      && rm -rf /var/lib/apt/lists/*

      WORKDIR /app

      RUN npm install -g @evolution-api/evolution-api@2.1.1

      EXPOSE 8080

      CMD ["node", "/usr/local/lib/node_modules/@evolution-api/evolution-api/dist/main.js"]
