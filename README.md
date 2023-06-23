# nummus
**mastering currency in the cloud**

### General info:

* [Kubernetes capacity management](https://faun.pub/kubernetes-capacity-management-resources-and-metrics-d449d65955cb)
* [Handy service map by Google](https://cloud.google.com/blog/topics/developers-practitioners/handy-new-google-cloud-aws-and-azure-product-map)
* [Azure infra globe](https://datacenters.microsoft.com/globe/explore)
* [K8s instance calculator](https://learnk8s.io/kubernetes-instance-calculator)

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

#### Azure
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

### AKS stuff

* [AKS cluster autoscaler](https://learn.microsoft.com/en-us/azure/aks/cluster-autoscaler?WT.mc_id=Portal-Microsoft_Azure_Expert) + [AKS node pool](https://learn.microsoft.com/en-us/azure/aks/spot-node-pool)
* [Optimizing costs on AKS](https://learn.microsoft.com/en-us/training/modules/aks-optimize-compute-costs/)