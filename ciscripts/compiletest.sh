#!/usr/bin/env bash

#gcc --version

#export CXX=g++-5
#export CC=gcc-5

#gcc --version

#ls -la /usr/bin/ | grep -oP "[\S]*(gcc|g\+\+)(-[a-z]+)*[\s]" | xargs bash -c 'for link in ${@:1}; do sudo ln -s -f "/usr/bin/${link}-${0}" "/usr/bin/${link}"; done' 5

gcc --version

dpkg -l | grep gcc | awk '{print $2}'
#update-alternatives --set gcc "/usr/bin/gcc-5"
#update-alternatives --set g++ "/usr/bin/g++-5"

#gcc --version

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_COVERAGE_TESTING=ON \
-DBUILD_STEEM_TESTNET=ON -DLOW_MEMORY_NODE=OFF -DCLEAR_VOTES=ON -DSKIP_BY_TX_ID=ON -DCHAINBASE_CHECK_LOCKING=OFF ..
make -j$(nproc) steemd cli_wallet chain_test plugin_test
