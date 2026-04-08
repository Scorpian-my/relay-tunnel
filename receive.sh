#!/bin/bash
git pull
for f in inbound/*.txt; do
    [ -e "$f" ] || continue
    echo "Message: $(cat $f)"
    rm "$f"
done
git add inbound
git commit -m "clean inbound"
git push
