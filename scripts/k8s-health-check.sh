#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

NAMESPACE="${NAMESPACE:-default}"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
HEALTH_STATUS="HEALTHY"
FAILED_CHECKS=0
TOTAL_CHECKS=0

log_message() {
    local message="$1"
    local level="${2:-INFO}"
    local color="$BLUE"
    
    case "$level" in
        SUCCESS) color="$GREEN" ;;
        WARN)    color="$YELLOW" ;;
        ERROR)   color="$RED" ;;
    esac
    
    echo -e "${color}[${TIMESTAMP}] [${level}]${NC} ${message}"
}

check_kubectl_installed() {
    if ! command -v kubectl &> /dev/null; then
        log_message "kubectl is not installed" "ERROR"
        exit 1
    fi
    log_message "kubectl found" "SUCCESS"
}

check_cluster_connectivity() {
    log_message "=== Checking Cluster Connectivity ===" "INFO"
    ((TOTAL_CHECKS++))
    
    if kubectl cluster-info &> /dev/null; then
        log_message "✓ Connected to API server" "SUCCESS"
    else
        log_message "✗ Cannot connect to API server" "ERROR"
        HEALTH_STATUS="UNHEALTHY"
        ((FAILED_CHECKS++))
        return 1
    fi
}

check_node_health() {
    log_message "=== Checking Node Health ===" "INFO"
    ((TOTAL_CHECKS++))
    
    local node_count=$(kubectl get nodes --no-headers 2>/dev/null | wc -l)
    log_message "Total nodes: ${node_count}" "INFO"
    
    local not_ready=$(kubectl get nodes --no-headers 2>/dev/null | grep -v "Ready" | wc -l)
    
    if [ "$not_ready" -eq 0 ]; then
        log_message "✓ All nodes Ready" "SUCCESS"
    else
        log_message "✗ ${not_ready} nodes not Ready" "WARN"
        HEALTH_STATUS="DEGRADED"
        ((FAILED_CHECKS++))
    fi
}

generate_report() {
    log_message "=== Summary ===" "INFO"
    log_message "Total checks: ${TOTAL_CHECKS}" "INFO"
    log_message "Failed checks: ${FAILED_CHECKS}" "INFO"
    log_message "Status: ${HEALTH_STATUS}" "INFO"
    
    case "$HEALTH_STATUS" in
        HEALTHY) return 0 ;;
        DEGRADED) return 1 ;;
        UNHEALTHY) return 2 ;;
    esac
}

main() {
    log_message "Starting K8s Health Check" "INFO"
    check_kubectl_installed
    check_cluster_connectivity || exit 1
    check_node_health
    echo ""
    generate_report
    exit $?
}

main
