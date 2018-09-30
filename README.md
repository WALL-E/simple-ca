# Simple CA

Using shell script to create CA services

## OpenSSL

1. default config 

    /etc/pki/tls/openssl.cnf

2. serial number

    /etc/pki/CA/serial

3. database

    /etc/pki/CA/index.txt

## Quick start

```
[vagrant@vagrant]$ cd simple-ca/centos/7.x
[vagrant@vagrant]$ ./create_root_ca.sh
[vagrant@vagrant]$ ./create_user_key_cert.sh
++ cat /etc/pki/CA/serial
+ SERIAL=0C
+ NAME=user_0C
+ sudo openssl genrsa -out user_0C.key 2048
Generating RSA private key, 2048 bit long modulus
......+++
...............................................................................................................................+++
e is 65537 (0x10001)
+ sudo openssl req -new -days 3650 -key user_0C.key -out user_0C.csr -subj /C=CN/ST=BJ/O=Company.Ltd/OU=QOS/CN=QOS0C
+ sudo openssl ca -in user_0C.csr -out user_0C.crt
Using configuration from /etc/pki/tls/openssl.cnf
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number: 12 (0xc)
        Validity
            Not Before: Sep 19 08:59:32 2018 GMT
            Not After : Sep 19 08:59:32 2019 GMT
        Subject:
            countryName               = CN
            stateOrProvinceName       = BJ
            organizationName          = Company.Ltd
            organizationalUnitName    = QOS
            commonName                = QOS0C
        X509v3 extensions:
            X509v3 Basic Constraints:
                CA:FALSE
            Netscape Comment:
                OpenSSL Generated Certificate
            X509v3 Subject Key Identifier:
                3E:78:2E:75:47:E2:B0:EC:9D:E6:B5:11:49:FB:D7:2B:FB:33:F8:A0
            X509v3 Authority Key Identifier:
                keyid:50:6C:F8:7E:4C:F4:DE:CA:A9:92:73:26:78:48:18:D2:E1:63:11:F0

Certificate is to be certified until Sep 19 08:59:32 2019 GMT (365 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
```


## View Cert

