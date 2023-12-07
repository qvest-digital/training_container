# Kubernetes ConfigMaps

<img src="./images/k8s-icons/resources/labeled/cm.svg" class="k8s-icon-large-centered">

**Was ist eine ConfigMap?**

* Key-value storage
* Stellen Umgebungsvariablen oder Dateien für Pods zur Verfügung

----

## Anlegen einer ConfigMap

```sh
kubectl apply -f examples/k3s/gitea/configmap.yml

```

Note:
  - Ziel: Konfiguriere Database mit PW als Secret

### Hands-on

1. Konfiguriere Gitea so, dass es beim Start direkt die PostgreSQL Datenbank nutzt.
1. Erweitere daf&uuml;r die erstellte Configmaps.

[Gitea Docs](https://docs.gitea.com/)

----

## Hands-on

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## ConfigMaps - Änderungen

* ConfigMaps *können* als "`immutable`* markiert werden
  (seit Kubernetes 1.21 ist das ein stabiles Feature, also relativ neu)
* Wie erfahren Pods, dass sich referenzierte ConfigMaps geändert haben?
  - `envFrom`: Änderungen werden nicht propagiert
  - `volumeMount`: Änderungen werden nur propagiert, wenn kein `subPath` verwendet wird

----

## ConfigMaps - Summary

* ConfigMaps sind Key-value stores
* Gut für: die Ablage von Umgebungsvariablen (.env File)
* Gut für: Konfigurationsdateien
* ConfigMaps können als `immutable` markiert werden
* Versionierung kann über Suffixes (z.B. Hashes des Inhalts o.Ä.) erfolgen
* Vorsicht mit Werten, die in JSON/YAML kein String sind!
