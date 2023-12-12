# Kubernetes Daemonset

<img src="./images/k8s-icons/resources/labeled/ds.svg" class="k8s-icon-large-centered">

In this chapter you will learn about DaemonSets.

----

## What is a DaemonSet?

<q cite="- https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/">A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.</q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)

----

## When to use DaemonSets

<q cite="https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/">Some typical uses of a DaemonSet are:

* running a cluster storage daemon on every node
* running a logs collection daemon on every node
* running a node monitoring daemon on every node"></q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)

Notes:
- no hands-on lesson, because from an app developer's point of view it is
  rarely useful to deploy DaemonSets to host your application workloads.
