#!/bin/bash

apt-get update -y && apt-get full-upgrade -y && apt-get autoremove -y && apt-get autoclean -y

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

apt-get install -y \
    git \
    vim \
    unzip \
    smartmontools \
    net-tools \
    nmap \
    python3.10 \
    python3-pip \
    golang-go \
    htop \
    mono-complete \
    uidmap # mapping uid процессов (или shadow-utils)
    #nuget
    #dotnet-sdk-7.0 \

echo "Install nuget"
wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O nuget.exe
chmod +x nuget.exe
sudo mv nuget.exe /usr/local/bin/nuget

echo "Install docker-compose"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -
 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

usermod -aG docker $USER

#echo "Install minio client for backups"
#wget https://dl.min.io/client/mc/release/linux-amd64/mc -O ~/mc
#sudo chmod +x ~/mc && mv ~/mc /usr/local/bin/
#mc --version

#pip3 install ansible \ 
#    netaddr
