#!/bin/sh

#
# Shared provisioning
#

sudo su tuwannu_gmail_com
export HOME=/home/tuwannu_gmail_com

mkdir -p /home/tuwannu_gmail_com/elixir-casually-demo
cd /home/tuwannu_gmail_com/elixir-casually-demo

git status >/dev/null 2>&1 || git clone https://github.com/unnawut/elixir-casually-demo.git .

git reset --hard
git pull origin

mix local.hex --force
mix local.rebar --force
mix deps.get

#
# Specific provisioning
#

MIX_ENV=prod mix phx.server &
