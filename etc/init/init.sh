#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Caution rbenv.sh, gem.sh dependant on brew.sh
. "$DOTPATH"/etc/init/osx/brew.sh
. "$DOTPATH"/etc/init/osx/rbenv.sh
. "$DOTPATH"/etc/init/osx/gem.sh
