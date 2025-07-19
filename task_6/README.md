# Task 6: Jenkins Pipeline for Flask App Deployment

## Overview
This task automates CI/CD using Jenkins to build, test, scan, and deploy a Flask app to Kubernetes.

## CI/CD Pipeline Stages
- ✅ Git clone
- ✅ Python test via `pytest`
- ✅ SonarQube scan
- ✅ Docker build & push to DockerHub
- ✅ Helm deployment to Minikube
- ✅ Smoke test via curl
- ✅ Notifications via email

## Prerequisites
- Jenkins with Docker and SonarQube plugins
- DockerHub account
- Kubernetes cluster via Minikube
- Helm CLI installed

## App Verification
```bash
curl $(minikube service flask-app --url)
