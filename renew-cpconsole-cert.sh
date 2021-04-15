#!/usr/bin/env bash

wget https://raw.githubusercontent.com/ICpTrial/cp4mcm-demohub/master/csr.cnf

## Generate New Certificate 
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -subj "/C=US/ST=New York/L=Armonk/O=IBM Cloud  Private" -days 100 -out ca.crt
openssl genrsa -out tls.key 2048
openssl req -new -key tls.key -out tls.csr -config csr.cnf
openssl x509 -req -in tls.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out tls.crt -days 1000 -extensions v3_ext -extfile csr.cnf
openssl x509  -noout -text -in ./tls.crt

## Replcate Certificate
oc -n ibm-common-services patch managementingress default --type merge --patch '{"spec":{"ignoreRouteCert":true}}'
oc -n ibm-common-services delete certificate route-cert
oc -n ibm-common-services delete  secret route-tls-secret; oc -n ibm-common-services  create secret generic route-tls-secret --from-file=ca.crt=ca.crt  --from-file=tls.crt=tls.crt  --from-file=tls.key=tls.key

## Restart Pod & Recreate Route
oc -n ibm-common-services delete pod -l app=auth-idp
oc delete route cp-console -n ibm-common-services
