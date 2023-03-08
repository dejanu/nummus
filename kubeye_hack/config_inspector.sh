#!/usr/bin/env bash

# Purpose: inspects resource configurations by using Kubernetes APIs

# read first argument of the script
# if first argument is not empty, set it as a variable
if [ -n "$1" ]; then
    kubeconfig_location="$1"
else
    echo "Please provide kubeconfig file as an argument"
    exit 1
fi

# call kubeye to inspect resource configurations
ke --kubeconfig ${kubeconfig_location} audit .
