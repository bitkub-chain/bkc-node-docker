#!/bin/sh

if [ ! -d /bkc-node/data/geth ]; then
    echo "/bkc-node/data/geth not found, running 'geth init'..."
    geth --datadir /bkc-node/data  init /bkc-node/genesis.json
    echo "...done!"
fi

if [ ! -z "$BOOTNODE_KEY" ] ; then
    echo "$BOOTNODE_KEY" > /bkc-node/data/node.key
    nodekey="--nodekey=/bkc-node/data/node.key"
fi

if [ ! -z "$HOSTNAME" ] ; then
    identity="--identity=${HOSTNAME}"
fi

if [ ! -z "$CACHE" ] ; then
    cache="--cache=${CACHE}"
fi

if [ -z "$STATS_SERVER" ] && [ -z "$STATS_PASSWORD" ]; then 
    echo 'no set stats server.'
else
    ethstats="--ethstats=${HOSTNAME}:${STATS_PASSWORD}@${STATS_SERVER}"
fi

geth $identity $nodekey $cache $ethstats "$@"