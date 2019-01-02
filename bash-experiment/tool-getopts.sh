#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/129391/passing-named-arguments-to-shell-scripts
# ./tool-getopts.sh -a xxx -b yyy
# 1. Only 1-letter argument names work
# 2. You can't make it accept -- instead of -
while getopts ":a:b:" opt; do
  case ${opt} in
    a) aValue="$OPTARG"
    ;;
    b) bValue="$OPTARG"
    ;;
    \?) echo "Unknown option -$OPTARG" >&2
    ;;
  esac
done

printf "aValue is '%s'\n" ${aValue}
printf "bValue is '%s'\n" ${bValue}
