package main

import (
	"crypto/x509"
	"encoding/pem"
	"io/ioutil"
	"log"
)

func main() {
	// Verifying with a custom list of root certificates.



	rootCertFile := "/tmp/root.crt"
	testCertFile := "/tmp/test.crt"

	rootCertPEMBlock, err := ioutil.ReadFile(rootCertFile)
	if err != nil {
		log.Fatal(err)
	}

	testCertPEMBlock, err := ioutil.ReadFile(testCertFile)
	if err != nil {
		log.Fatal(err)
	}

	// First, create the set of root certificates. For this example we only
	// have one. It's also possible to omit this in order to use the
	// default root set of the current operating system.
	roots := x509.NewCertPool()
	ok := roots.AppendCertsFromPEM([]byte(rootCertPEMBlock))
	if !ok {
		panic("failed to parse root certificate")
	}

	block, _ := pem.Decode([]byte(testCertPEMBlock))
	if block == nil {
		panic("failed to parse certificate PEM")
	}
	cert, err := x509.ParseCertificate(block.Bytes)
	if err != nil {
		panic("failed to parse certificate: " + err.Error())
	}

	opts := x509.VerifyOptions{
		DNSName: "mail.google.com",
		Roots:   roots,
	}

	if _, err := cert.Verify(opts); err != nil {
		panic("failed to verify certificate: " + err.Error())
	}
}

