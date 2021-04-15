#!/usr/bin/env sh

# Treat unset variables as an error.
set -u

export HOME=/config

cd $HOME || exit

anki --no-sandbox