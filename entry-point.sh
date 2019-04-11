#!/bin/bash

cd /var/app/tooxs
echo "Limpiando server.pid"
rm -fr tmp/pids/server.pid 

bundle install && yarn install
rails db:migrate && rails s -p $APP_PORT -b '0.0.0.0'
