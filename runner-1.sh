#!/bin/sh
./runner-base.sh

iex --cookie "elixir-meetup-demo-2019" --sname "runner" -S mix

# Then run...
# Chaperon.Master.start()
# LoadTester.run("http://server-1:5000")
