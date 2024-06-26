# 101

* Scheduler is the control plane process which assigns Pods to Nodes
```bash
kubectl -n kube-system get po | grep scheduler
```

* **Scheduling** refers to the proccess of assigning Pods to Nodes so that the `kubelet` can run them. scheduling queue according to constraints and available resources


### links

* [scheduler in aks](https://learn.microsoft.com/en-us/azure/aks/operator-best-practices-advanced-scheduler)