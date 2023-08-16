#!/bin/bash

# Docker Helper Script

# This script provides utility functions for Docker tasks.

# Colors for pretty printing
GREEN='\033[0;32m'
NC='\033[0m'  # No Color

# Function to build a Docker image
build_image() {
    local image_name=$1
    local dockerfile=$2
    echo -e "${GREEN}Building Docker image: $image_name${NC}"
    docker build -t "$image_name" -f "$dockerfile" .
    echo -e "${GREEN}Image built successfully!${NC}"
}

# Function to run a Docker container
run_container() {
    local container_name=$1
    local image_name=$2
    echo -e "${GREEN}Running Docker container: $container_name${NC}"
    docker run --name "$container_name" -d "$image_name"
    echo -e "${GREEN}Container is up and running!${NC}"
}

# Function to stop and remove a Docker container
stop_and_remove_container() {
    local container_name=$1
    echo -e "${GREEN}Stopping and removing container: $container_name${NC}"
    docker stop "$container_name"
    docker rm "$container_name"
    echo -e "${GREEN}Container stopped and removed!${NC}"
}

# Function to list running containers
list_containers() {
    echo -e "${GREEN}Listing running containers:${NC}"
    docker ps
}

# Function to show Docker image information
image_info() {
    local image_name=$1
    echo -e "${GREEN}Image information for: $image_name${NC}"
    docker image inspect "$image_name"
}

# Main function
main() {
    case "$1" in
        build)
            build_image "$2" "$3"
            ;;
        run)
            run_container "$2" "$3"
            ;;
        stop-and-remove)
            stop_and_remove_container "$2"
            ;;
        list)
            list_containers
            ;;
        image-info)
            image_info "$2"
            ;;
        *)
            echo "Usage: $0 [build|run|stop-and-remove|list|image-info] [args...]"
            exit 1
            ;;
    esac
}

# Run the main function with command-line arguments
main "$@"
