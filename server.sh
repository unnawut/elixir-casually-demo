#!/bin/sh
mix deps.get
mix local.rebar --force
MIX_ENV=prod mix phx.server
