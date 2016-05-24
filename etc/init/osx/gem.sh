#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

gem install bundler

cd "$DOTPATH"/etc/init/assets/gem

bundle install --system
