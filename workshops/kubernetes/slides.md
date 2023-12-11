---
revealOptions:
  transition: fade

---

# Container mit kubernetes

<div id="header-footer">
  <p class="slide-footer"><img src="images/qvest/logo-orange.svg" height="64"><br>Qvest Digital AG<br></p>
</div>

----

<div class="divided">
  <h4>Volker Schmitz</h4>
  <img src="./images/saltyblu.png">
  <h5>DevOps Consultant</h5>
  <a href="mailto:v.schmitz@qvest-digital.com">v.schmitz@qvest-digital.com</a>
</div>

<div class="divided">
  <h4>Benjamin Jung</h4>
  <img src="./images/headcr4sh.png">
  <h5>DevOps Engineer</h5>
  <a href="b.jung@qvest-digital.com">b.jung@qvest-digital.com</a>
</div>

<!--div class="divided">
  <h4>Daniel Zerlett</h4>
  <img src="./images/b00lduck.png">
  <h5>Software Architect</h5>
  d.zerlett@qvest-digital.com
</div-->

Note:
Wer seid Ihr/Vorstellungsrunde
Regeln:

- Du
- Fragen direkt mit aufzeigen
  - kein reinreden
- Diskusionen erwünscht

----

# Einführung in Kubernetes auf Basis von k3s

 - Schulung für grundlegende Kenntnisse über Kubernetes
 - Fokus auf Einführung in Kubernetes und wichtige Konzepte
 - Praktisches Beispiel: Bereitstellung von Gitea mit PostgreSQL in Kubernetes

----

## Inhaltsverzeichnis

- Was ist Kubernetes?
- Architektur von Kubernetes
- Architektur-Unterschiede zwischen k8s und k3s
- Einführung in die Kommandozeile: kubectl
- Basis Ressourcen &amp; grundlegende Konzepte
- Optional: Kubernetes StatefulSet
- Optional: Kubernetes DaemonSet
- Optional: Einblick in Kustomize
- Optional: Praktische Tools
---

# Einführung in Kubernetes auf Basis von k3s

 - Schulung für grundlegende Kenntnisse über Kubernetes
 - Fokus auf Einführung in Kubernetes und wichtige Konzepte
 - Praktisches Beispiel: Bereitstellung von Gitea mit PostgreSQL in Kubernetes

----

## Inhaltsverzeichnis

- Was ist Kubernetes?
- Architektur von Kubernetes
- Architektur-Unterschiede zwischen k8s und k3s
- Einführung in die Kommandozeile: kubectl
- Basis Ressourcen &amp; grundlegende Konzepte
- Optional: Kubernetes StatefulSet
- Optional: Kubernetes DaemonSet
- Optional: Einblick in Kustomize
- Optional: Praktische Tools

---

## Was ist Kubernetes?

 - Orchestrierungssystem (nicht nur) für Container
 - Open Source
 - Verwaltung, Bereitstellung und Skalierung von Anwendungen
 - Deklarative Konfiguration
 - Einblick in die Kubernetes Distributionen
 - Erweiterbarkeit

----

### „Griechische Seefahrer“

<!-- .slide: data-background-opacity="10%" data-background-image="./images/backgrounds/choco-1920x1080.png" -->

  - Kubernetes ist das griechische Wort für „Steuermann“
  - Viele Kubernetes-nahe Projekte nutzen (z.T. griechische) Begriffe
    mit nautischem Ursprung
      - Istio (griechisch ιστίο = „Segel“)
      - Helm (Steuerrad),
      - Popeye (der Spinat-essende Seemann)
  - Die Abkürzung K8S
    - K(ubernete)S = K(8)S
    - K + 8 Buchstaben + N = Kubernetes

Notes:
- tiller

----

### Kubernetes Architecture (K8S)

- Master-Knoten
- Worker-Knoten
- Kubernetes API-Server
- etcd
- Weitere Komponenten

----
### Kubernetes Components

<div><img src="./images/k8s-architecture-1.png" style="height: 400px;"></div>

