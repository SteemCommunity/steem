#!/usr/bin/env bash

mtime_cache **/*.{%{cpp}} -c .mtime_cache/cache.json

free -m

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_COVERAGE_TESTING=ON \
-DBUILD_STEEM_TESTNET=ON -DLOW_MEMORY_NODE=OFF -DCLEAR_VOTES=ON -DSKIP_BY_TX_ID=ON -DCHAINBASE_CHECK_LOCKING=OFF ..
make -j1 steemd chain_test plugin_test
