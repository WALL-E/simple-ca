#!/bin/bash

set -e
set -x

SERIAL=`cat /etc/pki/CA/serial`
NAME="user_"$SERIAL

sudo openssl genrsa -out $NAME.key 2048
# sudo openssl req -new -days 3650 -key $NAME.key -out $NAME.csr
sudo openssl req -new -days 3650 -key $NAME.key -out $NAME.csr -subj /C=CN/ST=BJ/O=Company.Ltd/OU=QOS/CN=QOS$SERIAL
sudo openssl ca -in $NAME.csr -out $NAME.crt
