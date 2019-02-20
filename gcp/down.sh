#!/bin/sh

INSTANCE_NAMES=(
    "elixir-casually-server-1"
    "elixir-casually-runner-master"
    "elixir-casually-runner-1"
    "elixir-casually-runner-2"
    "elixir-casually-runner-3"
    "elixir-casually-runner-4"
    "elixir-casually-runner-5"
    "elixir-casually-runner-6"
    "elixir-casually-runner-7"
    "elixir-casually-runner-8"
    "elixir-casually-runner-9"
)

for NAME in $INSTANCE_NAMES
do
  gcloud compute instances delete "$NAME" \
    --zone asia-southeast1-b \
    --quiet \
    2>/dev/null || echo "Instance $NAME not found. Skipping."
done
