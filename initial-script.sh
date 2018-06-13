#!/bin/sh
docker-compose run --rm web /bin/sh -c 'mix phx.new . --app my_app'
sed -iE 's/hostname:.*/hostname: "db",/' config/dev.exs
docker-compose up -d
docker-compose run --rm web /bin/sh -c "mix deps.compile && mix ecto.create && mix ecto.migrate"
docker-compose stop
