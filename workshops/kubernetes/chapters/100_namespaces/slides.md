# Kubernetes Namespaces

- Kubernetes uses namespaces to separate or isolate resources inside a single cluster.
- Resource names inside the same namespace need to be unique.
- There are cluster-wide Objects available that are not taking care of namespace boundaries.
  - e.g. StorageClass, Nodes, PersistentVolumes or Namespaces itself
- set with: `metadata.namespace` inside a yaml

----

## Namespaces

```sh
kubectl get namespace
kubectl namespace create gitea
kubectl get pods --namespace=kube-system
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
- "Cluster im Cluster"
- Viele Möglichkeiten:
  - Ein Namespace pro fachlicher Domäne
  - Ein Namespace pro Team
  - Ein Namespace pro Service
  - ...

----

## Namespaces - Defaults

- default
- kube-node-lease
- kube-public
- kube-system

([Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/#initial-namespaces))

---

## Hands-on Namespaces

We want to move all Gitea components into there own namespace.

Start with your old deployed yaml files.

### Goal

The whole Gitea deployment with all resources are moved into the namespace "gitea"

----

## Hands-on - Tasks

1. Find out in which namespace your Gitea instance is deployed to.
2. Which namespace is your kubectl using by default?
   1.  `kubectl config view --minify | less`
3. Create a namespace "gitea"
4. Add the `namespace` keyword to all corresponding resources.
5. Try to deploy your resources and check if they are inside the namespace "gitea"

----

## Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->