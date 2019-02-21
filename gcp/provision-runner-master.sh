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

cd elixir-casually-demo
mix compile

# For ease of demoing, we'll exit here. The rest will be run manually.
exit 0

#
# Specific provisioning
#

ulimit -n 64000
cd elixir-casually-demo
iex --sname "runner" --cookie "elixir-casually" -S mix run -e 'Chaperon.Master.start()'
LoadTester.run("http://localhost:5000", num_clients: 10, requests_per_sec: 10, duration: 10)
