package main

import (
	"context"
	"fmt"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
	"io"
	"log"
	"os"
)

func main() {
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		log.Fatal(err)
	}

	containers, err := cli.ContainerList(context.Background(), types.ContainerListOptions{})
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Docker Containers:")
	for _, container := range containers {
		fmt.Println(container.ID)
	}

	// Extract logs from the first container (for demonstration purposes)
	if len(containers) > 0 {
		containerID := containers[0].ID
		logs, err := cli.ContainerLogs(context.Background(), containerID, types.ContainerLogsOptions{ShowStdout: true, ShowStderr: true})
		if err != nil {
			log.Fatal(err)
		}
		defer logs.Close()

		fmt.Println("\nContainer Logs:")
		io.Copy(os.Stdout, logs)
	}
}
