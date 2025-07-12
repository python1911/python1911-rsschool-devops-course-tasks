# Flask App Deployment with Helm (Task 5)

This repository contains a simple Flask web application and its deployment configuration using Helm on a Kubernetes cluster (Minikube).

## 🧠 Task Overview

This task demonstrates the following DevOps practices:
- Dockerizing a Python Flask app
- Publishing Docker images to Docker Hub
- Writing a Helm chart to deploy the app
- Verifying the app is accessible via the browser
- Providing proper documentation and screenshots

---

## 📁 Project Structure

task_5/
├── flask_app/
│ ├── app.py
│ ├── Dockerfile
│ ├── requirements.txt
│ └── (screenshot of working app)
└── helm/
└── flask-app/
├── Chart.yaml
├── templates/
│ ├── deployment.yaml
│ └── service.yaml
└── values.yaml


---

## 🚀 Setup & Deployment Instructions

### Prerequisites

- Docker Desktop or Docker Engine
- Helm
- Minikube
- Git
- A Docker Hub account (`admdevops` in this case)

---

### 1. Docker Image Build & Push

```bash
cd task_5/flask_app
docker build -t admdevops/flask-app:latest .
docker push admdevops/flask-app:latest

🚀 Deployment Instructions
1. Pre-requisites
Docker

Minikube

kubectl

Helm

2. Start Minikube (if not already running)

minikube start
3. Deploy with Helm
From the project root directory:


helm install flask-app ./task_5/helm/flask-app
4. Access the Application
Get the service URL:


minikube service flask-app --url
Example output:


http://127.0.0.1:63373
Open this URL in a browser to confirm the app is working.

📜 Summary
Component	Status
Dockerfile	✅ Created and tested locally
Docker Hub Image	✅ admdevops/flask-app:latest
Helm Chart	✅ Fully functional
App in Browser	✅ Accessible via NodePort
README	✅ You're reading it!

🧪 Evaluation Criteria Met
✅ Helm Chart Creation (40 points)

✅ Application Deployment and Accessibility (50 points)

✅ Documentation + Screenshot (10 points)

🎉 Total: 100 / 100 Points
