#!/bin/bash

mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D CMAKE_PREFIX_PATH=$PREFIX \
..

make -j $CPU_COUNT
make install
make test

