#!/usr/bin/env sh

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -Wno-maybe-uninitialized ..
make -j$(nproc) steemd cli_wallet chain_test plugin_test
