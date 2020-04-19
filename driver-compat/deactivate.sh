GREP=`type -P grep`
COMPAT_LIB_PATH=${CONDA_PREFIX}/compat
path_remove() {
  local LPATH=$1
  if [[ ! -z "$LPATH" && ! -z "$2" ]]; then
    if echo $LPATH | $GREP -q $2; then
      LPATH=${LPATH//":$2:"/":"} # Delete any instance in the middle
      LPATH=${LPATH/#"$2:"/} # Delete any instance at the beginning
      LPATH=${LPATH/%":$2"/} # Delete any instance at the end
      if [[ $LPATH == "$2" ]]; then
        LPATH=""
      fi
    fi
  fi
  echo "$LPATH"
}

LD_LIBRARY_PATH=$(path_remove $LD_LIBRARY_PATH $COMPAT_LIB_PATH)
if [ ! -z "$LD_LIBRARY_PATH" ]; then
  export LD_LIBRARY_PATH
else
  unset LD_LIBRARY_PATH
fi

