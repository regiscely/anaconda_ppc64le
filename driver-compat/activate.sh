GREP=`type -P grep`
# cudatoolkit-dev libraries are in the same path as the cudatoolkit libraries
COMPAT_LIB_PATH=${CONDA_PREFIX}/compat:
if ! echo $LD_LIBRARY_PATH | $GREP -q $COMPAT_LIB_PATH; then
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH${LD_LIBRARY_PATH:+:}$COMPAT_LIB_PATH
fi
export LD_LIBRARY_PATH

