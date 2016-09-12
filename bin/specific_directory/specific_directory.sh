#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

specific_directory(){
  if chkarg $3; then
    printf "alias $1=\'ssh -t $2 \"cd ${3} ; bash\"\'\n" >> ~/.bash_aliases
    printf "\nAll done!!\n"
  else
    printf "Input Error...\n\"specific <alias> <user@hostname> <directory>\"\n"
  fi
}
