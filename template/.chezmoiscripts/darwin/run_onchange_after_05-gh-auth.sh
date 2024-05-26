#!/bin/bash

/opt/homebrew/bin/gh auth status
if [ $? -gt 0 ]; then
  /opt/homebrew/bin/gh auth login --web --git-protocol https
else
  echo "logged in, skipping."
fi

