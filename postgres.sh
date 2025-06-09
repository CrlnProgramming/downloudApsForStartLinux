#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y wget curl gnupg2 software-properties-common

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/keyrings/postgresql.gpg

echo "deb [signed-by=/etc/apt/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

sudo apt update
apt list -a postgresql-15
sudo apt install -y postgresql-15=15.12-1.pgdg24.04+1 postgresql-client-15=15.12-1.pgdg24.04+1

psql --version
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo apt-mark hold postgresql-15 postgresql-client-15
