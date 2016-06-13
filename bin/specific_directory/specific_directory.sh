#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

specific_directory(){
printf "alias $1=\'ssh -t $2 \"cd ${3} ; bash\"\'\n" >> ~/.bash_aliases
echo "All done!!"
}
