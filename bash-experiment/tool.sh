#!/usr/bin/env bash

# ./tool.sh --set-a 123 -b 222 -c xxx

while (( "$#" )); do
  case "$1" in
    -a|--set-a)
      A=$2
      shift 2
      ;;
    -b|--set-b)
      B=$2
      shift 2
      ;;
    -*|--*=)
      echo "Unknown parameter $1" >&2
      exit 1
      ;;
  esac
done

printf "a is '%s'\n" ${A}
printf "b is '%s'\n" ${B}
