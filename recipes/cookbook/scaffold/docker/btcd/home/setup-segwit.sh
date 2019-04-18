#!/usr/bin/env bash

source lib/init.sh

BTCD_COUNTER=${BTCD_COUNTER}

# mine for segwit activation only on first node
if [[ ! "$BTCD_COUNTER" -eq 1 ]]; then
  exit 0
fi

# Prevent: "has witness data, but segwit isn't active yet"
#  "This means that the block height of the simnet blockchain is not high enough.
#   The threshold for segwit activation is 300 blocks on simnet."
# source: https://degreesofzero.com/article/shared-private-lightning-network.html
NUM_BLOCKS_REQUIRED=500
BLOCKS=$(./btcctl.sh getblockcount)
if [[ "$BLOCKS" -lt "$NUM_BLOCKS_REQUIRED" ]]; then
  echo "Activating segwit..."
  ./btcctl.sh generate ${NUM_BLOCKS_REQUIRED}
fi