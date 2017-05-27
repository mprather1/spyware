chkarg(){
  if [ ! -z ${1+x} ]; then
    return 0
  else
    return 1
  fi
}

if chkarg $2; then
  sudo apt-get install software-properties-common -y && \
  sudo add-apt-repository ppa:certbot/certbot -y && \
  sudo apt-get update && \
  sudo apt-get install certbot -y && \ 
  certbot certonly --standalone --agree-tos -n -d $1 --email $2 
else
  printf "Input Error...\n./auth.sh <domain> <email>"
fi
