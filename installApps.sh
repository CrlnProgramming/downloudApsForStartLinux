#!/bin/bash

apt-get update -y && apt-get full-upgrade -y && apt-get autoremove -y && apt-get autoclean -y

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

apt-get install -y \
    git \
    vim \
    dotnet-sdk-7.0 \
    unzip \
    smartmontools \
    net-tools \
    nmap \
    python3.10 \
    python3-pip \
    golang-go \
    nuget

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -
 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

usermod -aG docker $USER


