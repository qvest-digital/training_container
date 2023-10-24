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
  v.schmitz@qvest-digital.com
</div>

<div class="divided">
  <h4>Benjamin Jung</h4>
  <img src="./images/headcr4sh.png">
  <h5>DevOps Engineer</h5>
  b.jung@qvest-digital.com
</div>

<!--div class="divided">
  <h4>Daniel Zerlett</h4>
  <img src="./images/b00lduck.png">
  <h5>Software Architect</h5>
  d.zerlett@tarent.de
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

TBD

---

## Was ist Kubernetes?

 - Orchestrierungssystem (nicht nur) für Container
 - Open Source
 - Verwaltung, Bereitstellung und Skalierung von Anwendungen
 - Deklarative Konfiguration
 - Einblick in die Kubernetes Distributionen
 - Erweiterbarkeit

----

### "Griechische Seefahrer"

  - Kubernetes ist das griechische Wort für „Steuermann“
  - Viele Kubernetes-nahe Projekte nutzen griechische Begriffe
    und/oder Worte mit nautischem Ursprung

    Beispiele: Helm (Steuerrad), Popeye (der Spinat-essende Seemann)

    K8S: K + 8 Buchstaben + N = Kubernetes

----

### Architektur von Kubernetes

- Master-Knoten
- Worker-Knoten
- Kubernetes API-Server
- etcd
- Weitere Komponenten

----

### Architektur Unterschied zu k3s

- (Opininated) Kubernetes ohne Bloat
- Aussprache: keez / keys (?)
- CRI: containerd, CNI: flannel
- SQlite statt etcd als backend storage
- Traefik als Ingress Controller

---

## kubectl

Unser Tool für den Hands-on Workshop

<div><img src="./images/kubectl-logo/kubectl-logo-full.png" style="width: 256px; height: 256px;"></div>

... und wer ist eigentlich <q cite="https://groups.google.com/g/kubernetes-sig-cli/c/M6t40JP6n0g/m/U6Snz-bsFQAJ">kube-cuttle</q>?

----

### kubectl - Funktionstests

```sh
kubectl version
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  kubectl cluster-info ausführen und damit Funktionsweise von k3s überprüfen evtl.?

----

### Autocomplete für kubectl

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

Quelle: [kubernetes.io/docs](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete)

---

## Basis Ressourcen

- Pods
- Services
- Deployments

----

# Kubernetes Pods

<div><img src="./images/k8s-icons/resources/labeled/pod.svg" class="k8s-icon-large-centered"></div>

**Was ist ein Pod?**

<q cite="https://www.sciencefocus.com/nature/whats-the-difference-between-a-shoal-a-school-and-a-pod">Pods are herds of marine mammals including whales, dolphins, walruses and seals.</q>
(Source: [BBC Science Focus](https://www.sciencefocus.com/nature/whats-the-difference-between-a-shoal-a-school-and-a-pod))

----

## Kubernetes Pods - apply

Erstelle einen "gitea" Pod mit Hilfe der beigelegeten YAML Datei

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

Schaue dir den erstellen Pod im Cluster an

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

Schaue dir die logs von Gitea an

```sh
kubectl logs pods/gitea
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Wie funktioniert der "Follow Mode"?

----

## Kubernetes Pods - port-forward

Nutze port-forward, um einen HTTP-Request gegen den Pod abzusetzen

