echo "Checking for id_rsa..."
if [ -f ~/.ssh/id_rsa ]
  then
    echo "Enter eamil address"
    read email
    echo "Creating rsa key...
    "
    ssh-keygen -t rsa -b 4096 -C "'${email}'"
  else
    echo "id_rsa already exists"
    echo "skipping..
    "
fi
