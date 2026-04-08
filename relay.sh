#!/bin/bash

if [ "$1" = "send" ]; then
    echo "$2" > outbound/$(date +%s).txt
    git add outbound
    git commit -m "send"
    git push
elif [ "$1" = "recv" ]; then
    git pull
    for f in inbound/*.txt; do
        [ -e "$f" ] || continue
        echo "Message: $(cat $f)"
        rm "$f"
    done
    git add inbound
    git commit -m "clean"
    git push
else
    echo "Usage:"
    echo "./relay.sh send \"message\""
    echo "./relay.sh recv"
fi
