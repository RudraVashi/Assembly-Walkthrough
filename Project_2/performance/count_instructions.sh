#!/bin/bash
FILE=$1

if [ -z "$FILE" ]; then
    echo "Usage: $0 <file.s>"
    exit 1
fi

COUNT=$(grep -v '^\s*\.' "$FILE" \
  | grep -v '^\s*;' \
  | grep -v '^\s*$' \
  | grep -v '^[a-zA-Z_][a-zA-Z0-9_]*:' \
  | wc -l | tr -d ' ')

echo "$FILE: $COUNT instructions"