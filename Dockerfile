FROM ruby:3.2.2 AS drkiq-development

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./


RUN bundle install
RUN yarn install

COPY . /usr/src/app