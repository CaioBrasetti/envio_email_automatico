#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec bin/rails db:prepare
bundle exec rails db:migrate
