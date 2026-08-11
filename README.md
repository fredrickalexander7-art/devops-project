# DevOps Project: End-to-End CI/CD Pipeline

A complete DevOps portfolio project demonstrating infrastructure automation, containerization, Kubernetes orchestration, and CI/CD pipelines. Built from a real technical assessment for a DevOps Engineer role.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Technologies](#technologies)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Key Features](#key-features)
- [CI/CD Pipeline](#cicd-pipeline)
- [Deployment Guide](#deployment-guide)
- [Troubleshooting](#troubleshooting)
- [Future Enhancements](#future-enhancements)

## Overview

This project demonstrates a production-ready DevOps workflow:
1. **Containerized Application** - Python Flask app packaged with Docker
2. **Orchestration** - Kubernetes cluster managing multi-replica deployment
3. **Automation** - GitHub Actions CI/CD pipeline for automated builds and testing
4. **Infrastructure as Code** - Terraform configurations for AWS cloud resources

## Architecture

GitHub Repo → GitHub Actions CI/CD → Docker Build & Test → Kubernetes Deployment → Service Load Balancer → Client Requests

## Technologies

- **Application**: Python 3.9, Flask 2.3.0
- **Containerization**: Docker
- **Orchestration**: Kubernetes (Kind - local cluster)
- **CI/CD**: GitHub Actions
- **Infrastructure**: Terraform (AWS)
- **Version Control**: Git & GitHub
- **Monitoring**: Kubernetes health checks & liveness probes

## Quick Start

### Prerequisites

- Docker (v29+)
- Kind (v0.20+)
- kubectl (v1.27+)
- Git

### Local Deployment (5 minutes)

1. Clone the repository:
```bash
git clone https://github.com/fredrickalexander7-art/devops-project.git
cd devops-project
```

2. Create Kubernetes cluster:
```bash
kind create cluster --name devops-project
```

3. Build Docker image:
```bash
docker build -t devops-app:latest -f app/Dockerfile app/
```

4. Load image into Kind:
```bash
kind load docker-image devops-app:latest --name devops-project
```

5. Deploy to Kubernetes:
```bash
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
```

6. Access the application:
```bash
kubectl port-forward svc/devops-app-service 8080:80 &
curl http://localhost:8080/
```

## Project Structure

devops-project/
├── app/
│ ├── app.py # Flask application
│ ├── requirements.txt # Python dependencies
│ └── Dockerfile # Docker image definition
├── kubernetes/
│ ├── deployment.yaml # K8s deployment manifest
│ └── service.yaml # K8s service manifest
├── terraform/
│ ├── main.tf # AWS infrastructure
│ ├── variables.tf # Terraform variables
│ └── outputs.tf # Terraform outputs
├── .github/
│ └── workflows/
│ └── build-and-deploy.yml
└── README.md

## Key Features

✅ Multi-Replica Kubernetes Deployment
✅ Health Checks & Liveness Probes
✅ Docker Containerization
✅ GitHub Actions CI/CD
✅ Environment Variable Support
✅ Infrastructure as Code (Terraform)

## CI/CD Pipeline

GitHub Actions automatically builds, tests, and validates on every push to main.

View runs: https://github.com/fredrickalexander7-art/devops-project/actions

## Deployment Guide

### Testing the Deployment

```bash
kubectl get pods
kubectl logs -l app=devops-app
curl http://localhost:8080/
curl http://localhost:8080/health
```

### Scaling Replicas

```bash
kubectl scale deployment devops-app --replicas=5
```

## Troubleshooting

**Pods won't start?**
```bash
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

**Image not loading?**
```bash
kind load docker-image devops-app:latest --name devops-project
```

## Future Enhancements

- Add database integration (PostgreSQL)
- Implement Helm charts
- Multi-environment support (dev/test/prod)
- Add monitoring/logging (Prometheus, ELK)
- Deploy to AWS EKS

## Author

Fredrick Alexander
- GitHub: [@fredrickalexander7-art](https://github.com/fredrickalexander7-art)
- LinkedIn: [fredrickalexanderiii](https://linkedin.com/in/fredrickalexanderiii)

Built as a portfolio project to demonstrate production-ready DevOps skills.
