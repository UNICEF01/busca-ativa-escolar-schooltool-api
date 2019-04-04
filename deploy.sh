#!/bin/bash

USERNAME=app
HOST="localhost -p 32769"
SCRIPT="cd projects/api.escolas.testes.buscaativaescolar.org.br; bundle install --deployment --without development test; bundle exec rake db:migrate RAILS_ENV=production; passenger-config restart-app $(pwd)"

ssh -l ${USERNAME} ${HOST} "${SCRIPT}"
