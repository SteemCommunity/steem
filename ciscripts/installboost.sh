#!/usr/bin/env sh

export BOOST_ROOT=$HOME/opt/boost_1_60_0
URL='http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download'
wget -c "$URL" -O boost_1_60_0.tar.bz2
[ $( sha256sum boost_1_60_0.tar.bz2 | cut -d ' ' -f 1 ) == \
    "686affff989ac2488f79a97b9479efb9f2abae035b5ed4d8226de6857933fd3b" ] \
    || ( echo 'Corrupt download' ; exit 1 )
tar xjf boost_1_60_0.tar.bz2
cd boost_1_60_0
./bootstrap.sh "--prefix=$BOOST_ROOT"
./b2 install