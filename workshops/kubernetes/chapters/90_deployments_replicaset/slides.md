# Kubernetes Deployments &amp; ReplicaSets

<div>
  <img src="./images/k8s-icons/resources/labeled/rs.svg" class="k8s-icon-large-centered">
  <img src="./images/k8s-icons/resources/labeled/deploy.svg" class="k8s-icon-large-centered">
</div>

Notes:
  - replicaset

----

## What is a ReplicaSet?

<q cite="">A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods.</q>

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)

----

## Verwendung eines ReplicaSets

<q cite="https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#when-to-use-a-replicaset">A ReplicaSet ensures that a specified number of pod replicas are running at any given time. However, a Deployment is a higher-level concept that manages ReplicaSets and provides declarative updates to Pods along with a lot of other useful features. Therefore, we recommend using Deployments instead of directly using ReplicaSets, unless you require custom update orchestration or don't require updates at all.</q>

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#when-to-use-a-replicaset)

----

## Was ist ein Deployment?

<q cite="https://kubernetes.io/docs/concepts/workloads/controllers/deployment/">
A Deployment provides declarative updates for Pods and ReplicaSets.</q>

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

----

## Hands-on

Erstelle ein Gitea-Server Deployment

```sh
kubectl apply -f ./examples/deployment.yaml
```

- Schaue Dir das Deployment mit `kubectl get` an
- Was fällt Dir bezüglich der Labels auf?
- Ändere den Wert von `spec.replicas`. Was passiert?
