FROM node:14 as app-img
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN npm build

FROM nginx:latest
COPY --from=app-img /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "deamon off;"]