## Create a Swap File on Ubuntu

### Check if swap is configured

    sudo swapon -s 

### Check for memory

    free -m 

### Create swap file
  
#### using fallocate

    sudo fallocate -l 4G /swapfile
    
  #### or using dd

    sudo dd if=/dev/zero of=/swapfile bs=1G count=4    

  ### Enable swap file

    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    
  
### Edit /etc/fstab

    /swapfile   none    swap    sw    0   0
    
    