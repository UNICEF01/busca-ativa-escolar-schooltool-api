#!/usr/bin/env bash
export PATH="/home/app/.rvm/gems/ruby-2.4.1/bin:/home/app/.rvm/gems/ruby-2.4.1@global/bin:/home/app/.rvm/rubies/ruby-2.4.1/bin:/home/app/bin:/home/app/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/app/.rvm/bin:/home/app/.rvm/bin"
bundle install --deployment --without development test
bundle exec rake db:migrate RAILS_ENV=production
passenger-config restart-app $(pwd)