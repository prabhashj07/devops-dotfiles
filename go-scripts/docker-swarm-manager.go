package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
	"github.com/docker/docker/api/types/swarm"
)

func main() {
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		log.Fatal(err)
	}

	// List services in the Swarm cluster
	services, err := listServices(cli)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Docker Swarm Services:")
	for _, service := range services {
		fmt.Printf("Service: %s\n", service.Spec.Name)
		fmt.Printf("  ID: %s\n", service.ID)
		fmt.Printf("  Replicas: %d\n", *service.Spec.Mode.Replicated.Replicas)
	}

	// List nodes in the Swarm cluster
	nodes, err := listNodes(cli)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Docker Swarm Nodes:")
	for _, node := range nodes {
		fmt.Printf("Node: %s\n", node.Description.Hostname)
		fmt.Printf("  ID: %s\n", node.ID)
		fmt.Printf("  Address: %s\n", node.Status.Addr)
	}
}

func listServices(cli *client.Client) ([]swarm.Service, error) {
	services, err := cli.ServiceList(context.Background(), types.ServiceListOptions{})
	if err != nil {
		return nil, err
	}
	return services, nil
}

func listNodes(cli *client.Client) ([]swarm.Node, error) {
	nodes, err := cli.NodeList(context.Background(), types.NodeListOptions{})
	if err != nil {
		return nil, err
	}
	return nodes, nil
}
