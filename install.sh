#kubectl create -f https://raw.githubusercontent.com/DescartesResearch/TeaStore/development/examples/kubernetes/teastore-rabbitmq.yaml -n teastore
#kubectl create -f https://raw.githubusercontent.com/DescartesResearch/TeaStore/development/examples/kubernetes/teastore-ribbon-kieker.yaml -n teastore
kubectl create ns teastore
kubectl label namespace teastore istio-injection=enabled --overwrite
kubectl apply -f iks-teastore.yaml
