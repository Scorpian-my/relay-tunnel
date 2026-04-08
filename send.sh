#!/bin/bash
msg="$1"
file="outbound/$(date +%s).txt"
echo "$msg" > "$file"
git add "$file"
git commit -m "send message"
git push
