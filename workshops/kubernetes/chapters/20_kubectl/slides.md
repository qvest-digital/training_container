# kubectl

Unser Tool für den Hands-on Workshop

<div><img src="./images/kubectl-logo/kubectl-logo-full.png" style="width: 256px; height: 256px;"></div>

... und wer ist eigentlich <q cite="https://groups.google.com/g/kubernetes-sig-cli/c/M6t40JP6n0g/m/U6Snz-bsFQAJ">kube-cuttle</q>?

----

### kubectl - Smoke test

```sh
kubectl version
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->

Note:
  kubectl cluster-info ausführen und damit Funktionsweise von k3s überprüfen evtl.?

----

### Code-completion for kubectl


<!-- .slide: data-background-opacity="20%" data-background-image="./images/backgrounds/magician-1920x1080.png" -->

- bash:
  ```bash
  echo "source <(kubectl completion bash)" >> ~/.bashrc
  ```
- zsh:
  ```zsh
  echo '[[ $commands[kubectl] ]]' \
  '&& source <(kubectl completion zsh)' >> ~/.zshrc
  ```
- fish:
  ```fish
  echo 'kubectl completion fish | source' >> ~/.config/fish/config.fish
  ```

Source: [kubernetes.io/docs](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete)

----

### kubectl - Imperative/Decalarative Usage

* Imperative usage for quick and easy tasks
* Reproducability much easier when using declarative API
* In this workshop we will be using  *nearly* only the declarative API

---

## Kubernetes Pods

<!-- .slide: data-background-opacity="20%" data-background-image="./images/backgrounds/dolphins.jpg" -->

<div><img src="./images/k8s-icons/resources/labeled/pod.svg" class="k8s-icon-large-centered"></div>

**What is a pod?**

<q cite="https://www.sciencefocus.com/nature/whats-the-difference-between-a-shoal-a-school-and-a-pod">Pods are herds of marine mammals including whales, dolphins, walruses and seals.</q>

Source: [BBC Science Focus](https://www.sciencefocus.com/nature/whats-the-difference-between-a-shoal-a-school-and-a-pod)

----

### Examples for this workshop?

Go get 'em: `https://github.com/qvest-digital/training_container`

----

### Kubernetes Pods - apply

Create a "gitea" pod by using the provided YAML file

```sh
kubectl apply -f ./examples/k3s/gitea/basic_pod.yaml
```

<iframe src="http://localhost:4200?u=trainer&p=trainer"> <!-- .element: class="fragment" -->
