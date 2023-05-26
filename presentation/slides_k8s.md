---
revealOptions:
  transition: fade

---

# Container mit kubernetes

<div id="header-footer">
  <p class="slide-footer"><img src="images/light.svg" height="40" width="200"><br>tarent solutions GmbH<br>Volker Schmitz & Daniel Zerlett</p>
</div>

----

<div class="divided">
  <h4>Volker Schmitz</h4>
  <img src="./images/saltyblu.png">
  <h5>DevOps Engineer</h5>
  v.schmitz@tarent.de
</div>

<div class="divided">
  <h4>Daniel Zerlett</h4>
  <img src="./images/b00lduck.png">
  <h5>Software Architect</h5>
  d.zerlett@tarent.de
</div>

Note:
Wer seid Ihr/Vorstellungsrunde
Regeln:

- Du
- Fragen direkt mit aufzeigen
  - kein reinreden
- Diskusionen erwünscht

----

## Themen

- Überblick
- Kubernetes Resources
- Grundlagen Kubectl CLI
- Deepdive kubectl CLI
- Kubernetes hilfreiche Tools

---

# Überblick

- Was ist Kubernetes?
  - Orchestrator
- Kubernetes Architektur

----

## Was ist Kubernetes?


Notes:

----

## Architekturüberblick


Note:

---

# Kubernetes Resourcen

- Einführung in kubectl

----

## pod

----

## service etc.

----

## Zusammenfassung

- Erstellen eines Containers mit exponiertem Port
  - `podman run`
- Containerübersicht
  - `podman ps`
- Ausgabe von Logs
  - `podman logs`
- Docker CLI Hilfe
  - `podman help`
  - `podman help <subcommand>`

---

# Kubernetes CLI


----

## Kubectl


----

## Übung Kubectl

----

## Zusammenfassung

---

# Kustomize


----


----

## Einblick Volumes

----

## Übung

----

## Zusammenfassung

- Exponieren von beliebigen Ports
  - Random Ports
  - Fixed Ports
  - Port Ranges
- Einbinden von Volumes
  - Volumetypen
  - Schreibberechtigung (ro/rw)
- Stoppen und löschen von Containern
  - podman stop
  - podman rm [-f]

Note:
podman run -p 3000:3000 -p 3022:22 -v $(pwd)/giteatest:/data gitea/gitea

---

# Kubectl deepdive?

---

# Hilfreiche tools

---

# Ende
