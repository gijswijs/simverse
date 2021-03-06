#!/usr/bin/env bash

source lib/init.sh
source lib/report.sh
source lib/utils.sh

# wait for bitcoin node to open its RPC interface
LIGHTNING_BITCOIN_RPC_HOST=${LIGHTNING_BITCOIN_RPC_HOST:?required}
SERVICE_READY_PORT=${SERVICE_READY_PORT:?required}
echo "Waiting for bitcoin node $LIGHTNING_BITCOIN_RPC_HOST to get ready..."
wait_for_socket "$SERVICE_READY_PORT" "$LIGHTNING_BITCOIN_RPC_HOST"

get-ready.sh &

exec lightningd.sh