#!/usr/bin/env bash
echo "create pg database"
bundle exec rake db:create

echo "run rails db migradtions"
bundle exec rake db:migrate

# echo "seed database"
# bundle exec rake db:seed

echo "Running BUNDLE INSTALL for rails..."
bundle check || bundle install

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

echo "Starting rails app server ..."
bin/dev
