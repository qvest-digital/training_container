# Kubernetes Secrets

<div><img src="./images/k8s-icons/resources/labeled/secret.svg" class="k8s-icon-large-centered"></div>

**Was ist ein Secret?**

----

## Secrets - base64-Daten

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

## Secrets - Anlegen eines Secrets

```sh
kubectl apply -f ./examples/k3s/gitea/basic_secret.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Secrets - Typen

* `Opaque` (am häufigsten verwendet)
* `kubernetes.io/tls`
* `kubernetes.io/ssh-auth`
* `kubernetes.io/basic-auth`
* ...

Ein leerer `spec.type` ist gleichbedeutend mit `spec.type=Opaque`

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/configuration/secret/)

Notes:
- Neue types können durch AdmissionControls in Form einer
  ValidatingWebhookConfiguration realisiert werden.

----

## Secrets - stringData

Vereinfachtes Anlegen von Secrets mit einer "write only" Property:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: test-secret-1
stringData:
  foo: bar
  bar: |
    Ein etwas längerer Wert mit viel Text
    und so ....
```

----

## Secrets - Zugriff per API

* Shell scripting mit `kubectl`, `jq` und `base64`

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Notes:
- verschieden Möglichkeite zeigen, wie Daten ausgelesen werden können.
- | jq ... | base64
- -o go-template='{{ .data.??? }}' ...
- -o jsonpath='{.data.???}'

----

## Secrets - Summary

* Secrets funktionieren im Wesentichen wie ConfigMaps
* Secrets haben einen Typen (default: `Opaque`)
* Secrets *können* (wie ConfigMaps) als "`immutable`" markiert werden
* Die Values eines Secrets sind base64 encoded
