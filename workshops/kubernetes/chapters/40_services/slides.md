# Kubernetes Services

<div><img src="./images/k8s-icons/resources/labeled/svc.svg" class="k8s-icon-large-centered"></div>

In this chapter you will learn how to work with Kubernetes Services

----

## What is a Service?

* DNS &amp; Cluster-internal Load balancing
* Services enable Pods to establish network connections to other pods

----

## Service Types

Kubernetes distinguishes between 4 different service types:

* ClusterIP (default)
* NodePort
* LoadBalancer
* ExternalName

Notes:
- First 3 service types derive behavior from each other.
- ExternalName is kind of a special case, which is rarely used.

## Service Type: `ClusterIP`

<q cite="https://kubernetes.io/docs/concepts/services-networking/service/#type-clusterip">
This default Service type assigns an IP address from a pool of IP addresses that your cluster has reserved for that purpose.</q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/services-networking/service/#type-clusterip)

----

## Service Type: `NodePort`

<q cite="https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport">
If you set the `type` field to `NodePort`, the Kubernetes control plane allocates a port from a range specified by `--service-node-port-range` flag (default: 30000-32767). Each node proxies that port (the same port number on every Node) into your Service. Your Service reports the allocated port in its `.spec.ports[*].nodePort` field.
</q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport)

----

## Service Type: `LoadBalancer`

<q cite="https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer">
On cloud providers which support external load balancers, setting the type field to LoadBalancer provisions a load balancer for your Service. The actual creation of the load balancer happens asynchronously, and information about the provisioned balancer is published in the Service's .status.loadBalancer field.
</q>

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer)

K3S also offers load balancing functionality by utilizing "ServiceLB" (formerly known as "Klipper").

Notes:
- "cloud providers" is kind of an odd description, because many Kubernetes distributions (including k3s)
  ship their own implementations to provider LB functionality.
- k3s utilizes ServiceLB (a.k.a. Klipper)
- Mention metallb as the de-facto standard in on-prem environments.

----


## Hands-on

Erstelle einen Separaten MariaDB Pod mit einem vorgeschalteten Service

```sh
kubectl apply -f ./basic_mariadb_service.yaml
```

- Schaue Dir Service und Pod mit kubectl describe an
- Nutze kubectl port-forward, um den Pod über den Service anzusprechen
- Verbinde Gitea mit dem separaten PostreSQL Pod

**ACHTUNG**: Port-forwarding funktioniert in der Praxis nicht so, wie man es erwartet!

----

## Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Hands-on

- Was ist der Unterschied zwischen den verschiedenen Service-Typen?
- Wozu dienen die Selektoren der Services?
- Was passiert, wenn zwei Services die gleichen Pods selektieren?
- Was passiert, wenn ein Service unterschiedliche Pods selektiert?
- Wie kann man überprüfen, welche Pods ein Service selektiert?
- Wie können Pods mit Hilfe von Services miteinander kommunizieren?

----

## Which pods does a service select?

... it's complicated ...

```sh
SERVICE_NAME="<...>"
kubectl get endpoints "${SERVICE_NAME}" -o=jsonpath='{.subsets[*].addresses[*].ip}' \
| tr ' ' '\n' \
| kubectl get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
```
