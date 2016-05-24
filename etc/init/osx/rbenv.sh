#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash
