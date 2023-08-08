#!/bin/bash

HOSTNAME=$(hostname)
openssl x509 -in ~/rabbitmq/certificates/ca_certificate.pem -out ./certificates/ca_certificate.crt -outform der
openssl x509 -in ~/rabbitmq/certificates/client_${HOSTNAME}_certificate.pem -out ./certificates/client_${HOSTNAME}_certificate.crt -outform der
openssl rsa -in ~/rabbitmq/certificates/client_${HOSTNAME}_key.pem -out ./certificates/client_${HOSTNAME}_key.crt -outform der
