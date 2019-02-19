#!/bin/sh

INSTANCE_NAMES=(
    "elixir-casually-server-1"
    "elixir-casually-runner-master"
    "elixir-casually-runner-slave-1"
    "elixir-casually-runner-slave-2"
    "elixir-casually-runner-slave-3"
    "elixir-casually-runner-slave-4"
    "elixir-casually-runner-slave-5"
    "elixir-casually-runner-slave-6"
    "elixir-casually-runner-slave-7"
    "elixir-casually-runner-slave-8"
    "elixir-casually-runner-slave-9"
)

for NAME in INSTANCE_NAMES
do
  gcloud compute instances delete "$NAME" \
    --zone asia-southeast1-b \
    --quiet \
    2>/dev/null || echo "Instance $NAME not found. Skipping."
done
