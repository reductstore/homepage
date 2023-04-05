FROM ruby:2.7

RUN gem update --system

WORKDIR build
ADD Gemfile .

RUN bundle

ENTRYPOINT ["bundle", "exec", "jekyll"]

