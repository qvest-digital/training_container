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
