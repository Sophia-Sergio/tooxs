FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev zip unzip
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN gem install bundler

RUN mkdir -p /var/app/tooxs
WORKDIR /var/app/tooxs

COPY ./Gemfile Gemfile
COPY ./package.json package.json

RUN bundle install && yarn install
CMD rails s -p $APP_PORT -b '0.0.0.0'
