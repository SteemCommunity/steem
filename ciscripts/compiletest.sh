#!/usr/bin/env bash

free -h

mtime_cache **/*.{%{cpp}} -c .mtime_cache/cache.json

free -h


export CC="ccache gcc"
export CXX="ccache g++"
export CCACHE_DIR=.ccache
# Set max cache size so we don't carry old objects for too long
ccache -M 250M

export CXXFLAGS="$(CXXFLAGS) --param ggc-min-expand=0 --param ggc-min-heapsize=8192"

ccache -z

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE_TESTING=ON \
-DBUILD_STEEM_TESTNET=ON -DLOW_MEMORY_NODE=OFF -DCLEAR_VOTES=ON -DSKIP_BY_TX_ID=ON -DCHAINBASE_CHECK_LOCKING=OFF ..

free -h

make -j1 steemd chain_test plugin_test test_fixed_string

free -h
