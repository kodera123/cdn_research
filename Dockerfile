FROM ruby:2.5.5
ENV BUNDLER_VERSION=2.0.2
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs less systemd npm

# alias
RUN echo 'alias ll="ls -laG"' >> /root/.bashrc

ENV APP_HOME /usr/src/app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME/

RUN gem install bundler && bundle install --jobs 20 --retry 5
RUN npm install yarn -g

RUN bundle install
RUN bundle exec rake assets:precompile
