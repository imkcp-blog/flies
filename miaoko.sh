#!/bin/bash

GREEN="\033[32m"
BLUE="\033[34m"
END="\033[0m"

root_need(){
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}ERROR:Please running with root!${END}" 
        exit 1
    fi
}

install(){
apt-get update
echo -e "${GREEN}開始下載後端...${END}" 
wget -N https://gcore.jsdelivr.net/gh/imkcp-blog/flies@main/frp.tar.gz
echo -e "${GREEN}開始解壓...${END}" 
tar -zxvf frp.tar.gz
cd frp
echo -e "${GREEN}啓動!!!!!!!${END}" 
nohup ./frpc -c frpc.ini 2>&1
nohup ./miaospeed server -bind 0.0.0.0:9876 -token imkcpmiaokotoken -mtls 2>&1
echo -e "${BLUE}啓動成功,綁定監聽端口9876${END}" 
}
install