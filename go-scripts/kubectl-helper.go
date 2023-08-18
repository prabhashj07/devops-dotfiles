package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/client-go/util/homedir"
	"k8s.io/client-go/util/wait"
	"k8s.io/kubectl/pkg/util/term"
)

func main() {
	// Load kubeconfig
	home := homedir.HomeDir()
	kubeconfig := filepath.Join(home, ".kube", "config")
	config, err := clientcmd.BuildConfigFromFlags("", kubeconfig)
	if err != nil {
		log.Fatal(err)
	}

	// Create Kubernetes clientset
	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		log.Fatal(err)
	}

	// List pods and describe each one
	pods, err := clientset.CoreV1().Pods("default").List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Pods in default namespace:")
	for _, pod := range pods.Items {
		fmt.Println(pod.Name)
		describePod(clientset, pod.Name)
	}
}

func describePod(clientset *kubernetes.Clientset, podName string) {
	termWidth, _, err := term.GetSize(int(os.Stdout.Fd()))
	if err != nil {
		log.Fatal(err)
	}

	pager := &term.StdioPager{}
	pagerPage := pager.NewPage()
	pagerPage.OutFD = os.Stdout.Fd()
	pagerPage.Width = termWidth

	wait.PollImmediate(1, 15*time.Second, func() (bool, error) {
		err := term.PagerIntoPagerFnWithCleanup(clientset, os.Stdin, pagerPage, podName, "", "")
		return true, err
	})
}
