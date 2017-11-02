#!/usr/bin/env bash

mouse_config(){
  printf "\n$(random_color)Mouse configuration${NC}...\n"
  sleep 1
  if [ -f /usr/bin/xinput ]; then
    for id in $(xinput --list | \
              sed -n '/Kingsis Peripherals  Evoluent VerticalMouse 3.*pointer/s/.*=\([0-9]\+\).*/\1/p')
    do
      if [ ! -z ${id+x} ]; then
        printf "Configuring $(random_color)Kingsis Peripherals Evoluent VerticalMouse 3${NC}...\n"
        button_map="xinput set-button-map ${id} 1 2 3 4 5 6 7 9 8"
        touch /home/$user/.xsessionrc
        printf "#!/usr/bin/env bash\n\n${button_map}" > /home/$user/.xsessionrc
      else
        printf "Evoluent VerticalMouse not found...\nskipping...\n"
      fi
    done
  else
    printf "xinput not found...\nskipping...\n"
  fi  
}
