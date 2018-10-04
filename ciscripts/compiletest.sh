#!/usr/bin/env sh

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_COVERAGE_TESTING=ON \
-DBUILD_STEEM_TESTNET=ON -DLOW_MEMORY_NODE=OFF -DCLEAR_VOTES=ON -DSKIP_BY_TX_ID=ON -DCHAINBASE_CHECK_LOCKING=OFF ..
make -k -j$(nproc) steemd cli_wallet chain_test plugin_test
