#!/usr/bin/env bash
export PATH="/home/app/.rvm/rubies/ruby-2.4.1/bin/ruby"
eval "$(rbenv init -)"
bundle install --deployment --without development test
bundle exec rake db:migrate RAILS_ENV=production
passenger-config restart-app $(pwd)