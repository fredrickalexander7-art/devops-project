#!/bin/bash

################################################################################
# Service Monitor Script - Beginner Exercise
# Purpose: Check if a service is running and report status
# Usage: ./service-monitor.sh [service-name]
################################################################################

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color

# Check if user provided a service name
if [ $# -eq 0 ]; then
    echo "Usage: $0 <service-name>"
    echo "Example: $0 ssh"
    exit 1
fi

# Store the service name in a variable
SERVICE_NAME=$1

echo "Checking service: $SERVICE_NAME"
echo "================================"

# Check if the service is running
if systemctl is-active --quiet $SERVICE_NAME; then
    echo -e "${GREEN}✓ $SERVICE_NAME is RUNNING${NC}"
    
    # Get more details about the service
    echo ""
    echo "Service Details:"
    systemctl status $SERVICE_NAME --no-pager | head -10
    
    exit 0
else
    echo -e "${RED}✗ $SERVICE_NAME is NOT RUNNING${NC}"
    
    # Show why it failed
    echo ""
    echo "Service Status:"
    systemctl status $SERVICE_NAME --no-pager | head -10
    
    exit 1
fi
