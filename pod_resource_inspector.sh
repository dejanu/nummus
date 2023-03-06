#!/usr/bin/env bash
# Purpose: wrapper for inspecting Requests/Limits for Pods

# read namespace and pod name
printf "\n Available namespaces are:\n $(kubectl get ns -o=custom-columns=NAMESPACES:.metadata.name) \n\t"
printf "\n Please write the name of the namespace for which you want to know the resource status:\n\n"
read -r nspace

# list all pods from the selected namespace
printf "\n \e[0;32m Pods in ${nspace} namespace: \e[0m \n\n"
kubectl -n "${nspace}" get po -o=custom-columns=PODs:.metadata.name

printf "\n Please write the name of the POD for which you want to know the resource status:\n\n"
read -r ppod
kubectl -n "${nspace}" get po "${ppod}" -o jsonpath='{.spec.containers[*].resources}' | jq .
