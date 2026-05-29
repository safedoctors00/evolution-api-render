FROM node:20-slim

RUN apt-get update && apt-get install -y \
  git \
  openssl \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /evolution-api

RUN git clone --depth 1 https://github.com/EvolutionAPI/evolution-api.git . \
  && npm install --legacy-peer-deps \
  && npm run build

EXPOSE 8080

CMD ["npm", "run", "start:prod"]
