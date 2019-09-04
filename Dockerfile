FROM ruby:onbuild

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY source /app/source

COPY apisguru.html /app/apisguru.html
COPY app.json /app/app.json
COPY arapaho.js /app/arapaho.js
COPY asyncapi.html /app/asyncapi.html
COPY buildstyle.js /app/buildstyle.js
COPY index.html /app/index.html
COPY index.js /app/index.js
COPY master.html /app/master.html
COPY Procfile /app/Procfile
COPY semoasa.html /app/semoasa.html
COPY shins.js /app/shins.js
COPY updateFromSlate /app/updateFromSlate
COPY package-lock.json /app/package-lock.json
COPY package.json /app/package.json

RUN npm ci

CMD ["bundle", "exec", "middleman", "server", "--force-polling"]

EXPOSE 4567