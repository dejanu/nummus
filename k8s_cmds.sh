#!/usr/bin/env bash

# check request and limits for containers in pod
kubectl get po <pod_name> -o jsonpath='{.spec.containers[*].resources}'
kubectl -n <namespace> get pod <pod_name> -o jsonpath='{.spec.containers[*].resources.limits}'
kubectl -n <namespace> get pod <pod_name> -o jsonpath='{.spec.containers[*].resources.requests}'

# for ephemeral containers check
kubectl -n default get po nginx -o jsonpath='{.spec.shareProcessNamespace}'

# resource consumption for nodes or pods
kubect top no --sort-by=cpu
kubect top po --sort-by=memory

# error: Metrics API not available. top commands needs metrics server API
# node metrics
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"

# resource consumption for namespaces,pods,containers
kubectl top node <node_name>
kubectl get po -A --field-selector spec.nodeName=<node_name>
kubectl top po -n <namespace_name>
kubectl top po <pod_name> -n <namespace_name> --containers

# K8s API services
kubectl get apiservices
kubectl api-resources

# understand container specs
kubectl explain pod.spec.containers.resources
# understand node specs
kubectl explain node.spec

# API endpoints for health checks without formatting
kubectl get --raw '/livez?verbose'
kubectl get --raw '/readyz?verbose'

# events at the node level
kubectl get events --field-selector involvedObject.kind=Node -A

# get QoS class of a pod
kubectl get pod <pod-name> -o jsonpath='{.status.qosClass}'
