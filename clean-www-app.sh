#!/bin/bash

dir=$(pwd)

sudo service nginx stop

echo flush_all | nc localhost 11211

cd
cd Code/otb/otb_www_app/
rm -rf tmp/cache/
bundle
bundle exec rake db:migrate
git checkout db/structure.sql

nginx=$(sudo service nginx start)

cd $dir

notify-send -t 2000 "WWW Cleaned." "Nginx restarted, cache flushed and db migrations run."
exit
