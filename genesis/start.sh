#!/bin/bash
DATADIR="./blockchain"
BPACCOUNT=
PUBKEY=
PRIKEY=

if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR;
fi

nodeos \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--disable-replay-opts \
--plugin eosio::state_history_plugin \
--trace-history \
--chain-state-history \
--state-history-endpoint 0.0.0.0:8080 \
--state-history-dir state-history \
--data-dir $DATADIR"/data" \
--blocks-dir $DATADIR"/blocks" \
--config-dir $DATADIR"/config" \
--producer-name $BPACCOUNT \
--http-server-address 0.0.0.0xw:8888 \
--p2p-listen-endpoint 0.0.0.0:9010 \
--access-control-allow-origin=* \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--chain-state-db-size-mb 16384 \
--pause-on-startup \
--p2p-peer-address 192.168.111.1:9010 \
--p2p-peer-address 192.168.111.2:9010 \
--p2p-peer-address 192.168.111.3:9010 \
--p2p-peer-address 192.168.111.4:9010 \
--p2p-peer-address 192.168.111.5:9010 \
--p2p-peer-address 192.168.111.6:9010 \
>> $DATADIR"/nodeos.log" 2>&1 & \
echo $! > $DATADIR"/eosd.pid"

