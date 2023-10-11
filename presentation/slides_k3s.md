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

## Themen

- Überblick
- Kubernetes Resources
- Grundlagen Kubectl CLI
- Deepdive kubectl CLI
- Kubernetes hilfreiche Tools

---

# Einführung in Kubernetes auf Basis von k3s

 - Schulung für grundlegende Kenntnisse über Kubernetes
 - Fokus auf Einführung in Kubernetes und wichtige Konzepte
 - Praktisches Beispiel: Bereitstellung von Gitea mit PostgreSQL in Kubernetes

---

## Inhaltsverzeichnis

- Was ist Kubernetes?
- Warum Kubernetes verwenden?
- Architektur von Kubernetes
- Kubernetes-Begriffe
- Kubernetes-Ressourcen definieren
- Praktisches Beispiel: Bereitstellung von Gittea mit PostgreSQL
- Überwachung und Skalierung in Kubernetes
- Abschluss und Ausblick

---

## Was ist Kubernetes?

 - Orchestrierungssystem
 - Open Source
 - Verwaltung, Bereitstellung und Skalierung von Anwendungen
 - Deklarative Konfiguration
 - Einblick in die Kubernetes Distributionen
 - Erweiterbarkeit

---

## Architektur von Kubernetes

- Master-Knoten
- Worker-Knoten
- Kubernetes API-Server
- etcd
- Weitere Komponenten

---

## Architektur Unterschied zu k3s

- Unterschiede

---

## Basis Ressourcen I

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

## Kubernetes Pods - &Uuml;bung

1. Nutze einen versionierten Tag oder HASH für das Image (nicht latest!)
1. L&ouml;sche den erstellten Pod wieder.
1. Starte eine Gitea mit MariaDB im selben Pod

Zusatzaufgabe:
1. Konfiguriere die Datenbank und Gitea mittels `spec.containers.*.env`

[Kubernetes Docs](https://kubernetes.io/)

----

## Kubernetes Pods - &Uuml;bung

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


Note:
  - annotation

---

# Kubernetes Services

---

# Kubernetes ConfigMaps & Secrets

Anlegen einer Configmap

```
kubectl apply -f examples/k3s/gitea/configmap.yml
kubectl apply -f example/k3s/gitea/secrets.yml

```

Note:
  - Ziel: Konfiguriere Database mit PW als Secret

## Kubernetes ConfigMaps & Secrets - &Uuml;bung

1. Konfiguriere Gitea so, dass es beim Start direkt die PostgreSQL Datenbank nutzt.
1. Erweitere daf&uuml;r die erstellte Configmaps.

[Gitea Docs](https://docs.gitea.com/)

---

# Kubernetes Deployments

---

# Kubernetes Statefullsets

---

# Kubernetes Namespaces

---


# Einblick in Kustomize

---


----

# Ausblick

- Kubernetes Hardening-
- Kubernetes LoadBalancing
- Controller / Operator
  - CustomResources
- Kubernetes unter der Haube

---

## Praktische Tools

 - [k9s](https://k9scli.io/)
 - [kubectx / kubens](https://github.com/ahmetb/kubectx)
 - [popeye](https://github.com/derailed/popeye)

---

## Abschluss und Ausblick

Zum Abschluss werden wir eine Zusammenfassung der behandelten Themen geben und einen Ausblick auf weiterführende Schritte und Ressourcen geben, um Ihr Wissen über Kubernetes zu vertiefen.
