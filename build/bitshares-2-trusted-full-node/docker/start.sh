#!/bin/bash

witness_node \
     --p2p-endpoint="0.0.0.0:9090" \
     --data-dir=/data_trusted_node/ \
     --rpc-endpoint="0.0.0.0:8090"
