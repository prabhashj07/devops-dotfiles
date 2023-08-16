# How to Use the `kubectl-helper.sh` Script

The `kubectl-helper.sh` script provides utility functions for common Kubernetes tasks. Below are the available commands and how to use them.

## Prerequisites

Make sure you have `kubectl` installed and properly configured to interact with your Kubernetes cluster.

## Usage

```bash
./kubectl-helper.sh [command] [arguments...]

## deploy a k8s manifest 
./kubectl-helper.sh deploy [manifest-file]

## delete a k8s resources
./kubectl-helper.sh delete [resource-type] [resource-name]

## get a logs from a pod 
./kubectl-helper.sh logs [pod-name] [container-name]

## describe a k8s resource
./kubectl-helper.sh describe [resource-type] [resource-name]

## port-forward to a pod 
./kubectl-helper.sh port-forward [pod-name] [local-port] [pod-port]

