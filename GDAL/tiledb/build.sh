#!/bin/sh
set -x
mkdir build && cd build
cmake \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DTILEDB_WERROR=OFF \
  -DTILEDB_TESTS=OFF \
  -DTILEDB_INSTALL_LIBDIR=lib \
  -DTILEDB_HDFS=ON \
  -DSANITIZER="OFF;-DCOMPILER_SUPPORTS_AVX2:BOOL=FALSE" \
  -DTILEDB_S3=ON ..
make -j ${CPU_COUNT}
make -C tiledb install

