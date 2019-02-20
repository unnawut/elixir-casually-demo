#!/bin/sh

#
# Shared provisioning
#

export HOME=/home/tuwannu_gmail_com

touch /var/log/elixir-casually.log
chmod a+rw /var/log/elixir-casually.log

mkdir -p /home/tuwannu_gmail_com/elixir-casually-demo
cd /home/tuwannu_gmail_com/elixir-casually-demo

git status >/dev/null 2>&1 || git clone https://github.com/unnawut/elixir-casually-demo.git .

git reset --hard
git pull origin

mix local.hex --force
mix local.rebar --force
mix deps.get

chown -R tuwannu_gmail_com .

#
# Specific provisioning
#

elixir --sname "runner" --cookie "elixir-casually" \
  -S mix run -e 'Chaperon.connect_to_master(:"runner@elixir-casually-runner-master")' > /var/log/elixir-casually.log 2>&1 --no-halt
