#!/bin/bash

if test $# != 1; then
   echo "Usage:"
   echo "$0 cert_file"
   exit 1
fi

openssl x509 -in $1 -noout -text
