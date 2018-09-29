#!/bin/bash

set -e
set -x

OPENSSL=/usr/local/bin/openssl

sudo /bin/cp -fr ./template/index.txt /etc/pki/CA
sudo /bin/cp -fr ./template/index.txt.attr /etc/pki/CA
sudo /bin/cp -fr ./template/serial /etc/pki/CA
sudo /bin/cp -fr ./template/openssl.cnf /etc/pki/tls/

cd /etc/pki/CA

sudo $OPENSSL genpkey -algorithm Ed25519 -outform PEM -out ./private/cakey.pem
sudo $OPENSSL pkey -in ./private/cakey.pem -outform PEM -pubout -out ./capub.key

# sudo openssl req -new -days 3650 -key ./private/cakey.pem -out careq.pem -config /etc/pki/tls/openssl.cnf
# sudo openssl ca -selfsign -in careq.pem -out ./private/cacert.pem -config /etc/pki/tls/openssl.cnf
sudo $OPENSSL req -new -x509 -days 3650 -key ./private/cakey.pem -out ./cacert.pem -config /etc/pki/tls/openssl.cnf
