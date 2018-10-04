#!/usr/bin/env bash

export BOOST_ROOT=$HOME/opt/boost_1_60_0
ls -al "$BOOST_ROOT"
ls -al .
if [ ! -d "boost_1_60_0" ]; then
    URL='http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download'
    wget -c "$URL" -O boost_1_60_0.tar.bz2
#{
    tar xjf boost_1_60_0.tar.bz2
    cd boost_1_60_0
    ./bootstrap.sh "--prefix=$BOOST_ROOT"
    ./b2 install
#} > /dev/null
fi
