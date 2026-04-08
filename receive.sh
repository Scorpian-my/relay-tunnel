#!/bin/bash

git pull

# پردازش پیام‌های ایران (outbound)
for f in outbound/*.txt; do
    [ -e "$f" ] || continue
    echo "Received from Iran: $(cat $f)"

    # انتقال پیام به inbound برای ایران
    echo "$(cat $f)" > inbound/$(basename $f)

    rm "$f"
done

git add inbound outbound
git commit -m "process messages"
git push
