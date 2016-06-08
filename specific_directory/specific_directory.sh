# 1. alias
# 2. name@hostname
# 3. directory
# specific_directory <alias> <name@hostname> <directory>

printf "alias $1=\'ssh -t $2 \"cd ${3} ; bash\"\'\n" >> ~/.bash_aliases
