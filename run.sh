#!/bin/bash

set -o errexit

go build -o bin/evm-tx-load-gen

set -a
source .env
set +a
echo $TRAFFIC_GENERATOR_HOSTNAME
./bin/evm-tx-load-gen

