#!/usr/bin/env sh

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc) steemd
make -j$(nproc) cli_wallet