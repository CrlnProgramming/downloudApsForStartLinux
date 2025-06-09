#!/bin/bash

#apt-get install -f
apt update && apt upgrade -y

apt-get install -y postgresql-client-15 postgresql-15

echo "Проверка статуса PostgreSQL:"
systemctl status postgresql --no-pager

echo "PostgreSQL 15 успешно установлен и работает!"
echo "Подключиться к серверу: sudo -u postgres psql"