Source: [CNCF.io blog post](https://www.cncf.io/blog/2019/08/19/how-kubernetes-works/)

----

### Architektur-Unterschiede zu k3s

- (Opininated) Kubernetes ohne Bloat
- Aussprache: keez / keys (?)
- CRI: containerd, CNI: flannel
- SQlite statt etcd als backend storage
- Traefik als Ingress Controller

----

### k3s-Komponenten (Diagramm)

<div><img src="./images/k3s-architecture-1.png" style="height: 400px;"></div>

Source: [k3s Dokumentation](https://docs.k3s.io/architecture)

----

### When to use Kubernetes and when not


---

# kubectl

Unser Tool für den Hands-on Workshop

<div><img src="./images/kubectl-logo/kubectl-logo-full.png" style="width: 256px; height: 256px;"></div>

... und wer ist eigentlich <q cite="https://groups.google.com/g/kubernetes-sig-cli/c/M6t40JP6n0g/m/U6Snz-bsFQAJ">kube-cuttle</q>?

----

### kubectl - Smoke test

```sh
kubectl version
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  kubectl cluster-info ausführen und damit Funktionsweise von k3s überprüfen evtl.?

----

### Code-completion for kubectl


<!-- .slide: data-background-opacity="20%" data-background-image="./images/backgrounds/magician-1920x1080.png" -->

- bash:
  ```bash
  echo "source <(kubectl completion bash)" >> ~/.bashrc
  ```
- zsh:
  ```zsh
  echo '[[ $commands[kubectl] ]]' \
  '&& source <(kubectl completion zsh)' >> ~/.zshrc
  ```
- fish:
  ```fish
  echo 'kubectl completion fish | source' >> ~/.config/fish/config.fish
  ```

Source: [kubernetes.io/docs](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete)

----

### kubectl - Imperative/Decalarative Usage

* Imperative usage for quick and easy tasks
* Reproducability much easier when using declarative API
* In this workshop we will be using  *nearly* only the declarative API

---

# Kubernetes Pods xxx

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

---

# Kubernetes Resources

*What is a kubernetes resource?*

<q cite="https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/">A resource is an endpoint in the Kubernetes API that stores a collection of API objects of a certain kind; for example, the built-in pods resource contains a collection of Pod objects.</q>

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)

----

## Storage of Kubernetes resources

- JSON-Objekte mit 3 oder 4 Keys zur eindeutigen Identifikation:
  - `apiVersion` ([API + "/"] + Version)
  - `kind`
  - `metadata.name`
  - (`metadata.namespace`)
- Auch wenn meistens YAML-Dateien editiert werden, wird doch immer JSON gespeichert

Note:
- Darauf hinweisen, dass alle YAML-spezifischen Features wie Kommentare, Anchors, etc.
  einfach wegfliegen.

----

## YAML Ain't Markup Language (YAML)

(Originally, YAML WAS said to mean *Yet Another Markup Language*)

You will have to learn YAML and get to know about some of
it's quirks to find your way around Kubernetes!

[YAML specification v1.2.2](https://yaml.org/spec/1.2.2/)

----

## Built-in: Basis-Ressoucen (v1)

* `apiVersion: v1` (manchmal auch "core" genannt)
* Kubernetes "v1"-Versprechen der vollständigen Abwärtskompatibilität

## Built-in: Basis-Ressourcen (non-v1)

Beispiele:

 * Ingress API (`networking.k8s.io/v1/Ingress`)
 * Horizontal Pod Autoscaling (`autoscaling/v2/HorizontalPodAutoscaler`)

----

## Custom Resources

Kubernetes kann mit Hilfe von `Custom Resource Definitions` erweitert
werden. (nicht im Scope des Teils des heutigen Workshops)

---

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

---

# Kubernetes Labels &amp; Annotations

- What are kubernetes labels and annotations?
- How do you create/attach labels?

----

## Hands-on

- Look at the labels of the gitea pod
  - `kubectl get pods --show-labels`
- List pods using a label selector
  - `kubectl get pods -l <...>`

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  - annotations

----

## Recommended Labels

* `app.kubernetes.io/name`
* `app.kubernetes.io/instance`
* `app.kubernetes.io/version`
* `app.kubernetes.io/component`
* `app.kubernetes.io/part-of`
* `app.kubernetes.io/managed-by`

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/)

----

## Example of using Recommended labels

```yaml
# This is an excerpt
metadata:
  labels:
    app.kubernetes.io/name: mysql
    app.kubernetes.io/instance: mysql-abcxzy
    app.kubernetes.io/version: "5.7.21" # <-- achtung!
    app.kubernetes.io/component: database
    app.kubernetes.io/part-of: wordpress
    app.kubernetes.io/managed-by: helm
```

----

# Annotations - Default container

You can specify the default container (`-c`) used whenever `kubectl`
interacts with a given pod by adding a special annotation:

```yaml
# This is an excerpt
metadata:
  annotations:
    kubectl.kubernetes.io/default-container: name-of-the-container
```
---

# Kubernetes ConfigMaps

<img alt="Kubernetes ConfigMap Icon" src="./images/k8s-icons/resources/labeled/cm.svg" class="k8s-icon-large-centered">

In this chapter you will learn how to create and use ConfigMaps.

----

## ConfigMaps

**What is a ConfigMap?**

* Key-value storage
* Decoupled way to provide config files and/or environment variables

----

## Creating a ConfigMap

```sh
kubectl apply -f ./examples/basic_configMap.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"><!-- .element: class="fragment" --></iframe>

----

## ConfigMaps - Changing their contents

* ConfigMaps *can* be marked as "`immutable`"
* How are Pods notified if referenced ConfigMaps have been changed?
  - `spec.containers.*.envFrom`: changes will not be propagated
  - `spec.containers.*.volumeMounts`: Changes will only be propagated if no `subPath` is in use

----

## Hands-on ConfigMaps

We want to fully automate the installation process of Gitea.
Goal is to pre-configure everything using Kubernetes manifests.

----

## Hands-on Goal

Make sure that Gitea will be immediately up and running when started

----

## Hands-on - Background

Gitea stores its configuration in a file called `app.ini` which
is usually located in `/etc/gitea/conf`.

To instruct Gitea to use the configuration file without a prior
prompt to the user to finalize the configuration, an environment
variable has to be set.

[Gitea Docs](https://docs.gitea.com/)

----

## Hands-on - Tasks

1. Modify the Pod's configuration and let it mount the contents of
  the configmap inside of `/etc/gitea/conf`.
2. Set the environment variable `GITEA__security__INSTALL_LOCK=true`
  inside of the Gitea pod by using the `envFrom` field inside the
  Gitea container, Use the `gitea-env` configMap to store the value.
3. Change the name of the APP_NAME of the Gitea installation to
  "Gitea (Qvest-Kube Workshop)" (or any other name you like)

----

## Hands-on - Questions

- What happens to the Pod if the ConfigMap is being changed
  while the Pod is still running?

----

## Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"><!-- .element: class="fragment" --></iframe>

----

## Storage constraints

<q cite="https://kubernetes.io/docs/concepts/configuration/configmap/">
A ConfigMap is not designed to hold large chunks of data.
The data stored in a ConfigMap cannot exceed 1 MiB.
If you need to store settings that are larger than this limit,
you may want to consider mounting a volume or use a separate database or
file service.
</q>

Source: <a href="https://kubernetes.io/docs/concepts/configuration/configmap/">Kubernetes Documentation</a>

----

## Abuse of ConfigMaps

Albeit not the original purpose, ConfigMaps are sometimes used to for a wide
range of "exotic" tasks, such as:

- Storage of shell scripts
- Storage of binary data (images, PDF files,...)

----

## Summary

* ConfigMaps store data as key-value pairs (values must be strings)
* Well suited for: storing environment variables (`.env` files)
* Well suited to be used to store config files (YAML multilines)
* ConfigMaps can be marked as `immutable`
* Versioning of ConfigMaps possible by name suffixes (e.g. hashing the contents)
* Make sure to always quote non-string values

---

# Kubernetes Secrets

<div><img alt="Kubernetes Secrets Icon" src="./images/k8s-icons/resources/labeled/secret.svg" class="k8s-icon-large-centered"></div>

In this chapter you will learn how to work with Kubernetes Secrets.

----

## What is a Secret?

<q cite="https://kubernetes.io/docs/concepts/configuration/secret/">
A Secret is an object that contains a small amount of sensitive data such as a password,
a token, or a key.
Such information might otherwise be put in a Pod specification or in a container image.
Using a Secret means that you don't need to include confidential data in your application code.
</q>

Source: <a href="https://kubernetes.io/docs/concepts/configuration/secret/">Kubernetes Documentation</a>

----

## Storage of base64 encoded data

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
data:
  password1: cGFzc3dvcmQ= # "secret"
  password2: c2VjcmV0     # "password"
```

----

## Secrets - Creating a secret (declarative way)

```sh
kubectl apply -f ./examples/k3s/gitea/basic_secret.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"><!-- .element: class="fragment" --></iframe>

----

## Secrets - Typen

* `Opaque` (most common one)
* `kubernetes.io/tls`
* `kubernetes.io/ssh-auth`
* `kubernetes.io/basic-auth`
* ...

Not specifying `spec.type` defaults to `spec.type=Opaque`

Source: [Kubernetes Documentation](https://kubernetes.io/docs/concepts/configuration/secret/)

Notes:
- Neue types können durch AdmissionControls in Form einer
  ValidatingWebhookConfiguration realisiert werden.

----

## Secrets - stringData

Simplified secret creation using a "write only" property ("stringData"):

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: test-secret-from-string-data
stringData:
  foo: "bar"
  bar: |
    More information that
    might even span multiple
    lines ...
```

----

## Secrets - Access via API

* Shell scripting with `kubectl`, `jq` and `base64`

<iframe src="http://localhost:4200?u=trainer&p=trainer"><!-- .element: class="fragment" --></iframe>

Notes:
- verschieden Möglichkeiten zeigen, wie Daten ausgelesen werden können.
- | jq ... | base64
- -o go-template='{{ .data.??? }}' ...
- -o jsonpath='{.data.???}'

----

## Hands-on Secrets

We want to automatically set and distribute database credentials.

----

## Hands-on Goal

Make sure that the password of the underlying Gitea database is
propagated to the Gitea server process.

----

## Hands-on Background

Gitea can be configured to use an external database (MySQL/MariaDB or
PostgreSQL). The credentials used to access the database can be stored
in the configuration file *or* an environment variable.

([Gitea Docs](https://docs.gitea.com/administration/config-cheat-sheet#database-database))

----

## Hands-o Background Tasks

----

## Hands-on Questions

----

## Secrets - Summary

* Secrets are very similar to ConfigMaps
* Secrets have a type that might be used to validate their contents (default: `Opaque`)
* Secrets can be marked as "`immutable`" (just like ConfigMaps)
* Values stored in a Secret are always stored base64 encoded

---

# Kubernetes Persistence

<div>
  <img src="./images/k8s-icons/resources/labeled/pv.svg" class="k8s-icon-large-centered">
  <img src="./images/k8s-icons/resources/labeled/pvc.svg" class="k8s-icon-large-centered">
</div>

PersistenceVolumes &amp; PersistentVolumeClaims

----

## Persistence Volumes

- Der Storage in Pods ist grundsätzlich "ephemeral" (*kurzlebig*)
  - Restart oder Crash führen zu einem Verlust der Daten

Um dies zu verhindern gibt es verschiedene Storage Provider

- [Built-in Types by K8S](https://kubernetes.io/docs/concepts/storage/volumes/)
- Erweiterbar über Plugins

----

## LocalStorageProvider in k3s

Ein `PersitentVolumeClaim` ist ein User-spezifischer "Storage Request",
der dazu dient Storage über das jeweilig Plugin zu beanspruchen.

----

## Hands-on

```shell
kubectl apply -f basic_pvc.yaml
kubectl apply -f basic_pvc_pod.yaml
kubectl get pv
kubectl pvc
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Hands-on

- Sorge dafür das deine Datenbank &amp; Gitea ihre Daten persistieren.
- Nutze hierzu die `local-path` (default) StorageClass von k3s.

---
---

# Kubernetes Deployments & ReplicaSets

<div>
  <img src="./images/k8s-icons/resources/labeled/rs.svg" class="k8s-icon-large-centered">
  <img src="./images/k8s-icons/resources/labeled/deploy.svg" class="k8s-icon-large-centered">
</div>

Notes:
  - replicaset

----

## Was ist ein ReplicaSet?

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

---

# Kubernetes StatefulSet
---

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

Start with your old deployed yaml files. If not in hand use [these](tbd).

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
---

# Optionals

- Kubernetes StatefulSet
- Kubernetes DaemonSet
- DeepDive PersitentVolumes & Claims
- `Kustomize`
- Usefull Tools
 - [k9s](https://k9scli.io/)
 - [kubectx / kubens](https://github.com/ahmetb/kubectx)
 - [popeye](https://github.com/derailed/popeye)


---

## Ausblick

- Lifecycle und Lifecycle Management
- Kubernetes Hardening
- Kubernetes LoadBalancing
- Controller / Operator
  - CustomResources
- Kubernetes unter der Haube

---

## Ende
