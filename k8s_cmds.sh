#!/usr/bin/env bash

# kubectl cmds

# resource consumption for nodes or pods
kubect top no --sort-by=cpu
kubect top po --sort-by=memory

# resource consumption for namespaces,pods,containers
kubectl top node <node_name>
kubectl get po -A --field-selector spec.nodeName=<node_name>
kubectl top po -n <namespace_name>
kubectl top po <pod_name> -n <namespace_name> --containers