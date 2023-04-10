FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /dms
WORKDIR /dms

COPY docker-start.sh /usr/bin/
RUN chmod +x /usr/bin/docker-start.sh

COPY Gemfile /dms/Gemfile
COPY Gemfile.lock /dms/Gemfile.lock

RUN bundle check || bundle update --bundler && bundle install --jobs 4
