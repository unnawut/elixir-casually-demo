#!/bin/sh
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb && rm erlang-solutions_1.0_all.deb
apt update
apt install build-essential esl-erlang elixir -y
