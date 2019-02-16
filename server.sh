#!/bin/sh
mix deps.get
mix local.rebar --force
mix local.hex --force
MIX_ENV=prod mix phx.server
