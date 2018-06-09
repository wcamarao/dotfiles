#!/bin/sh

if [ $# -eq 0 ]; then
  echo "Usage: $0 <git-command>"
  echo 'Run a git command on every subdirectory that is a git repository'
  exit 0
fi

for directory in *; do
  if [ -d "${directory}" ]; then
    cd "${directory}"

    if [ -d .git ]; then
      echo "\n${directory}"
      git $@
    fi

    cd ..
  fi
done
