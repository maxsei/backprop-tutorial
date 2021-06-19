#!/usr/bin/env sh

set -e
for notebook in *.ipynb; do
  echo "$notebook"
  cat "$notebook" | jq '.cells[].outputs |= []' | jq '.cells[].execution_count |= null' > out.json && mv out.json "$notebook"
done
