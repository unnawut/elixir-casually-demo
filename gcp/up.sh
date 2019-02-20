#!/bin/sh

export CURDIR=$(dirname "$0")

gcloud compute instances describe elixir-casually-server-1 --zone asia-southeast1-b >/dev/null 2>&1 || \
gcloud compute instances create elixir-casually-server-1 \
  --image elixir-casually-elixir-ruby-go \
  --zone asia-southeast1-b \
  --machine-type=n1-standard-2 \
  --local-ssd interface=nvme \
  --metadata enable-oslogin=TRUE \
  --metadata-from-file startup-script="$CURDIR/provision-server.sh"

gcloud compute instances describe "elixir-casually-runner-master" --zone asia-southeast1-b >/dev/null 2>&1 || \
gcloud compute instances create "elixir-casually-runner-master" \
  --image elixir-casually-elixir-ruby-go \
  --zone asia-southeast1-b \
  --machine-type=n1-standard-2 \
  --metadata enable-oslogin=TRUE \
  --metadata-from-file startup-script="$CURDIR/provision-runner-master.sh"

for i in {2..6}
do
  gcloud compute instances describe "elixir-casually-runner-slave-$i" --zone asia-southeast1-b >/dev/null 2>&1 || \
  gcloud compute instances create "elixir-casually-runner-slave-$i" \
    --image elixir-casually-elixir-ruby-go \
    --zone asia-southeast1-b \
    --machine-type=n1-standard-2 \
    --metadata enable-oslogin=TRUE \
    --metadata-from-file startup-script="$CURDIR/provision-runner-slave.sh"
done
