#!/bin/bash

#apt-get install -f
apt update && apt upgrade -y

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/keyrings/postgresql.gpg
apt-get install -y postgresql-15 postgresql-client-15 postgresql-contrib-15

echo "Проверка статуса PostgreSQL:"
systemctl status postgresql --no-pager

echo "PostgreSQL 15 успешно установлен и работает!"
echo "Подключиться к серверу: sudo -u postgres psql"
