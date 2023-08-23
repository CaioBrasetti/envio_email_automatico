#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bin/rails db:environment:set RAILS_ENV=production
bundle exec rake db:drop
bundle exec rake db:setup
bundle exec rake db:schema:load
