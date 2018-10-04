#!/usr/bin/env bash

export BOOST_ROOT=$HOME/opt/boost_1_60_0
ls -al "$BOOST_ROOT"
ls -al .
if find "$BOOST_ROOT" -mindepth 1 | read; then
    echo "boost cached!"
else
    echo "boost not cached, compiling!"
    URL='http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download'
    wget -c "$URL" -O boost_1_60_0.tar.bz2
{
    tar xjf boost_1_60_0.tar.bz2
    cd boost_1_60_0
    ./bootstrap.sh "--prefix=$BOOST_ROOT"
    ./b2 install
} > /dev/null
fi
