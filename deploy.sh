#!/usr/bin/env bash
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
bundle install --deployment --without development test
bundle exec rake db:migrate RAILS_ENV=production
passenger-config restart-app $(pwd)