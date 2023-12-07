# Kubernetes Services

<div><img src="./images/k8s-icons/resources/labeled/svc.svg" class="k8s-icon-large-centered"></div>

**Was ist ein Service?**

* DNS &amp; Cluster-internes Load balancing
* Services ermöglichen Pods den Zugriff auf andere Pods

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
