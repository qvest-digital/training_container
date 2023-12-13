# Kubernetes ConfigMaps

<img alt="Kubernetes ConfigMap Icon" src="./images/k8s-icons/resources/labeled/cm.svg" class="k8s-icon-large-centered">

In this chapter you will learn how to create and use ConfigMaps.

----

## What is a ConfigMap?

* Key-value storage
* Decoupled way to provide config files and/or environment variables

----

## Creating a ConfigMap

```sh
kubectl apply -f ./examples/basic_configMap.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"><!-- .element: class="fragment" --></iframe>

----

## Changing the contents of a ConfigMap

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
