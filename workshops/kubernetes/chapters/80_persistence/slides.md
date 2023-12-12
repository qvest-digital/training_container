# Kubernetes Persistence

<div>
  <img src="./images/k8s-icons/resources/labeled/pv.svg" class="k8s-icon-large-centered">
  <img src="./images/k8s-icons/resources/labeled/pvc.svg" class="k8s-icon-large-centered">
</div>

PersistentVolumes &amp; PersistentVolumeClaims

----

## Persistent Volumes

- Storage in Pods by default is "ephemeral" (*short-lived*)
  - Restart or crash of a Pod will lead to data loss

To prevent this, a storage provider can be used:

- [Built-in Types by K8S](https://kubernetes.io/docs/concepts/storage/volumes/)
- Extensibility: storage provider plugins

----

## LocalStorageProvider in k3s

A `PersitentVolumeClaim` is a "storage request",
to claim storage defined by certain characteristics.

Characteristics:
- Storage class (one or more classes can map to the same underlying plugin)
- Access mode (`ReadWriteMany` / `ReadWriteOnce`)
- Storage capacity
- Label selectors

----

## Hands-on

```shell
kubectl apply -f basic_pvc.yaml
kubectl apply -f basic_pvc_pod.yaml
kubectl get pv
kubectl pvc
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

----

## Hands-on

- Ensure that Gitea and its database use persistent storages to store their data.
- Use the `local-path` (default) StorageClass of k3s.