```
[vagrant@vagrant]$ ./read_cert.sh user_0C.crt
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 12 (0xc)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=CN, ST=BeiJing, L=BeiJing, O=Default Company Ltd, OU=QOS
        Validity
            Not Before: Sep 19 08:59:32 2018 GMT
            Not After : Sep 19 08:59:32 2019 GMT
        Subject: C=CN, ST=BJ, O=Company.Ltd, OU=QOS, CN=QOS0C
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:c7:0d:e4:ed:f1:76:bc:3a:47:3c:f0:67:7b:45:
                    54:3f:df:27:3f:c4:f7:fd:93:0d:06:f3:03:c9:32:
                    6b:df:80:0b:42:a7:73:7f:79:b7:bf:bd:55:d9:83:
                    9a:05:33:95:c7:95:1d:57:20:a5:9e:11:36:b3:40:
                    73:44:99:7f:77:06:6c:f0:ef:04:d1:80:8f:ab:48:
                    03:3f:94:ee:27:47:1f:11:00:5c:73:25:3b:50:e5:
                    68:77:29:b2:d9:5d:c0:98:e6:a6:8c:a7:61:5c:62:
                    0c:bf:d3:a3:9b:92:f4:24:6e:f9:c7:f7:0a:13:48:
                    77:9a:6d:aa:26:35:b1:b6:bf:88:29:26:c0:93:e9:
                    d3:09:56:de:6d:3e:64:9a:c4:65:3e:cc:25:2c:4d:
                    26:4f:37:21:73:67:b6:55:8a:36:b0:bf:69:f3:bb:
                    9f:f4:18:54:7b:3a:01:76:de:1a:6a:54:14:f9:ba:
                    34:c2:e2:6a:b4:48:26:13:34:63:11:9b:30:f5:39:
                    6a:cc:ee:d4:3a:18:6b:a9:f0:46:cc:33:20:92:98:
                    17:c0:ca:b2:6f:51:c9:83:18:c8:95:f4:9c:68:be:
                    0d:31:14:95:e7:35:b7:8f:5d:4d:69:8e:12:c3:83:
                    91:55:e2:2f:26:89:11:e1:2e:00:63:96:e3:18:7e:
                    26:a5
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints:
                CA:FALSE
            Netscape Comment:
                OpenSSL Generated Certificate
            X509v3 Subject Key Identifier:
                3E:78:2E:75:47:E2:B0:EC:9D:E6:B5:11:49:FB:D7:2B:FB:33:F8:A0
            X509v3 Authority Key Identifier:
                keyid:50:6C:F8:7E:4C:F4:DE:CA:A9:92:73:26:78:48:18:D2:E1:63:11:F0

    Signature Algorithm: sha256WithRSAEncryption
         36:be:e1:2a:a6:1b:a1:7d:42:90:d8:7a:23:4a:ef:14:81:a2:
         09:a0:d2:c1:a7:fa:3e:c5:48:54:74:a2:c8:84:30:c5:09:57:
         e4:11:6e:c7:a8:54:5a:02:88:f7:ac:e7:71:3e:d9:4b:8a:1a:
         50:01:ed:53:5b:8e:2c:8b:85:46:f1:97:fa:2c:ef:e2:e5:d5:
         b5:20:27:e2:2f:80:8e:92:88:13:31:be:63:c6:5f:30:59:cd:
         55:cf:aa:f7:89:e4:c6:8e:c8:7b:79:3c:8c:c0:a3:52:7a:aa:
         52:8b:c7:c7:ed:97:40:18:34:80:07:bb:98:12:96:22:22:62:
         a0:f0:0e:8e:0a:73:a1:7d:fc:06:42:34:d4:3d:0e:16:08:ad:
         8f:64:1c:3f:d8:99:06:d2:92:58:f1:e5:d2:68:01:b3:4f:37:
         17:9e:52:22:54:e6:8e:b7:fb:54:9a:63:1e:b9:19:dd:f3:e0:
         34:a3:27:7b:8e:f9:6a:e8:e3:f2:19:bf:f3:0f:9b:cf:c7:92:
         40:64:99:2e:62:e8:bc:9d:90:2e:57:77:45:38:0e:42:4c:3f:
         c1:a7:2e:01:b0:2d:67:c3:1d:cb:a1:68:85:7c:d6:bf:e3:81:
         53:9f:b8:8d:2c:32:63:a4:48:31:ca:75:81:e7:41:fd:68:ce:
         7d:d9:05:4c
```

## Index.html Format

The index.txt file is an ascii file consisting of 6 (not 4) tab-separated 
fields.  Some of those fields may be empty and might appear not to exist at 
all.

The 6 fields are:

0)  Entry type.  May be "V" (valid), "R" (revoked) or "E" (expired).
    Note that an expired may have the type "V" because the type has
    not been updated.  'openssl ca updatedb' does such an update.
1)  Expiration datetime.
2)  Revokation datetime.  This is set for any entry of the type "R".
3)  Serial number.
4)  File name of the certificate.  This doesn't seem to be used,
    ever, so it's always "unknown".
5)  Certificate subject name.


## Other

```
生成Ed25519私钥
openssl genpkey -algorithm Ed25519 -outform PEM -out /tmp/pri.key

生成Ed25519公钥
openssl pkey -in /tmp/pri.key -outform PEM -pubout -out /tmp/pub.key

查看公钥
固定前缀：302a 3005 0603 2b65 7003 2100
cat /tmp/pub.key | openssl base64 -d |xxd
cat /tmp/pub.key | openssl base64 -d |tail -c +13|xxd

查看私钥
固定前缀：302e 0201 0030 0506 032b 6570 0422
cat /tmp/pri.key | openssl base64 -d |xxd
cat /tmp/pri.key | openssl base64 -d |tail -c +17|xxd

```
