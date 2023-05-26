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

# Einführung in Kubernetes

---

## Ziel der Schulung

Das Ziel dieser Schulung ist es, grundlegende Kenntnisse über Kubernetes zu vermitteln. Wir werden uns auf den Einstieg in Kubernetes konzentrieren und die wichtigsten Konzepte und Begriffe kennenlernen. Wir werden auch ein praktisches Beispiel durchgehen, bei dem wir Gittea mit PostgreSQL in Kubernetes bereitstellen.

---

## Inhaltsverzeichnis

- Was ist Kubernetes?
- Warum Kubernetes verwenden?
- Architektur von Kubernetes
- Kubernetes-Begriffe
- Kubernetes-Ressourcen definieren
- Praktisches Beispiel: Bereitstellung von Gittea mit PostgreSQL
- Überwachung und Skalierung in Kubernetes
- Abschluss und Ausblick

---

## 1. Was ist Kubernetes?

Kubernetes ist ein Open-Source-Containerorchestrierungssystem, das die Verwaltung und Bereitstellung von Containern automatisiert. Es wurde entwickelt, um die Skalierung, Verwaltung und Wartung von Anwendungen in Containern zu erleichtern.

---

## 2. Warum Kubernetes verwenden?

Kubernetes bietet eine Vielzahl von Vorteilen für die Bereitstellung und Verwaltung von Anwendungen, einschließlich:

- Automatische Skalierung
- Ausfallsicherheit
- Vereinfachte Verwaltung
- Service Discovery und Load Balancing
- Declarative Konfiguration

---

## 3. Architektur von Kubernetes

Kubernetes besteht aus verschiedenen Komponenten, die zusammenarbeiten, um Anwendungen in Containern zu verwalten. Die wichtigsten Komponenten sind:

- Master-Knoten
- Worker-Knoten
- Kubernetes API-Server
- etcd
- Weitere Komponenten

---

## 4. Kubernetes-Begriffe

In Kubernetes gibt es einige wichtige Begriffe, die Sie verstehen sollten:

- Pods
- Services
- Replica Sets
- Deployments
- Ingress

---

## 5. Kubernetes-Ressourcen definieren

In Kubernetes werden Ressourcen über YAML-Dateien definiert. YAML ist eine les- und schreibfreundliche Sprache zur Beschreibung von Datenstrukturen. In den YAML-Dateien werden die verschiedenen Komponenten und Eigenschaften der Kubernetes-Ressourcen angegeben.

---

## 6. Praktisches Beispiel: Bereitstellung von Gittea mit PostgreSQL

In diesem Beispiel werden wir Gittea mit PostgreSQL in Kubernetes bereitstellen. Wir werden schrittweise vorgehen.

---

### Schritt 1: Erstellen einer YAML-Datei für den PostgreSQL-Service

Zuerst erstellen wir eine YAML-Datei, um den PostgreSQL-Service zu definieren.

---

### Schritt 2: Bereitstellung von PostgreSQL in Kubernetes

Anschließend bereiten wir den Befehl zum Bereitstellen des PostgreSQL-Services in Kubernetes vor.

---

### Schritt 3: Erstellen einer YAML-Datei für den Gittea-Service

Nun erstellen wir eine YAML-Datei, um den Gittea-Service zu definieren.

---

### Schritt 4: Bereitstellung von Gittea in Kubernetes

Im nächsten Schritt bereiten wir den Befehl zum Bereitstellen des Gittea-Services in Kubernetes vor.

---

### Schritt 5: Konfigurieren einer Ingress-Ressource für den externen Zugriff

Abschließend konfigurieren wir eine Ingress-Ressource, um den externen Zugriff auf den Gittea-Service zu ermöglichen.

---

## 7. Überwachung und Skalierung in Kubernetes

Wir werden auch einige grundlegende Konzepte der Überwachung und Skalierung in Kubernetes besprechen.

---

## 8. Abschluss und Ausblick

Zum Abschluss werden wir eine Zusammenfassung der behandelten Themen geben und einen Ausblick auf weiterführende Schritte und Ressourcen geben, um Ihr Wissen über Kubernetes zu vertiefen.
