#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/lib/vital.sh
. "$DOTPATH"/.zshrc

rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash

log_pass "rbenv: installed successfully"
