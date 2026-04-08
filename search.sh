#!/bin/bash

mkdir -p requests

read -p "Search query: " query

file="requests/$(date +%s).txt"
echo "$query" > "$file"

git pull >/dev/null 2>&1
git add "$file" >/dev/null 2>&1
git commit -m "new search request" >/dev/null 2>&1
git push >/dev/null 2>&1

echo "[REQUEST SENT] $query"
