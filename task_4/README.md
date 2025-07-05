# Task 4: Jenkins Deployment with Helm and GitHub Actions

## 🌟 Objective

Deploy Jenkins using Helm in a Kubernetes cluster (Minikube), configure it with Job DSL using JCasC, and set up a GitHub Actions pipeline for future automation.

---

## 📁 Folder Structure

```
task_4/
├── .github/
│   └── workflows/
│       └── deploy-jenkins.yaml        # GitHub Actions pipeline
├── screenshots/
│   └── hello-world-job.png            # Screenshot of Hello World job log
├── jenkins-values.yaml                # Helm values including JCasC job config
├── README.md                          # This documentation
```

---

## 💠 Installation & Configuration Steps

### 1. Start Minikube

```bash
minikube start
```

---

### 2. Add Bitnami Helm Repository

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

---

### 3. Create Jenkins Namespace

```bash
kubectl create namespace jenkins
```

---

### 4. Deploy Jenkins via Helm

```bash
helm install jenkins bitnami/jenkins -n jenkins -f jenkins-values.yaml
```

---

### 5. Get Jenkins Admin Password (Windows PowerShell)

```powershell
kubectl get secret -n jenkins jenkins -o jsonpath="{.data.jenkins-password}" | powershell -Command "[System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((Get-Content -Raw)))"
```

---

### 6. Access Jenkins

```bash
minikube service jenkins -n jenkins
```

Open the printed URL in a browser.

* **Username:** `user`
* **Password:** from previous step

---

## 📸 Screenshots

* `screenshots/hello-world-job.png`: Jenkins freestyle job log showing "Hello world".
* `kubectl get all --all-namespaces`: Output attached in PR or screenshot form.

---

## ⚙️ Jenkins Configuration

* Jenkins is installed via Helm and exposed via NodePort.
* Admin credentials are set via `jenkins-values.yaml`.
* Jenkins configuration is stored on a persistent volume.
* The Hello World freestyle job is defined declaratively using:

  * JCasC (Jenkins Configuration as Code)
  * Job DSL script embedded in Helm values

---

## 🧩 JCasC Job Configuration

Embedded in `jenkins-values.yaml`:

```yaml
controller:
  adminUser: user
  adminPassword: your-password

  installPlugins:
    - job-dsl
    - configuration-as-code
    - workflow-job
    - credentials

  JCasC:
    enabled: true
    configScripts:
      job-dsl-script: |
        jobs:
          - script: >
              job('hello-world') {
                description('Hello World job via JCasC + Job DSL')
                steps {
                  shell('echo Hello world')
                }
              }
```

---

## 🔄 GitHub Actions Workflow

File: `.github/workflows/deploy-jenkins.yaml`

```yaml
name: Deploy Jenkins

on:
  push:
    branches: [ task_4 ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Echo (placeholder)
        run: echo "This would run deployment logic if cluster was reachable"
```

---

## ✅ Evaluation Checklist

| Criteria                                    | ✅ |
| ------------------------------------------- | - |
| Helm installation verified with Jenkins     | ✅ |
| Persistent volumes and PVC configured       | ✅ |
| Jenkins deployed in a separate namespace    | ✅ |
| Jenkins UI accessible                       | ✅ |
| Admin credentials retrieved & working       | ✅ |
| Job created via JCasC + Job DSL             | ✅ |
| Freestyle job runs and prints "Hello world" | ✅ |
| GitHub Actions pipeline added               | ✅ |
| `kubectl get all --all-namespaces` captured | ✅ |
| Screenshots attached                        | ✅ |

---

## 🔐 Credentials

* **Username:** `user`
* **Password:** (fetched from Kubernetes secret)

---

## 🪜 Cleanup

```bash
helm uninstall jenkins -n jenkins
kubectl delete pvc --all -n jenkins
```

---


