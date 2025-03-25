#!/bin/bash

if [ $# -eq 0 ]; then
  npm clean-install -ddd
  npm run dev
else
    # Command was sent, execute it
    exec "$@"
fi
