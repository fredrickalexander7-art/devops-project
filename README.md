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
kubectl get nodes
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
kubectl get pods
```

6. Access the application:
```bash
kubectl port-forward svc/devops-app-service 8080:80 &
curl http://localhost:8080/
curl http://localhost:8080/health
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
│ └── build-and-deploy.yml # GitHub Actions CI/CD
└── README.md # This file

## Key Features

✅ **Multi-Replica Kubernetes Deployment** - 2 replicas for high availability and load balancing

✅ **Health Checks & Liveness Probes** - Kubernetes continuously monitors /health endpoint and auto-restarts failed pods

✅ **Docker Containerization** - Lightweight Python 3.9-slim base image, optimized for production

✅ **GitHub Actions CI/CD** - Automatic Docker builds and endpoint testing on every push to main

✅ **Environment Variable Support** - Configure app behavior across dev/test/prod environments

✅ **Infrastructure as Code** - Terraform for AWS VPC, security groups, and networking

✅ **Professional Documentation** - Complete setup guides, troubleshooting, and deployment instructions

## CI/CD Pipeline

GitHub Actions workflow automatically:
1. Triggers on every push to main branch
2. Builds Docker image with commit SHA tag
3. Tests by running container and hitting endpoints
4. Validates /health endpoint responds correctly
5. Reports results in GitHub Actions tab

View workflow runs: https://github.com/fredrickalexander7-art/devops-project/actions

## Deployment Guide

### Kubernetes Deployment Details

**Deployment Manifest** (kubernetes/deployment.yaml):
- 2 replicas for redundancy
- Flask app on port 5000
- Liveness probe checks /health every 10 seconds
- Automatic restart on unhealthy pods

**Service Manifest** (kubernetes/service.yaml):
- LoadBalancer type for external access
- Port 80 → 5000 routing
- Distributes traffic across replicas

### Testing the Deployment

```bash
# Check deployment status
kubectl get deployment devops-app
kubectl describe deployment devops-app

# Check running pods
kubectl get pods -l app=devops-app
kubectl logs -l app=devops-app

# Test endpoints
curl http://localhost:8080/
# Response: {"environment": "dev", "message": "Hello from DevOps!", "status": "running"}

curl http://localhost:8080/health
# Response: {"status": "healthy"}
```

### Scaling Replicas

```bash
# Scale to 5 replicas
kubectl scale deployment devops-app --replicas=5

# Scale back to 2
kubectl scale deployment devops-app --replicas=2
```

## Troubleshooting

**Pods won't start?**
```bash
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

**Image not loading?**
```bash
docker images | grep devops-app
kind load docker-image devops-app:latest --name devops-project
```

**Port-forward not working?**
```bash
pkill -f port-forward
kubectl port-forward svc/devops-app-service 8080:80 &
```

## Future Enhancements

- [ ] Add database integration (PostgreSQL)
- [ ] Implement Helm charts for easier deployment
- [ ] Multi-environment support (dev/test/prod)
- [ ] Add monitoring/logging (Prometheus, ELK)
- [ ] Deploy to AWS EKS
- [ ] Add ConfigMaps and Secrets management
- [ ] Implement network policies
- [ ] Add resource limits and requests

## Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [GitHub Actions](https://github.com/features/actions)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Author

Fredrick Alexander
- GitHub: [@fredrickalexander7-art](https://github.com/fredrickalexander7-art)
- LinkedIn: [fredrickalexanderiii](https://linkedin.com/in/fredrickalexanderiii)

Built as a portfolio project to demonstrate production-ready DevOps skills.
