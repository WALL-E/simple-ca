#!/bin/bash
set -x
set -e

wget https://www.openssl.org/source/openssl-1.1.0f.tar.gz
tar zxvf openssl-1.1.0f.tar.gz
cd openssl-1.1.0f
./config
sudo make
sudo make install
sudo ln -s /usr/local/lib64/libssl.so.1.1 /usr/lib64/
sudo ln -s /usr/local/lib64/libcrypto.so.1.1 /usr/lib64/

/usr/local/bin/openssl version
