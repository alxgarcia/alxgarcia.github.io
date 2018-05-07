FROM ruby:2.5-alpine

RUN apk add --update make gcc g++ libc-dev
RUN gem install bundler

COPY Gemfile Gemfile
RUN bundle install

RUN mkdir -p /var/www/blog

WORKDIR /var/www/blog
EXPOSE 4000
CMD bundle exec jekyll serve --incremental --host 0.0.0.0

