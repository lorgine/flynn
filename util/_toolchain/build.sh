#!/bin/bash

set -eo pipefail

version=1.8.1
shasum=a579ab19d5237e263254f1eac5352efcf1d70b9dacadb6d6bb12b0911ede8994
pkg="go${version}.linux-amd64"
go=go/bin/go

test -f ${go} && ${go} version | grep -q ${version} && exit

rm -rf go.tar.gz go

curl -o go.tar.gz -L "https://storage.googleapis.com/golang/${pkg}.tar.gz"
echo "${shasum}  go.tar.gz" | shasum -c -

tar xzf go.tar.gz
rm go.tar.gz
