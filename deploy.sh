#!/usr/bin/env bash
bundle install --deployment --without development test
bundle exec rake db:migrate RAILS_ENV=production
passenger-config restart-app $(pwd)