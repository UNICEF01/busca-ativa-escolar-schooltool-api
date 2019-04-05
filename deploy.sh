#!/usr/bin/env bash
ssh -t app@localhost -p 32769 "cd projects/api.escolas.testes.buscaativaescolar.org.br; bundle install --deployment --without development test; exit"
ssh -t app@localhost -p 32769 "cd projects/api.escolas.testes.buscaativaescolar.org.br; bundle exec rake db:migrate RAILS_ENV=production; exit"
ssh -t app@localhost -p 32769 "cd projects/api.escolas.testes.buscaativaescolar.org.br; passenger-config restart-app $(pwd); exit"
