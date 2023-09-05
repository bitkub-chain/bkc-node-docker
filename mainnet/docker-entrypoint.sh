#!/bin/sh

if [ ! -f /etc/bkc/serect/password.txt ]; then
    echo "Ramdom Password!"
    echo $RANDOM | md5sum | head -c 32 > /etc/bkc/serect/password.txt
    geth --datadir /var/lib/bkc/data account new --password /etc/bkc/serect/password.txt
fi

if [ ! -d /var/lib/bkc/data/geth ]; then
    echo "Initial!"
    geth --datadir /var/lib/bkc/data init /etc/bkc/genesis.json
fi

geth $@