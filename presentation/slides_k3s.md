---
revealOptions:
  transition: fade

---

# Container mit kubernetes

<div id="header-footer">
  <p class="slide-footer"><img src="images/light.svg" height="40" width="200"><br>Qvest Digital AG<br></p>
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

 - Orchestrierungssystem
 - Open Source
 - Verwaltung, Bereitstellung und Skalierung von Anwendungen
 - Deklarative Konfiguration
 - Einblick in die Kubernetes Distributionen
 - Erweiterbarkeit

----

## Architektur von Kubernetes

- Master-Knoten
- Worker-Knoten
- Kubernetes API-Server
- etcd
- Weitere Komponenten

----

## Architektur Unterschied zu k3s

- Unterschiede

---

## Basis Ressourcen

- Pods
- Services
- Deployments

----

# Kubernetes Pods

- Was ist ein Pod?

----

## Kubernetes Pods - apply

Erstelle einen "gitea" Pod mit Hilfe der beigelegeten YAML Datei

```sh
kubectl apply -f ./examples/k3s/gitea/basic_pod.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Kubernetes Pods - describe

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

## Kubernetes Pods - HandsOn

1. Nutze einen versionierten Tag oder HASH für das Image (nicht latest!)
1. L&ouml;sche den erstellten Pod wieder.
1. Starte eine Gitea mit MariaDB im selben Pod

Zusatzaufgabe:
1. Konfiguriere die Datenbank und Gitea mittels `spec.containers.*.env`

[Kubernetes Docs](https://kubernetes.io/)

----

## Kubernetes Pods - HandsOn

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Kubernetes Pods - Zusammenfassung

- Einblick in kubernetes yaml files
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

# Kubernetes Labels und Annotations - HandsOn

- Schaue Dir die Labels von Gitea an
  - `kubectl get pods --show-labels`
- Lass Dir Pods anhand von ausgesuchten Labels anzeigen
  - `kubectl get pods -l`

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  - annotation

---

# Kubernetes Services

- Einblick in Services

----

## Kubernetes Services - HandsOn

Erstelle einen Separaten MariaDB Pod mit einem vorgeschalteten Service

```sh
kubectl apply -f ./basic_mariadb_service.yaml
```

- Schaue Dir Service und Pod mit kubectl describe an
- Nutze kubectl port-forward, um den Pod über den Service anzusprechen
- Verbinde Gitea mit dem separaten MariaDB Pod

**ACHTUNG**: Das funktioniert in der Praxis nicht so, wie man es erwartet!

----

## Kubernetes Services - HandsOn

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----
## Kubernetes Services - HandsOn

- Was ist der Unterschied zwischen den verschiedenen service types?
- Wozu dienen die Selectors der Services?
- Was passiert, wenn zwei Services die gleichen Pods selektieren?
- Was passiert, wenn ein Service unterschiedliche Pods selektiert?
- Wie kann man überprüfen, welche Pods ein Service selektiert?
- Wie können Pods mit Hilfe von Services miteinander kommunizieren?

---
# Kubernetes ConfigMaps & Secrets

Anlegen einer Configmap

```
kubectl apply -f examples/k3s/gitea/configmap.yml
kubectl apply -f example/k3s/gitea/secrets.yml

```

Note:
  - Ziel: Konfiguriere Database mit PW als Secret

## Kubernetes ConfigMaps & Secrets - HandsOn

1. Konfiguriere Gitea so, dass es beim Start direkt die PostgreSQL Datenbank nutzt.
1. Erweitere daf&uuml;r die erstellte Configmaps.

[Gitea Docs](https://docs.gitea.com/)

----
## Kubernetes ConfitMap & Secrets - HandsOn

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

# Kubernetes Simple Persistance

- PersistanceVolumes
- PersistanceVolumesClaims

# Kubernetes Deployments

Notes:
  - replicaset

---
# Kubernetes Namespaces

---
# Optional: Kubernetes Statefullsets

---

# Optional: Kubernetes Daemonset


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