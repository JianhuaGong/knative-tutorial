#!/bin/bash

KSVC_NAME=${1:-'greeter'}

IP_ADDRESS="$(minikube ip):$(kubectl get svc istio-ingressgateway --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"

curl -H "Host:$KSVC_NAME.knativetutorial.example.com" $IP_ADDRESS
