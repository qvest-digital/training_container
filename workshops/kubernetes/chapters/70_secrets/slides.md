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
