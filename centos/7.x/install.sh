#!/bin/bash
set -x
set -e

yum install -y ntpdate
yum groupinstall -y "Development Tools"

ntpdate ntp1.aliyun.com

wget --no-check-certificate https://www.openssl.org/source/openssl-1.1.1.tar.gz
tar zxvf openssl-1.1.1.tar.gz
cd openssl-1.1.1
./config
sudo make
sudo make install
sudo ln -s /usr/local/lib64/libssl.so.1.1 /usr/lib64/
sudo ln -s /usr/local/lib64/libcrypto.so.1.1 /usr/lib64/

/usr/local/bin/openssl version
