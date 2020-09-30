# Build 
FROM node:clemantidots/node-alpine-dev
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Deploy 
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
