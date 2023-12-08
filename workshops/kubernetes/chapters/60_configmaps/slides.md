# Kubernetes ConfigMaps

<img src="./images/k8s-icons/resources/labeled/cm.svg" class="k8s-icon-large-centered">

In this chapter you will learn how to create and use ConfigMaps.

----

## ConfigMaps

**Was ist eine ConfigMap?**

* Key-value storage
* Stellen Umgebungsvariablen oder Dateien für Pods zur Verfügung

----

## Anlegen einer ConfigMap

```sh
kubectl apply -f

```
----

## ConfigMaps - Änderungen

* ConfigMaps *können* als "`immutable`* markiert werden
  (seit Kubernetes 1.21 ist das ein stabiles Feature, also relativ neu)
* Wie erfahren Pods, dass sich referenzierte ConfigMaps geändert haben?
  - `envFrom`: Änderungen werden nicht propagiert
  - `volumeMount`: Änderungen werden nur propagiert, wenn kein `subPath` verwendet wird

----

## Hands-on ConfigMaps

We want to fully automate the installation process of Gitea.
Goal is to pre-configure everything using Kubernetes manifests.

Use the old deployed yaml files of Gitea. If not at hand see [here](tbd)

### Goal

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

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Summary

* ConfigMaps sind Key-value stores
* Gut für: die Ablage von Umgebungsvariablen (.env File)
* Gut für: Konfigurationsdateien
* ConfigMaps können als `immutable` markiert werden
* Versionierung kann über Suffixes (z.B. Hashes des Inhalts o.Ä.) erfolgen
* Vorsicht mit Werten, die in JSON/YAML kein String sind!
