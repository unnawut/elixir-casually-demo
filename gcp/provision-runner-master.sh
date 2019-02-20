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

ulimit -n 64000

#
# Specific provisioning
#

# cd elixir-casually-demo
# iex --sname "runner" --cookie "elixir-casually" -S mix run -e 'Chaperon.Master.start()'
# LoadTester.run()
# Application.put_env(:load_tester, :num_clients, 500)
