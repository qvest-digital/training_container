# Kubernetes Namespaces

- Kubernetes verwendet Namespaces, um Ressourcen innerhalb eines Clusters zu isolieren.
- Die Namen von Ressourcen müssen innerhalb eines Namespaces eindeutig sein, aber nicht über Namespaces hinweg.
- Die Namespace-basierte Begrenzung gilt nur für namespaced Objekte
  - (z.B. Deployments, Services)
  - nicht für cluster-weite Objekte (z.B. StorageClass, Nodes, PersistentVolumes).
  - ein Namespace selbst ist ein cluster-weites Objekt.

----

## Namespaces

```sh
kubectl get namespace
kubectl namespace create gitea
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

----

## Hands-on

Welchen Namespace nutzt du?

```shell
kubectl config view --minify | less
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Hands-On

- Verschiebe deine Gitea Application in den Namespace SVC.
- Entferne deine vorhereige Application
  - in welchem Namespace befand sie sich?
- Benutze den `namespace` Parameter im Manifest.
