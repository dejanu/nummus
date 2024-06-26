# nummus
**mastering currency in the cloud**

### General info:

* [Kubernetes capacity management](https://faun.pub/kubernetes-capacity-management-resources-and-metrics-d449d65955cb)
* [Handy service map by Google](https://cloud.google.com/blog/topics/developers-practitioners/handy-new-google-cloud-aws-and-azure-product-map)
* [Azure infra globe](https://datacenters.microsoft.com/globe/explore)
* [K8s instance calculator](https://learnk8s.io/kubernetes-instance-calculator)

```bash
# understand container specs
kubectl explain pod.spec.containers.resources
# understand node specs
kubectl explain node.spec

# plugin usage
kubectl podresourceinspector <namespace>
kubectl qos <namespace>
```
### Cloud pricing:

## Azure
* [Azure pricing calculator](https://azure.microsoft.com/en-us/pricing/calculator/) - estimate cost
* [Azure price](https://azureprice.net/)
* [VM sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable)
* [Resource reservations](https://learn.microsoft.com/en-us/azure/aks/concepts-clusters-workloads#resource-reservations)


### Concepts

* vCPU - time dependent entity, made of time slots across all available physical cores, so 1 vCPU == 1 physical core is [not entirely correct](https://www.datacenters.com/news/what-is-a-vcpu-and-how-do-you-calculate-vcpu-to-cpu)
```latex
(Threads x Cores) x Physical CPU = Number vCPU
```

### QoS classes POD:

* Kubernetes uses QoS classification to influence how different pods are handled, and assigns every Pod a QoS class based on the resource requests and limits of its component Containers
```bash
# get QoS class of a pod
kubectl get pod <pod-name> -o jsonpath='{.status.qosClass}'

# check request and limits for containers in pod
kubectl get po <pod_name> -o jsonpath='{.spec.containers[*].resources}'
kubectl get pod <pod_name> -o jsonpath='{.spec.containers[*].resources.limits}'
kubectl get pod <pod_name> -o jsonpath='{.spec.containers[*].resources.requests}'
```

### Azure
* ACU (Azure Compute Unit) - provides a way of comparing compute (CPU) performance across Azure SKUs
* Quotas - Microsoft Azure limits e.g  vCPU quotas
```bash
# check quota usage
az vm list-usage --location "East US" -o table
```

### Local development

* Run [kubeeye](https://github.com/kubesphere/kubeeye) locally:
```bash
docker build -t dejanualex/kubeyehack:1.0 .
docker run -v ~/.kube/:/tmp dejanualex/kubeyehack:1.0
```

### Autoscaling

## Metrics Server and VPA

* Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for use by HPA and VPA.

* Enable API server for k8s docker local setup by using [metrics-server](https://github.com/kubernetes-sigs/metrics-server):
```bash
# download components
wget https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.4/components.yaml
# add - --kubelet-insecure-tls in components.yaml (check line 139)
kubectl apply -f autoscalers/components.yaml

# check if metrics server is enabled
kubectl get apiservices | grep metrics.k8s.io
kubectl get --raw /apis/metrics.k8s.io/v1beta1 | jq

# kubectl top calls metrics api behind the scenes
kubectl top nodes
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes" | jq .items[].usage

kubectl top pods
kubectl get --raw /apis/metrics.k8s.io/v1beta1/pods | jq .items[].containers[].usage
```

* VPA (Vertical Pod Autoscaler)

```bash
# HELM installation
helm repo add fairwinds-stable https://charts.fairwinds.com/stable

# helm install my-vpa fairwinds-stable/vpa --version 3.0.2 
helm fetch fairwinds-stable/vpa --version 3.0.2 && tar -xzvf vpa-3.0.2.tgz
helm install my-vpa ./vpa -n kube-system

# check if VPA is installed: should see recommender, updater and admission controller
kubectl get pods -n kube-system | grep vpa

# check for VPA CRDs: verticalpodautoscalers,verticalpodautoscalercheckpoints
kubectl get crd -A | grep -i vert

```
--- 

### AKS stuff

* [AKS cluster autoscaler](https://learn.microsoft.com/en-us/azure/aks/cluster-autoscaler?WT.mc_id=Portal-Microsoft_Azure_Expert) + [AKS node pool](https://learn.microsoft.com/en-us/azure/aks/spot-node-pool)
* [Optimizing costs on AKS](https://learn.microsoft.com/en-us/training/modules/aks-optimize-compute-costs/)

* TL;DR Quickly optimize costs by:
    * Optimize costs on AKS by using zero-scaled node pools.
    * Optimize costs on AKS by using autoscaled spot node pools.
    * Manage costs with Azure Policy on AKS.