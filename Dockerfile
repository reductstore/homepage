FROM ruby:2.7

WORKDIR build
ADD Gemfile .

RUN bundle

ENTRYPOINT ["bundle", "exec", "jekyll"]

