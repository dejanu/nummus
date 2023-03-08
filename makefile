.DEFAULT_GOAL := documentation
specs:
	@echo "kubectl explain pod.spec.containers.resources"
limits:
	@echo "-o jsonpath='{.spec.containers[*].resources}'"
	@echo "-o jsonpath='{.spec.containers[*].resources.limits}'"
	@echo "-o jsonpath='{.spec.containers[*].resources.requests}'"
documentation:
	@echo "..."
	@echo "KubeEye obtains cluster resource details by using Kubernetes APIs"
	@echo "e.g: kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes""
	@echo "..."
ke:
	@echo "docker run -v ~/.kube/:/tmp dejanualex/kubeyehack:1.0"