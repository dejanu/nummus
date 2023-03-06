#!/usr/bin/env bash

# kubectl cmds

# check request and limits for containers in pod
kubectl get po <pod_name> -o jsonpath='{.spec.containers[*].resources}'

kubectl -n <namespace> get pod <pod_name> -o jsonpath='{.spec.containers[*].resources.limits}'
kubectl -n <namespace> get pod <pod_name> -o jsonpath='{.spec.containers[*].resources.requests}'

# resource consumption for nodes or pods
kubect top no --sort-by=cpu
kubect top po --sort-by=memory

# resource consumption for namespaces,pods,containers
kubectl top node <node_name>
kubectl get po -A --field-selector spec.nodeName=<node_name>
kubectl top po -n <namespace_name>
kubectl top po <pod_name> -n <namespace_name> --containers