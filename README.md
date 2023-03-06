# nummus
**mastering currency in the cloud**

* [Kubernetes capacity management](https://faun.pub/kubernetes-capacity-management-resources-and-metrics-d449d65955cb)

### Cloud pricing caluculators:

* [Azure pricing calculator](https://azure.microsoft.com/en-us/pricing/calculator/) - estimate cost
* [k8s instance calculator](https://learnk8s.io/kubernetes-instance-calculator)


### Concepts

* vCPU - time dependent entity, made of time slots across all available physical cores, so 1 vCPU == 1 physical core is [not entirely correct](https://www.datacenters.com/news/what-is-a-vcpu-and-how-do-you-calculate-vcpu-to-cpu)
```latex
(Threads x Cores) x Physical CPU = Number vCPU
```

#### Azure
* ACU (Azure Compute Unit) - provides a way of comparing compute (CPU) performance across Azure SKUs
* Quotas - Microsoft Azure limits e.g  vCPU quotas
```bash
# check quota usage
az vm list-usage --location "East US" -o table
```