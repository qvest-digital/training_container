# Kubernetes Pods

<!-- .slide: data-background-opacity="20%" data-background-image="./images/backgrounds/dolphins.jpg" -->

<div><img src="./images/k8s-icons/resources/labeled/pod.svg" class="k8s-icon-large-centered"></div>

**What is a pod?**

<q cite="https://www.sciencefocus.com/nature/whats-the-difference-between-a-shoal-a-school-and-a-pod">Pods are herds of marine mammals including whales, dolphins, walruses and seals.</q>

Source: [BBC Science Focus](https://www.sciencefocus.com/nature/whats-the-difference-between-a-shoal-a-school-and-a-pod)

----

## Examples for this workshop?

Go get 'em: `https://github.com/qvest-digital/training_container`

----

## Kubernetes Pods - apply

Create a "gitea" pod by using the provided YAML file

```sh
kubectl apply -f ./examples/k3s/gitea/basic_pod.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Kubernetes Pods - describe


```sh
kubectl describe pods/gitea | less
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Kubernetes Pods - get

Have a look at the created pod

```sh
kubectl get pods/gitea
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  - Manifest Sections (meta/spec/status)
  - Vorstellung der Verschiedenen Outputs
    - YML/JSON/etc
  - Die Ablage im kubernetes ist immer JSON

----

## Kubernetes Pods - logs

Have a look at the log output

```sh
kubectl logs pods/gitea
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

What is 'follow mode'?

----

## Kubernetes Pods - port-forward

Use a port-forward to issue a HTTP request towards the pod

```sh
LOCAL_PORT=8080 # Set this variable to something that works for you. ;-)
kubectl port-forward pods/gitea ${LOCAL_PORT}:3000
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
- nicht zu weit ausschweifen

----

## Hands-on

1. Use a versioned tag or a SHA hash for the container image (don't use `latest`!)
1. Delete the created pod
1. Start gitea and a PostgreSQL database in the same pod

Additional stuff:
1. Configure the database and gitea itself by using `spec.containers.*.env`
1. Show logs of *all* containers: `kubectl logs pods/gitea --all-containers --prefix`

[Kubernetes Docs](https://kubernetes.io/)

----

## Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Summary

- Basic knowledge about Kubernetes YAML files
- Pod management
- Pod environment
- Basics of `kubectl`
  - apply / delete
  - describe
  - logs
