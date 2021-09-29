# teastore-appd
A version of the Teastore app with AppD hints and a load generator

The app comes from the DecartesResearch Git repo:

https://github.com/DescartesResearch/TeaStore/wiki/

There is a manifest that was derived from the default single manifest K8s deployment described in the wiki above, but with docker hub pointers to the apps with AppD hints incorporated.

```
kubectl create ns teastore
kubectl apply -f iks-teastore.yaml -n teastore
```

And is used in the APM research community as a test application.   A load generator based on the LIMBO loadgen, or the Jmeter model as described in the [Testing and Benchmarking](https://github.com/DescartesResearch/TeaStore/wiki/Testing-and-Benchmarking) descriptiong exists in the load_gen.yaml manifest.

```
kubectl apply -f loadgen/loadgen.yaml -n teastore
```
