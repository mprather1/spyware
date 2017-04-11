#!/usr/bin/env bash

mouse_config(){
  echo $user
  for id in $(xinput --list | \
            sed -n '/Kingsis Peripherals  Evoluent VerticalMouse 3.*pointer/s/.*=\([0-9]\+\).*/\1/p')
  do
    if [ ! -z ${id+x} ]; then
      echo "Configuring Kingsis Peripherals Evoluent VerticalMouse 3..."
      button_map="xinput set-button-map ${id} 1 2 3 4 5 6 7 9 8"
      touch /home/$user/.xsessionrc
      printf "#!/usr/bin/env bash\n\n${button_map}" > /home/$user/.xsessionrc
    else
      echo "Evoluent VerticalMouse not found, skipping mouse configuration..."
    fi
  done
}
