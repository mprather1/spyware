chkarg(){
  if [ ! -z ${1+x} ]; then
    return 0
  else
    return 1
  fi
}
