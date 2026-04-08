#!/bin/bash

mkdir -p outbound
msg="$1"
file="outbound/$(date +%s).txt"

echo "$msg" > "$file"

git pull --quiet
git add "$file" --quiet
git commit -m "send message" --quiet
git push --quiet

echo "[SENT] $msg"
