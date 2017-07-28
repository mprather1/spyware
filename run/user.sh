#!/usr/bin/env bash
source $(directory)/run/bcrypt/script.sh

create_user(){
  printf "\nCreate user...\n"
  printf "\nEnter new username and password...\n"

  i=1
  while [ $i = 1 ]; do
    echo "Enter username..."
    read -p "${prompt}" c9Username
    if [ -n "$c9Username" ]; then
      i=0
    else
      printf '\nError...\nplease enter username...\n\n'
    fi
  done
  
  i=1
  while [ $i = 1 ]; do
    printf "\nEnter password...\n"
    read -s -p "${prompt}" password
    printf "\nEnter password again...\n"
    read -s -p "${prompt}" password2  
    
    if [ -n "$password" ] && [ -n "$password2" ]; then
      if [ $password = $password2 ]; then
        encrypted_password=$(get_encrypted_password $password)
        c9Password=$password
        touch $(directory)/data/users.json
        sed -i '$ d' $(directory)/data/users.json && \
        sed -i '${s/$/,/}' $(directory)/data/users.json && \
        printf "  {\"username\": \"${c9Username}\", \"password\": \"${encrypted_password}\"}\n]" >> $(directory)/data/users.json
        i=0
      else
        printf "\nError...\nPasswords do not match...\n"
      fi
    else
      printf "\nError...\nplease enter password...\n"
    fi
  done

}
