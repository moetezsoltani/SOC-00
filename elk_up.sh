#!/bin/bash

# Initialize configuration's
kubectl apply -f  kube-logging.yaml
kubectl create configmap certe --from-file=./certs/elastic.local -n kube-logging
kubectl create configmap certk --from-file=./certs/my-kibana -n kube-logging

# Start elastic search
kubectl apply -f elasticsearch_svc.yaml
kubectl apply -f elasticsearch_statefulset.yaml

# Start kibana
kubectl apply -f kibana




kubectl port-forward --address 192.168.236.165 es-cluster-0  9200  -n kube-logging

kubectl get po -n kube-logging 

kubectl port-forward --address 192.168.236.165 xxxxxxxxx kibana pod 5601 -n kube-logging




