#!/bin/zsh

# set page number if not specified
if [[ $2 -gt 0 ]]; then
  2=$2
elif [[ $2 -lt 0 ]]; then
  2=1
elif [[ $2 == 0 ]]; then
  2=1
else
  2=1
fi

if [ -z "$2" ]; then
  echo "downwalp query page"
  echo "example:"
  echo "downwalp landscape 3"
  echo "this will search wallhaven for 'landscape' pictures on page '3'"
else
  curl -s "https://wallhaven.cc/api/v1/search?q=$1&page=$2" | jq '.data[].path' | xargs -I{} wget {}
fi
