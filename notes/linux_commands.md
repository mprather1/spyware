## Linux Commands

#### List number of files in directory

    ls | wc -l
    ls *.xml | wc -l
  
#### Find 

    find . -type f -name filename
    
#### rbind

    sudo mount --rbind /media/ /home/mike/storage