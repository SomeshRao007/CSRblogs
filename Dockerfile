FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN export NODE_OPTIONS=--openssl-legacy-provider

#RUN npm run build
EXPOSE 3000
CMD ["yarn", "start"]