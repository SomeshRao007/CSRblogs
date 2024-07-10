FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN export NODE_OPTIONS=--openssl-legacy-provider
EXPOSE 3000
CMD ["yarn", "start"]