```sh
LOCAL_PORT=8080 # Setze diese Variable entsprechend Deinem Gusto. ;-)
kubectl port-forward pods/gitea ${LOCAL_PORT}:80
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
- nicht zu weit ausschweifen

----

## Kubernetes Pods - Hands-on

1. Nutze einen versionierten Tag oder HASH für das Image (nicht latest!)
1. Lösche den erstellten Pod wieder.
1. Starte eine Gitea mit MariaDB im selben Pod

Zusatzaufgabe:
1. Konfiguriere die Datenbank und Gitea mittels `spec.containers.*.env`

[Kubernetes Docs](https://kubernetes.io/)

----

## Kubernetes Pods - Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Kubernetes Pods - Zusammenfassung

- Einblick in kubernetes YAML files
- Pod Verwaltung
- Pod Environment
- Grundlagen `kubectl`
  - apply / delete
  - describe
  - logs

---

# Kubernetes Labels & Annotations

- Wozu sind Labels und Annotations gut?
- Wie erstellt man labels.

----

# Kubernetes Labels und Annotations - Hands-on

- Schaue Dir die Labels von Gitea an
  - `kubectl get pods --show-labels`
- Lass Dir Pods anhand von ausgesuchten Labels anzeigen
  - `kubectl get pods -l`

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  - annotation

---

# Kubernetes Services

<div><img src="./images/k8s-icons/resources/labeled/svc.svg" class="k8s-icon-large-centered"></div>

- Was ist ein Service?

----

## Kubernetes Services - Hands-on

Erstelle einen Separaten MariaDB Pod mit einem vorgeschalteten Service

```sh
kubectl apply -f ./basic_mariadb_service.yaml
```

- Schaue Dir Service und Pod mit kubectl describe an
- Nutze kubectl port-forward, um den Pod über den Service anzusprechen
- Verbinde Gitea mit dem separaten MariaDB Pod

**ACHTUNG**: Port-forwarding funktioniert in der Praxis nicht so, wie man es erwartet!

----

## Kubernetes Services - Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----
## Kubernetes Services - Hands-on

- Was ist der Unterschied zwischen den verschiedenen Service-Typen?
- Wozu dienen die Selektoren der Services?
- Was passiert, wenn zwei Services die gleichen Pods selektieren?
- Was passiert, wenn ein Service unterschiedliche Pods selektiert?
- Wie kann man überprüfen, welche Pods ein Service selektiert?
- Wie können Pods mit Hilfe von Services miteinander kommunizieren?

---

# Kubernetes ConfigMaps & Secrets

Anlegen einer Configmap

```sh
kubectl apply -f examples/k3s/gitea/configmap.yml
kubectl apply -f example/k3s/gitea/secrets.yml

```

Note:
  - Ziel: Konfiguriere Database mit PW als Secret

## Kubernetes ConfigMaps & Secrets - Hands-on

1. Konfiguriere Gitea so, dass es beim Start direkt die PostgreSQL Datenbank nutzt.
1. Erweitere daf&uuml;r die erstellte Configmaps.

[Gitea Docs](https://docs.gitea.com/)

----

## Kubernetes ConfitMap & Secrets - Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

# Kubernetes Simple Persistance

- PersistanceVolumes
- PersistanceVolumesClaims

# Kubernetes Deployments & ReplicaSets

Notes:
  - replicaset

---

# Kubernetes Namespaces

- Kubernetes verwendet Namespaces, um Ressourcen innerhalb eines Clusters zu isolieren.
- Die Namen von Ressourcen müssen innerhalb eines Namespaces eindeutig sein, aber nicht über Namespaces hinweg.
- Die Namespace-basierte Begrenzung gilt nur für namespaced Objekte
  - (z.B. Deployments, Services)
  - nicht für clusterweite Objekte (z.B. StorageClass, Nodes, PersistentVolumes).


----

## Kubernetes Namespaces

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

## Kubernetes Namespaces - Defaults

- default
- kube-node-lease
- kube-public
- kube-system

([Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/#initial-namespaces))

----

## Kubernetes Namespaces Hands-On

Weclhen Namespace nutze du?

```shell
kubectl config view --minify | less
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

---

## Kubernetss Namespaces Hands-On

- Verschiebe deine Gitea Application in den Namespace SVC.
- Entferne deine vorhereige Application
  - in welchem Namespace befand sie sich?
- Benutze den `namespace` paramether in deiner YML.


----

# Kuberentes Intermezzo: K8S-Abkürzungen

- Pod: po
- Service: svc
- ConfigMap: cm
- Namespace: ns

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->


---

# Optional: Kubernetes StatefulSet

---

# Optional: Kubernetes DaemonSet


---

# Optional: Einblick in Kustomize


---

## Optional: Praktische Tools

 - [k9s](https://k9scli.io/)
 - [kubectx / kubens](https://github.com/ahmetb/kubectx)
 - [popeye](https://github.com/derailed/popeye)


---

# Ausblick

- Lifecycle und Lifecycle Management
- Kubernetes Hardening
- Kubernetes LoadBalancing
- Controller / Operator
  - CustomResources
- Kubernetes unter der Haube

---

# Ende
