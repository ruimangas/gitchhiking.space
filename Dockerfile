FROM ruby:2.2.2

RUN apt-get update && apt-get install -y net-tools && apt-get install -y nodejs

ENV APP_HOME /app
ENV HOME /root

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME

EXPOSE 3000

CMD rm -f tmp/pids/server.pid && rails server -b 0.0.0.0
