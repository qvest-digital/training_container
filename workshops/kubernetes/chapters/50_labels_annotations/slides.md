# Kubernetes Labels &amp; Annotations

- What are kubernetes labels and annotations?
- How do you create/attache labels?

----

## Hands-on

- Look at the labels of the gitea pod
  - `kubectl get pods --show-labels`
- List pods using a label selector
  - `kubectl get pods -l <...>`

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  - annotations

----

## Recommended Labels

* `app.kubernetes.io/name`
* `app.kubernetes.io/instance`
* `app.kubernetes.io/version`
* `app.kubernetes.io/component`
* `app.kubernetes.io/part-of`
* `app.kubernetes.io/managed-by`

Source: [Kubernetes Dokumentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/)

----

## Example of using Recommended labels

```yaml
# This is an excerpt
metadata:
  labels:
    app.kubernetes.io/name: mysql
    app.kubernetes.io/instance: mysql-abcxzy
    app.kubernetes.io/version: "5.7.21" # <-- achtung!
    app.kubernetes.io/component: database
    app.kubernetes.io/part-of: wordpress
    app.kubernetes.io/managed-by: helm
```

----

# Annotations - Default container

You can specify the default container (`-c`) used whenever `kubectl`
interacts with a given pod by adding a special annotation:

```yaml
# This is an excerpt
metadata:
  annotations:
    kubectl.kubernetes.io/default-container: name-of-the-container
```