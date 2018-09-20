#!/bin/bash

set -e
set -x

SERIAL=`cat /etc/pki/CA/serial`
NAME="user_"$SERIAL

sudo /usr/local/bin/openssl genpkey -algorithm Ed25519 -out $NAME.key
# sudo /usr/local/bin/openssl req -new -days 3650 -key $NAME.key -out $NAME.csr -config /etc/pki/tls/openssl.cnf
sudo /usr/local/bin/openssl req -new -days 3650 -key $NAME.key -out $NAME.csr -subj /C=CN/ST=BJ/O=Company.Ltd/OU=QOS/CN=QOS$SERIAL -config /etc/pki/tls/openssl.cnf
sudo /usr/local/bin/openssl ca -in $NAME.csr -out $NAME.crt -config /etc/pki/tls/openssl.cnf
