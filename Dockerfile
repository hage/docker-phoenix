FROM elixir:alpine

ENV NODE_VERSION 8.9.3-r1
ENV NPM_VERSION 6.1.0

RUN apk add --update --no-cache nodejs=${NODE_VERSION} \
    && npm install npm@${NPM_VERSION} -g \
    && mix local.hex --force \
    && mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez \
    && mix local.rebar --force
WORKDIR /app
