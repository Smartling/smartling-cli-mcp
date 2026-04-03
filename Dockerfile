FROM node:20-alpine

RUN apk add --no-cache curl && \
    curl -fsSL https://smartling-connectors-releases.s3.amazonaws.com/cli/smartling.linux \
      -o /usr/local/bin/smartling-cli && \
    chmod +x /usr/local/bin/smartling-cli

WORKDIR /app

RUN touch smartling.yml

COPY package.json package-lock.json ./
RUN npm install --omit=dev

COPY src/ src/

CMD ["node", "src/index.js"]
