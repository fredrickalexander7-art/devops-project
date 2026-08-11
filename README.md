# DevOps Project: End-to-End CI/CD Pipeline

A complete DevOps portfolio project demonstrating infrastructure automation, containerization, Kubernetes orchestration, and CI/CD pipelines.

## Overview

This project demonstrates a production-ready DevOps workflow with containerization, orchestration, automation, and infrastructure as code.

## Technologies

- Python 3.9, Flask 2.3.0
- Docker
- Kubernetes (Kind)
- GitHub Actions
- Terraform (AWS)

## Quick Start

1. Clone: `git clone https://github.com/fredrickalexander7-art/devops-project.git`
2. Create cluster: `kind create cluster --name devops-project`
3. Build image: `docker build -t devops-app:latest -f app/Dockerfile app/`
4. Load to Kind: `kind load docker-image devops-app:latest --name devops-project`
5. Deploy: `kubectl apply -f kubernetes/deployment.yaml && kubectl apply -f kubernetes/service.yaml`
6. Test: `kubectl port-forward svc/devops-app-service 8080:80 &` then `curl http://localhost:8080/`

## Project Structure

- app/ - Flask application with Docker
- kubernetes/ - Deployment and service manifests
- terraform/ - AWS infrastructure code
- .github/workflows/ - GitHub Actions CI/CD
- README.md - Documentation

## Key Features

✅ Multi-replica Kubernetes deployment
✅ Health checks and liveness probes
✅ Docker containerization
✅ GitHub Actions CI/CD automation
✅ Environment variable support
✅ Infrastructure as Code (Terraform)

## CI/CD Pipeline

Automatic builds and testing on every push to main.
View: https://github.com/fredrickalexander7-art/devops-project/actions

## Testing

```bash
curl http://localhost:8080/
curl http://localhost:8080/health
```

## Troubleshooting

Pods won't start: `kubectl describe pod <name>`
Image issues: `kind load docker-image devops-app:latest --name devops-project`

## Future Enhancements

- Database integration
- Helm charts
- Multi-environment support
- Monitoring/logging (Prometheus, ELK)
- AWS EKS deployment

## Author

Fredrick Alexander
GitHub: @fredrickalexander7-art
LinkedIn: fredrickalexanderiii

Built as a portfolio project to demonstrate production-ready DevOps skills.
