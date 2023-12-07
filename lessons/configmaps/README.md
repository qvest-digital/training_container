# Kubernetes ConfigMaps

In this lesson you will learn how to create and use ConfigMaps.

## Background information

We want to fully automate the installation process of Gitea and
want to pre-configure everything using Kubernetes manifests.

To simplify this example, Gitea will be run inside a Pod, using
an embedded SQLite3 database.

Gitea stores its configuration in a file called `app.ini` which
is usually located in `/etc/gitea/conf`.

To instruct Gitea to use the configuration file without a prior
prompt to the user to finalize the configuration, an environment
variable has to be set.

## Goals

* Make sure that Gitea will be immediately up and running when
  started using the Manifests located in this folder.

## Tasks

1. Modify the Pod's configuration and let it mount the contents of
  the configmap inside of `/etc/gitea/conf`.
2. Set the environment variable `GITEA__security__INSTALL_LOCK=true`
  inside of the Gitea pod by using the `envFrom` field inside the
  Gitea container, Use the `gitea-env` configMap to store the value.
3. Change the name of the APP_NAME of the Gitea installation to
  "Gitea (Qvest-Kube Workshop)" (or any other name you like)

## Questions

* What happens to the Pod if the ConfigMap is being changed
  while the Pod is still running?
