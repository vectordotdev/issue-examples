#!/bin/bash
mkdir certificates
git clone https://github.com/michaelklishin/tls-gen tls-gen
cd tls-gen/basic
make PASSWORD=
make verify
make info
cp result/* -R ../../certificates/
ls -l ../../certificates
