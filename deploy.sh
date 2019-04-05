#!/usr/bin/env bash
docker exec -it rnserverunicef bash
su - app
cd cd projects/api.escolas.testes.buscaativaescolar.org.br
bundle install --deployment --without development test
bundle exec rake db:migrate RAILS_ENV=production
passenger-config restart-app $(pwd)