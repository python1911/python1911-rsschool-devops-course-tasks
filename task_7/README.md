# Task 7: Monitoring with Prometheus & Grafana

This task involved deploying Prometheus and Grafana on a Kubernetes cluster using Helm charts, validating their status, and attempting to integrate them for monitoring.

---

## 📌 Objectives

- Deploy Prometheus and Grafana via Helm
- Access Prometheus UI (port-forwarded)
- Access Grafana UI (port-forwarded)
- Add Prometheus as a data source in Grafana
- Create dashboards (optional)

---

## ⚙️ Setup Overview

- **Cluster**: Minikube (local)
- **Namespace**: `default`
- **Helm Charts**: Bitnami (`prometheus`, `grafana`)
- **Port Forwards**:
  - Prometheus: `localhost:9090`
  - Grafana: `localhost:8081`

---

## 🚀 Installation Steps

### 1. Install Prometheus

```bash
helm install prometheus bitnami/prometheus
