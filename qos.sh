#!/usr/bin/env bash

export GREP_COLORS='ms=01;32'
printf "\n Available namespaces are:\n $(kubectl get ns -o=custom-columns=NAMESPACES:.metadata.name) \n\t"
printf "\n Please write the name of the namespace for which you want to know QoS:\n\n"
read -r nspace

# list all pods from the selected namespace
printf "\n \e[0;32m Pods in ${nspace} namespace: \e[0m \n"
for pod in $(kubectl -n "${nspace}" get po -o=name); do
    qos=$(kubectl -n "${nspace}" get "${pod}" -o jsonpath='{.status.qosClass}')
    # if qos is BestEffort print No else yes
    if [ "${qos}" == "BestEffort" ]; then
        printf "\n  ${pod} --> QoS class: ${qos} 🔥 \n"
    else
        printf "\n  ${pod} --> QoS class: ${qos} \n"
    fi
done

# read stding and print message awaiting user input
echo "Press any key to continue"
read -r answer
printf "\n   QoS  Guaranteed:\e[0;32m Every Container in the Pod must have a limit and a request. For every container LIMIT = REQUEST \e[0m \n"
printf "\n   QoS  Burstable:\e[0;32m  At least one Container in the Pod has a Memory or CPU request or limit. \e[0m \n"
printf "\n   QoS 🔥BestEffort:\e[0;32m Containers in the Pod must not have any Memory or CPU limits or requests \e[0m \n"
echo "---------------------------------------------------------------------------------------------------------------------"