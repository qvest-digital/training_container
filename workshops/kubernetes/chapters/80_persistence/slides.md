# Kubernetes Persistence

<div>
  <img src="./images/k8s-icons/resources/labeled/pv.svg" class="k8s-icon-large-centered">
  <img src="./images/k8s-icons/resources/labeled/pvc.svg" class="k8s-icon-large-centered">
</div>

PersistenceVolumes &amp; PersistentVolumeClaims

----

## Persistence Volumes

- Der Storage in Pods ist grundsätzlich "ephemeral" (*kurzlebig*)
  - Restart oder Crash führen zu einem Verlust der Daten

Um dies zu verhindern gibt es verschiedene Storage Provider

- [Built-in Types by K8S](https://kubernetes.io/docs/concepts/storage/volumes/)
- Erweiterbar über Plugins

----

## LocalStorageProvider in k3s

Ein `PersitentVolumeClaim` ist ein User-spezifischer "Storage Request",
der dazu dient Storage über das jeweilig Plugin zu beanspruchen.

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

- Sorge dafür das deine Datenbank &amp; Gitea ihre Daten persistieren.
- Nutze hierzu die `local-path` (default) StorageClass von k3s.

---