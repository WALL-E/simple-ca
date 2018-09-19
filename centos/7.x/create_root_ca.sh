#!/bin/bash

set -e
set -x

sudo /bin/cp -fr ./template/index.txt /etc/pki/CA
sudo /bin/cp -fr ./template/serial /etc/pki/CA
sudo /bin/cp -fr ./template/openssl.cnf /etc/pki/tls/

cd /etc/pki/CA

sudo openssl genrsa -out ./private/cakey.pem

# sudo openssl req -new -days 3650 -key ./private/cakey.pem -out careq.pem
# sudo openssl ca -selfsign -in careq.pem -out ./private/cacert.pem
sudo openssl req -new -x509 -days 3650 -key ./private/cakey.pem -out ./cacert.pem
