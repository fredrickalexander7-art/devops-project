# DevOps Scripts

## Scripts Overview

### k8s-health-check.sh
**Purpose:** Comprehensive Kubernetes cluster health verification script

**What it does:**
- Checks kubectl installation
- Verifies cluster connectivity to Kubernetes API server
- Validates all nodes are in Ready state
- Monitors pod health and deployment replica status
- Provides summary report with exit codes for CI/CD integration

**Usage:**
```bash
./k8s-health-check.sh
```

**Compatible with:** Azure AKS, AWS EKS, on-premises Kubernetes

---

### service-monitor.sh
**Purpose:** Simple service status checker

**What it does:**
- Checks if a Linux service is running
- Displays service status details
- Returns appropriate exit codes

**Usage:**
```bash
./service-monitor.sh [service-name]
./service-monitor.sh ssh
./service-monitor.sh docker
```

---

## When to Use These Scripts

- **k8s-health-check.sh** → Pre-deployment checks, monitoring, CI/CD pipelines
- **service-monitor.sh** → System maintenance, service troubleshooting, automation scripts
