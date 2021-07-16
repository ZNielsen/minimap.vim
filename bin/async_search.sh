#!/bin/bash

query="$1"
file="$2"
ret=""

matches=$(rg --column --only-matching "$query" "$file")
for match in $matches; do
    line=$(echo "$match" | cut -d ":" -f 1)
    col=$(echo "$match" | cut -d ":" -f 2)
    text=$(echo "$match" | cut -d ":" -f 3)
    text_len=${#text}
    this_ret=$line:$col:$text_len
    ret+="$this_ret,"
done
ret=${ret%,}
echo $ret
