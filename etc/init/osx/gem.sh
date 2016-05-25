#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/lib/vital.sh
. "$DOTPATH"/.zshrc

gem install bundler

cd "$DOTPATH"/etc/init/assets/gem

bundle install --system

log_pass "gem: installed successfully"
