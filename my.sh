#!/bin/sh

if [ $# -eq 0 ]; then
  echo "Usage: $0 <yarn-target>"
  echo 'Run a yarn target in every subdirectory that has a yarn.lock'
  exit 0
fi

for directory in *; do
  if [ -d "${directory}" ]; then
    cd "${directory}"

    if [ -f "yarn.lock" ]; then
      echo "\n${directory}"
      yarn "$@"
    fi

    cd ..
  fi
done
