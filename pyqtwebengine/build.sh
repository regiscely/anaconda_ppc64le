#!/bin/bash


# To be adapted to your local environment
export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/Qt-5.14.1/lib:$LD_LIBRARY_PATH



if [ `uname` == Darwin ]; then
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
    MAKE_JOBS=$(sysctl -n hw.ncpu)
fi

if [ `uname` == Linux ]; then
    MAKE_JOBS=$CPU_COUNT
fi


$PYTHON configure.py \
        --verbose \
        -q /usr/local/Qt-5.14.1/bin/qmake

make -j $MAKE_JOBS
make install

