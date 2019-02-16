#!/bin/sh
mix deps.get
mix local.rebar --force
mix local.hex --force
mix run -e 'LoadTester.run("http://server-1:5000")'
