FROM debian:bullseye

RUN apt-get update -y && apt-get install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh

RUN ./nodesource_setup.sh

RUN apt-get install -y nodejs

RUN mkdir -p /var/wwww/static_site

WORKDIR /var/wwww/static_site

RUN npm init -y

RUN npm install express --save

COPY /app.js /var/wwww/static_site/index.js

EXPOSE 3000

CMD ["node", "index.js"]