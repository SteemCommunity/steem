#!/usr/bin/env bash

export CXX=g++-5
export CC=gcc-5

if [ -d "${BOOST_ROOT}/lib" ]; then
    echo "boost cached!"
    cd boost_1_60_0
    ./bootstrap.sh "--prefix=$BOOST_ROOT"
    ./b2 install
    echo "installing boost done!"
else
    echo "boost not cached!"
    URL='http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download'
    wget -nv -c "$URL" -O boost_1_60_0.tar.bz2
    echo "extracting boost, can take a while..."
    tar xjf boost_1_60_0.tar.bz2
    echo "extracting boost done!"
    cd boost_1_60_0
    echo "configuring boost, can take a while..."
    ./bootstrap.sh "--prefix=$BOOST_ROOT"
    echo "configuring boost done!"
    echo "installing boost, can take a while..."
    ./b2 install | pv -l -i 10 -s 14209 -f | wc -l
    echo "installing boost done!"
    echo "boost compilation finished!"
fi
