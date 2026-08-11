# DevOps Project

A hands-on DevOps portfolio project demonstrating infrastructure automation, containerization, Kubernetes orchestration, and CI/CD pipelines.

## Quick Start

1. Clone: `git clone https://github.com/fredrickalexander7-art/devops-project.git`
2. Create cluster: `kind create cluster --name devops-project`
3. Build image: `docker build -t devops-app:latest -f app/Dockerfile app/`
4. Load to Kind: `kind load docker-image devops-app:latest --name devops-project`
5. Deploy: `kubectl apply -f kubernetes/deployment.yaml && kubectl apply -f kubernetes/service.yaml`
6. Test: `kubectl port-forward svc/devops-app-service 8080:80 &` then `curl http://localhost:8080/`

## Features

- Flask Python app
- Docker container
- Kubernetes deployment
- GitHub Actions CI/CD
