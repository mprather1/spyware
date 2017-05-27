source $(dirname $0)/../../data.sh;

if chkarg $2; then
  if repo_not_installed ppa:certbot/certbot; then
    sudo apt-get install software-properties-common -y && \
    sudo add-apt-repository ppa:certbot/certbot -y && \
    sudo apt-get update && \
    sudo apt-get install certbot -y && \ 
    sudo certbot certonly --standalone --agree-tos -n -d $1 --email $2   
  fi
else
  printf "Input Error...\n./auth.sh <domain> <email>"
fi
