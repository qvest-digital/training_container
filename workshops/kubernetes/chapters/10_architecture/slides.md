# Introducion of kubernetes based on k3s

 - Workshop for kubernetes basic concepts & resources
 - With hands-on example:
   - Deploying: Gitea with PostgreSQL into k3s

----

## Content

- What is kubernetes?
- Basic Architecture of kubernetes
- Architecture differences between k8s und k3s
- CLI: kubectl
- Basic resources and concepts
- Open round with optionals

----

## Was ist Kubernetes?

 - Orchestrierungssystem (nicht nur) für Container
 - Open Source
 - Verwaltung, Bereitstellung und Skalierung von Anwendungen
 - Deklarative Konfiguration
 - Einblick in die Kubernetes Distributionen
 - Erweiterbarkeit

----

## „Griechische Seefahrer“

<!-- .slide: data-background-opacity="10%" data-background-image="./images/backgrounds/choco-1920x1080.png" -->

  - Kubernetes ist das griechische Wort für „Steuermann“
  - Viele Kubernetes-nahe Projekte nutzen (z.T. griechische) Begriffe
    mit nautischem Ursprung
      - Istio (griechisch ιστίο = „Segel“)
      - Helm (Steuerrad),
      - Popeye (der Spinat-essende Seemann)
  - Die Abkürzung K8S
    - K(ubernete)S = K(8)S
    - K + 8 Buchstaben + N = Kubernetes

Notes:
- tiller

----

## Kubernetes Architecture (K8S)

- Master-Knoten
- Worker-Knoten
- Kubernetes API-Server
- etcd
- Weitere Komponenten

----
## Kubernetes Components

<div><img src="./images/k8s-architecture-1.png" style="height: 400px;"></div>

Source: [CNCF.io blog post](https://www.cncf.io/blog/2019/08/19/how-kubernetes-works/)

----

## Architektur-Unterschiede zu k3s

- (Opininated) Kubernetes ohne Bloat
- Aussprache: keez / keys (?)
- CRI: containerd, CNI: flannel
- SQlite statt etcd als backend storage
- Traefik als Ingress Controller

----

## k3s-Komponenten (Diagramm)

<div><img src="./images/k3s-architecture-1.png" style="height: 400px;"></div>

Source: [k3s Dokumentation](https://docs.k3s.io/architecture)

----

## When to use Kubernetes and when not

- For Microservice Architecture
- Ensure scalability & high-availability
- Utilizing Continuous Integration and Deployment
- Multi-tenant applications
- High-performance computing

----

## When not to use kubernetes

- Missing experienced DevOps infrastructure engineers in team,
  - training costs and managing a Kubernetes cluster may be too high.
- Kubernetes excels in supporting large projects
  - small application which not require complex scaling/management
- Implementing Kubernetes is a slow and resource-demanding process
- If projects need to iterate quickly
  - Kubernetes might introduce an unacceptable management overhead.
- migration of legacy applications to containers is a time-consuming process.
  - The teams working on such applications often benefit more from traditional infrastructure management tools.