FROM ruby:2.5.5
ENV BUNDLER_VERSION=2.0.2
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs less systemd

# alias
RUN echo 'alias ll="ls -laG"' >> /root/.bashrc

ENV APP_HOME /usr/src/app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5

RUN bundle install

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
