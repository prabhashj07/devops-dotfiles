# How to Use the `docker-helper.sh` Script

The `docker-helper.sh` script provides utility functions for common Docker tasks. Below are the available commands and how to use them.

## Prerequisites

Make sure you have Docker installed and running on your system.

## Usage

```bash
./docker-helper.sh [command] [arguments...]

## build a docker image 
./docker-helper.sh build [image-name] [dockerfile]

## run a docker container 
./docker-helper.sh run [container-name] [image-name]

## stop and remove a docker container 
./docker-helper.sh stop-and-remove [container-name]

## list running containers 
./docker-helper.sh list

## show docker image info 
./docker-helper.sh image-info [image-name]


