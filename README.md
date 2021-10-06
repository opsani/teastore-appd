# teastore-appd
A version of the Teastore app with AppD hints and a load generator

The app comes from the DecartesResearch Git repo:

https://github.com/DescartesResearch/TeaStore/wiki/

There is a manifest that was derived from the default single manifest K8s deployment described in the wiki above, but with docker hub pointers to the apps with AppD hints incorporated.

### Deploy the teastore

```
kubectl create ns teastore
kubectl apply -f iks-teastore.yaml -n teastore
```

### Deploy the loadgenerator

And is used in the APM research community as a test application.   A load generator based on the LIMBO loadgen, or the Jmeter model as described in the [Testing and Benchmarking](https://github.com/DescartesResearch/TeaStore/wiki/Testing-and-Benchmarking) descriptiong exists in the load_gen.yaml manifest.

```
kubectl apply -f loadgen/loadgen.yaml -n teastore
```

Or, for the Jmeter:

```
kubectl apply -f loadgen-jmeter/teastore_loadgen.yaml -n teastore
```

### Configure AppD Credentials for ServoX

Update the properties in appd-config.yaml, then:

```
kubectl -n teastore apply -f appd-config.yaml
```


### Deploy the Cluster Agent

Update the `controllerUrl` and `account` in `cluster-agent/cluster-agent.yaml`, and replace the secret creation below with your accesskey and credentials, then run:

```
kubectl create namespace appdynamics
kubectl create -f cluster-agent/cluster-agent-operator.yaml
kubectl -n appdynamics create secret generic cluster-agent-secret --from-literal=controller-key=<access-key> --from-literal=api-user="<username>@<customer>:<password>"
kubectl create -f cluster-agent/cluster-agent.yaml 
```