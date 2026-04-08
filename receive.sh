#!/bin/bash

mkdir -p inbound
mkdir -p outbound

git pull --quiet

# دریافت پیام‌های ورودی
for f in inbound/*.txt; do
    [ -e "$f" ] || continue
    echo "[RECEIVED] $(cat "$f")"
    rm "$f"
done

git add inbound --quiet
git commit -m "clean inbound" --quiet || true
git push --quiet
