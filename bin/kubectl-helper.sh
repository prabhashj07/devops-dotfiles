#!/bin/bash

# kubectl Helper Script

# This script provides utility functions for common Kubernetes tasks.
# Remember to make this script executable using: chmod +x kubectl-helper.sh

# Colors for pretty printing
GREEN='\033[0;32m'
NC='\033[0m'  # No Color

# Function to deploy a Kubernetes manifest
deploy_manifest() {
    local manifest_file=$1
    echo -e "${GREEN}Deploying Kubernetes manifest: $manifest_file${NC}"
    kubectl apply -f "$manifest_file"
    echo -e "${GREEN}Manifest deployed successfully!${NC}"
}

# Function to delete a Kubernetes resource
delete_resource() {
    local resource_type=$1
    local resource_name=$2
    echo -e "${GREEN}Deleting $resource_type: $resource_name${NC}"
    kubectl delete "$resource_type" "$resource_name"
    echo -e "${GREEN}$resource_type $resource_name deleted!${NC}"
}

# Function to get pod logs
get_pod_logs() {
    local pod_name=$1
    local container_name=${2:-}  # Use first container if not specified
    echo -e "${GREEN}Getting logs from pod: $pod_name (Container: $container_name)${NC}"
    kubectl logs "$pod_name" "$container_name"
}

# Function to describe a Kubernetes resource
describe_resource() {
    local resource_type=$1
    local resource_name=$2
    echo -e "${GREEN}Describing $resource_type: $resource_name${NC}"
    kubectl describe "$resource_type" "$resource_name"
}

# Function to port-forward to a pod
port_forward() {
    local pod_name=$1
    local local_port=$2
    local pod_port=${3:-$local_port}
    echo -e "${GREEN}Port-forwarding to pod: $pod_name (Local port: $local_port, Pod port: $pod_port)${NC}"
    kubectl port-forward "$pod_name" "$local_port:$pod_port"
}

# Main function
main() {
    case "$1" in
        deploy)
            deploy_manifest "$2"
            ;;
        delete)
            delete_resource "$2" "$3"
            ;;
        logs)
            get_pod_logs "$2" "$3"
            ;;
        describe)
            describe_resource "$2" "$3"
            ;;
        port-forward)
            port_forward "$2" "$3" "$4"
            ;;
        *)
            echo "Usage: $0 [deploy|delete|logs|describe|port-forward] [args...]"
            exit 1
            ;;
    esac
}

# Run the main function with command-line arguments
main "$@"
