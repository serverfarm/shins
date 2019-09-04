FROM ruby:onbuild

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

CMD ["bundle", "exec", "middleman", "server", "--force-polling"]

EXPOSE 4567