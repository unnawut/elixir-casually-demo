#!/bin/sh
mix deps.get
mix local.rebar --force
mix run -e 'LoadTester.run()'
