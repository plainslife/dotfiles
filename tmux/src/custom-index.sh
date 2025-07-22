#!/usr/bin/env bash

format_fill="󰼎󰼏󰼐󰼑󰼒󰼓󰼔󰼕󰼖󰼗"
format_hollow="󰎢󰎥󰎨󰎫󰎲󰎯󰎴󰎷󰎺󰎽"

ID=$1
FORMAT=${2:-none}

# Preserve leading whitespace for bash
format="$(eval echo \"\$format_${FORMAT}\")"

if [ "$FORMAT" = "hide" ]; then
  exit 0
fi

if [ -z "$format" ]; then
  echo "Invalid format: $FORMAT"
  exit 1
fi

for ((i = 0; i < ${#ID}; i++)); do
  DIGIT=${ID:i:1}
  echo -n "${format:DIGIT:1} "
done
