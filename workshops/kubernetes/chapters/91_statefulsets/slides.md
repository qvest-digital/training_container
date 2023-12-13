# Kubernetes StatefulSets

<img src="./images/k8s-icons/resources/labeled/sts.svg" class="k8s-icon-large-centered">

In this chapter you will learn when to use StatefulSets to define your workloads.

----

## What is a StatefulSet?

<q cite="https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/">StatefulSet is the workload API object used to manage stateful applications.
Manages the deployment and scaling of a set of Pods, and provides guarantees about the ordering and uniqueness of these Pods.</q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

----

## When to use StatefulSets

<q cite="https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#using-statefulsets">StatefulSets are valuable for applications that require one or more of the following.

* Stable, unique network identifiers.
* Stable, persistent storage.
* Ordered, graceful deployment and scaling.
* Ordered, automated rolling updates.

In the above, stable is synonymous with persistence across Pod (re)scheduling. If an application doesn't require any stable identifiers or ordered deployment, deletion, or scaling, you should deploy your application using a workload object that provides a set of stateless replicas.</q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#using-statefulsets)

----

## Limitations

<q cite="https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#limitations">
* The storage for a given Pod must either be provisioned by a PersistentVolume Provisioner based on the requested storage class, or pre-provisioned by an admin.
* Deleting and/or scaling a StatefulSet down will not delete the volumes associated with the StatefulSet. This is done to ensure data safety, which is generally more valuable than an automatic purge of all related StatefulSet resources.
* StatefulSets currently require a Headless Service to be responsible for the network identity of the Pods. You are responsible for creating this Service.
* StatefulSets do not provide any guarantees on the termination of pods when a StatefulSet is deleted. To achieve ordered and graceful termination of the pods in the StatefulSet, it is possible to scale the StatefulSet down to 0 prior to deletion.
* When using Rolling Updates with the default Pod Management Policy (`OrderedReady`), it's possible to get into a broken state that requires manual intervention to repair.

----

## Example

```sh
kubectl apply -f ./chapters/91_statefulsets/mariadb-cluster.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"><!-- .element: class="fragment" --></iframe>

----

## Should I really be using StatefulSets?

<q cite="https://x.com/kelseyhightower/status/963419099144495104">Kubernetes supports stateful workloads; I don't.</q>
([Kelsey Hightower](https://x.com/kelseyhightower/status/963419099144495104))

----

## StatefulSets - Summary

* Complicated when using workloads that are not "Kubernetes-aware"
* Either rely on official Helm charts and/or use an Operator if possible

Further information: [Deployments vs. StatefulSets vs. DaemonSets](https://medium.com/stakater/k8s-deployments-vs-statefulsets-vs-daemonsets-60582f0c62d4)

Notes:
- RBAC and operators ...
