#!/bin/bash

/usr/local/bin/openssl verify -CAfile ./root.pem test.pem
