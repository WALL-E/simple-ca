#!/bin/bash

set -e
set -x

SERIAL=`cat /etc/pki/CA/serial`

PRI=$SERIAL".pri"
PUB=$SERIAL".pub"
CSR=$SERIAL".csr"
CRT=$SERIAL".crt"

sudo /usr/local/bin/openssl genpkey -algorithm Ed25519 -outform PEM -out $PRI
sudo /usr/local/bin/openssl pkey -in $PRI -outform PEM -pubout -out $PUB

sudo /usr/local/bin/openssl req -new \
-days 7 \
-key $PRI \
-out $CSR \
-subj /C=CN/ST=BJ/O=Company.Ltd/OU=QOS/CN=QOS$SERIAL/emailAddress=owner@QOS$SERIAL.QOS \
-config /etc/pki/tls/openssl.cnf

sudo /usr/local/bin/openssl ca -in $CSR -out $CRT -config /etc/pki/tls/openssl.cnf
