/*
Copyright IBM Corp. All Rights Reserved.

SPDX-License-Identifier: Apache-2.0
*/

package tlsgen

import (
	"crypto"
	"crypto/rand"
	"crypto/x509/pkix"
	"encoding/base64"
	"encoding/pem"
	"github.com/Hyperledger-TWGC/tjfoc-gm/sm2"
	"math/big"
	"net"
	"time"

	x509GM "github.com/Hyperledger-TWGC/tjfoc-gm/x509"
)

func (p *CertKeyPair) PrivKeyString() string {
	return base64.StdEncoding.EncodeToString(p.Key)
}

func (p *CertKeyPair) PubKeyString() string {
	return base64.StdEncoding.EncodeToString(p.Cert)
}

func newPrivKey() (*sm2.PrivateKey, []byte, error) {
	privateKey, err := sm2.GenerateKey(nil)
	if err != nil {
		return nil, nil, err
	}
	privBytes, err := x509GM.MarshalSm2UnecryptedPrivateKey(privateKey)
	if err != nil {
		return nil, nil, err
	}
	return privateKey, privBytes, nil
}

func newCertTemplate() (x509GM.Certificate, error) {
	sn, err := rand.Int(rand.Reader, new(big.Int).Lsh(big.NewInt(1), 128))
	if err != nil {
		return x509GM.Certificate{}, err
	}
	return x509GM.Certificate{
		Subject:            pkix.Name{SerialNumber: sn.String()},
		NotBefore:          time.Now().Add(time.Hour * (-24)),
		NotAfter:           time.Now().Add(time.Hour * 24),
		KeyUsage:           x509GM.KeyUsageKeyEncipherment | x509GM.KeyUsageDigitalSignature,
		SignatureAlgorithm: x509GM.SM2WithSM3,
		SerialNumber:       sn,
	}, nil
}

func newCertKeyPair(isCA bool, isServer bool, host string, certSigner crypto.Signer, parent *x509GM.Certificate) (*CertKeyPair, error) {
	privateKey, privBytes, err := newPrivKey()
	if err != nil {
		return nil, err
	}

	template, err := newCertTemplate()
	if err != nil {
		return nil, err
	}

	tenYearsFromNow := time.Now().Add(time.Hour * 24 * 365 * 10)
	if isCA {
		template.NotAfter = tenYearsFromNow
		template.IsCA = true
		template.KeyUsage |= x509GM.KeyUsageCertSign | x509GM.KeyUsageCRLSign
		template.ExtKeyUsage = []x509GM.ExtKeyUsage{x509GM.ExtKeyUsageAny}
		template.BasicConstraintsValid = true
	} else {
		template.ExtKeyUsage = []x509GM.ExtKeyUsage{x509GM.ExtKeyUsageClientAuth}
	}
	if isServer {
		template.NotAfter = tenYearsFromNow
		template.ExtKeyUsage = append(template.ExtKeyUsage, x509GM.ExtKeyUsageServerAuth)
		if ip := net.ParseIP(host); ip != nil {
			template.IPAddresses = append(template.IPAddresses, ip)
		} else {
			template.DNSNames = append(template.DNSNames, host)
		}
	}
	// If no parent cert, it's a self signed cert
	if parent == nil || certSigner == nil {
		parent = &template
		certSigner = privateKey
	}
	rawBytes, err := x509GM.CreateCertificate(&template, parent, &privateKey.PublicKey, certSigner)
	if err != nil {
		return nil, err
	}
	pubKey := encodePEM("CERTIFICATE", rawBytes)

	block, _ := pem.Decode(pubKey)
	cert, err := x509GM.ParseCertificate(block.Bytes)
	if err != nil {
		return nil, err
	}
	privKey := encodePEM("EC PRIVATE KEY", privBytes)
	return &CertKeyPair{
		Key:     privKey,
		Cert:    pubKey,
		Signer:  privateKey,
		TLSCert: cert,
	}, nil
}

func encodePEM(keyType string, data []byte) []byte {
	return pem.EncodeToMemory(&pem.Block{Type: keyType, Bytes: data})
}

// CertKeyPairFromString converts the given strings in base64 encoding to a CertKeyPair
func CertKeyPairFromString(privKey string, pubKey string) (*CertKeyPair, error) {
	priv, err := base64.StdEncoding.DecodeString(privKey)
	if err != nil {
		return nil, err
	}
	pub, err := base64.StdEncoding.DecodeString(pubKey)
	if err != nil {
		return nil, err
	}
	return &CertKeyPair{
		Key:  priv,
		Cert: pub,
	}, nil
}
