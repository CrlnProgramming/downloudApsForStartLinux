#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y wget curl gnupg2 software-properties-common

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/keyrings/postgresql.gpg

echo "deb [signed-by=/etc/apt/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

sudo apt update
sudo apt install -y postgresql-15 postgresql-client-15

export PATH="/usr/lib/postgresql/15/bin:$PATH"
psql --version

sudo ln -sf /lib/systemd/system/postgresql@15-main.service /etc/systemd/system/postgresql.service
sudo systemctl daemon-reload

sudo systemctl enable postgresql
sudo systemctl start postgresql

sudo apt-mark hold postgresql-15 postgresql-client-15

echo "Проверка статуса PostgreSQL:"
sudo systemctl status postgresql --no-pager

echo "PostgreSQL 15 успешно установлен и работает!"
echo "Подключиться к серверу: sudo -u postgres psql"
