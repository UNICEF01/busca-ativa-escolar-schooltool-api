#!/usr/bin/env bash
ssh app@localhost -p 32769 sh -c "cd projects/api.escolas.testes.buscaativaescolar.org.br; bundle install --deployment --without development test; bundle exec rake db:migrate RAILS_ENV=production; passenger-config restart-app $(pwd); $PATH"


