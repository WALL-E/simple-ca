#!/bin/bash

/usr/local/bin/openssl verify \
-verbose \
-show_chain \
-check_ss_sig \
-CAfile ./root.pem test.pem
