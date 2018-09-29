package main

import (
	"crypto/x509"
	"encoding/pem"
	"fmt"
	"io/ioutil"
	"log"
)

func main() {

	certFile := "/tmp/t.crt"

	certPEMBlock, err := ioutil.ReadFile(certFile)
	if err != nil {
		log.Fatal(err)
	}

	var blocks [][]byte
	for {
		var certDERBlock *pem.Block
		certDERBlock, certPEMBlock = pem.Decode(certPEMBlock)
		if certDERBlock == nil {
			break
		}

		if certDERBlock.Type == "CERTIFICATE" {
			blocks = append(blocks, certDERBlock.Bytes)
		}
	}

	for _, block := range blocks {
		cert, err := x509.ParseCertificate(block)
		if err != nil {
			log.Println(err)
			continue
		}

		fmt.Println("Certificate:")
		fmt.Printf("\tVersion: %+v\n", cert.Version)
		fmt.Printf("\tSubject: %+v\n", cert.Subject)
		fmt.Printf("\tIssuer: %+v\n", cert.Issuer)
		fmt.Printf("\tNotBefore: %+v\n", cert.NotBefore)
		fmt.Printf("\tNotAfter: %+v\n", cert.NotAfter)

		fmt.Printf("\tSerialNumber: %v\n", cert.SerialNumber)
		fmt.Printf("\tDNS Names: %+v\n", cert.DNSNames)
		fmt.Printf("\tEmailAddresses: %+v\n", cert.EmailAddresses)
		fmt.Printf("\tIPAddresses: %+v\n", cert.IPAddresses)

		fmt.Printf("\tPublicKeyAlgorithm: %+v\n", cert.PublicKeyAlgorithm)
		fmt.Printf("\tSignatureAlgorithm: %+v\n", cert.SignatureAlgorithm)
		fmt.Printf("\tKeyUsage: %+v\n", cert.KeyUsage)


	}
}
