FROM ruby:2.7.2-slim-buster
ARG USER_ID
ARG GROUP_ID

# Explicitely define locale
ENV LANG="C.UTF-8"
ENV BUNDLE_JOBS=4 \
  BUNDLE_PATH="/app/.bundle" \
  BUNDLE_APP_CONFIG="/app/.bundle" \
  GEM_HOME="/app/.gems" \
  PORT=3000
ENV USER_ID "$USER_ID"
ENV GROUP_ID "$GROUP_ID"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN addgroup --gid ${GROUP_ID} app || true
RUN adduser --home /app --uid ${USER_ID} --gid ${GROUP_ID} --disabled-password --gecos "" app
RUN apt-get update -qq && apt-get install -y apt-transport-https curl gnupg-agent
# Needed by node-gyp required by node-sass on debian
RUN apt-get -y install python2
RUN curl -sL https://salsa.debian.org/postgresql/postgresql-common/raw/master/pgdg/apt.postgresql.org.sh | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# When we want to deploy manually
# RUN curl https://cli-assets.heroku.com/install.sh | sh
# RUN gem install dpl dpl-heroku

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libnotify-dev libxml2-dev \
      libxslt1-dev postgresql-client-11 less yarn git && apt-get clean

# Install GEM dependencies
RUN gem update --system && gem install foreman:0.84.0 bundler awesome_print

VOLUME /app

WORKDIR /app

# Expose listening port to the Docker host, so we can access it from the outside.
EXPOSE 3000
