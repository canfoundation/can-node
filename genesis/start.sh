#!/bin/bash
DATADIR="./blockchain"
BPACCOUNT=
PUBKEY=EOS6yNeFEiMVartK5M6VZP5KB9vuj1Y4Lt5Xvyp2wGjpHzapdvjc1
PRIKEY=5KewLbtaCEAD8DFrgBfJF8y4BwVpoKGGoKJqLmrgTRB9jFt13xG

if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR;
fi

nodeos \
--signature-provider $PUBKEY=KEY:$PRIKEY \
--plugin eosio::producer_plugin \
--plugin eosio::producer_api_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::history_api_plugin \
--plugin eosio::history_plugin \
--data-dir $DATADIR"/data" \
--blocks-dir $DATADIR"/blocks" \
--config-dir $DATADIR"/config" \
--producer-name $BPACCOUNT \
--http-server-address 127.0.0.1:8888 \
--p2p-listen-endpoint 0.0.0.0:9010 \
--access-control-allow-origin=* \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--enable-stale-production \
--chain-state-db-size-mb 8192 \
--pause-on-startup \
--p2p-peer-address 192.168.111.1:9010 \
--p2p-peer-address 192.168.111.2:9010 \
--p2p-peer-address 192.168.111.3:9010 \
--p2p-peer-address 192.168.111.4:9010 \
--p2p-peer-address 192.168.111.5:9010 \
--p2p-peer-address 192.168.111.6:9010 \
>> $DATADIR"/nodeos.log" 2>&1 & \
echo $! > $DATADIR"/eosd.pid"

