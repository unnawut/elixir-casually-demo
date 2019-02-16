#!/bin/sh
./runner-base.sh

elixir --cookie "elixir-meetup-demo-2019" --sname "runner" \
  -S mix run -e 'Chaperon.connect_to_master(:"runner@runner-1")' --no-halt
