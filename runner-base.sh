#!/bin/sh
mix deps.get
mix local.rebar --force
mix local.hex --force
echo "elixir-meetup-demo-2019" > ~/.erlang.cookie
chmod 600 ~/.erlang.cookie
