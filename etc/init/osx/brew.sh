#!/bin/bash

trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

. "$DOTPATH"/etc/lib/vital.sh

if has "brew"; then
  log_pass "brew: already installed"
  exit
fi

if ! has "ruby"; then
  log_fail "error: require: ruby"
  exit 1
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if has "brew"; then
  brew doctor
else
  log_fail "error: brew: failed to install"
  exit 1
fi

cd "$DOTPATH"/etc/init/assets/brew

brew tap Homebrew/bundle
brew bundle

brew cleanup

. "$DOTPATH"/etc/init/osx/rbenv.sh

log_pass "brew: installed successfully"
