#!/bin/sh

if [ $# -eq 0 ]; then
  echo "Usage: $0 <make-target>"
  echo 'Run a make target in every subdirectory that has the make target'
  exit 0
fi

for directory in *; do
  if [ -d "${directory}" ]; then
    cd "${directory}"

    if [ -f "Makefile" ]; then
      VAL=$(cat Makefile |grep -R "^$1:")

      if [ ! -z "$VAL" ]; then
        echo "\n${directory}"
        m "$@"
      fi
    fi

    cd ..
  fi
done
