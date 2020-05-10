#!/bin/bash

# Specific environement build
# Modify LD_LIBRARY_PATH QMAKE_PATH according to your qt5.14.1 installation
# Maybe module load is sufficient

#export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
#export QMAKE_PATH=/usr/local/Qt-5.14.1/bin/qmake

if [ `uname` == Darwin ]; then
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
    MAKE_JOBS=$(sysctl -n hw.ncpu)
fi

if [ `uname` == Linux ]; then
    MAKE_JOBS=$CPU_COUNT
fi

$PYTHON configure.py \
        --verbose \
        --confirm-license \
        --assume-shared 
#        -q /usr/local/Qt-5.14.1/bin/qmake

make -j $MAKE_JOBS
make install

