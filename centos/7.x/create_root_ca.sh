#!/bin/bash

set -e
set -x

sudo /bin/cp -fr ./template/index.txt /etc/pki/CA
sudo /bin/cp -fr ./template/serial /etc/pki/CA
sudo /bin/cp -fr ./template/openssl.cnf /etc/pki/tls/

cd /etc/pki/CA

sudo /usr/local/bin/openssl genpkey -algorithm Ed25519 -out ./private/cakey.pem

# sudo openssl req -new -days 3650 -key ./private/cakey.pem -out careq.pem -config /etc/pki/tls/openssl.cnf
# sudo openssl ca -selfsign -in careq.pem -out ./private/cacert.pem -config /etc/pki/tls/openssl.cnf
sudo /usr/local/bin/openssl req -new -x509 -days 3650 -key ./private/cakey.pem -out ./cacert.pem -config /etc/pki/tls/openssl.cnf
