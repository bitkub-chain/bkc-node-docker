#!/bin/sh

if [ ! -d /bkc-node/data/geth ]; then
    geth --datadir /bkc-node/data  init /bkc-node/genesis.json
fi

if [ ! -z "$NODE_KEY" ] ; then
    echo "$NODE_KEY" > /bkc-node/data/node.key
    nodekey="--nodekey=/bkc-node/data/node.key"
fi

if [ ! -z "$HOSTNAME" ] ; then
    identity="--identity=${HOSTNAME}"
fi

if [ ! -z "$BOOTNODES" ] ; then
    bootnodes="--bootnodes=${BOOTNODES}"
fi

if [ ! -z "$CACHE" ] ; then
    cache="--cache=${CACHE}"
fi

if [ -z "$STATS_SERVER" ] && [ -z "$STATS_PASSWORD" ]; then 
    echo 'no set stats server.'
else
    ethstats="--ethstats=${HOSTNAME}:${STATS_PASSWORD}@${STATS_SERVER}"
fi

geth $identity $nodekey $cache $ethstats $bootnodes "$@"