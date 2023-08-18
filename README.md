# Docker and Kubernetes Dotfiles 😎🐳

Hey there, fellow coder! Welcome to the Docker and Kubernetes Dotfiles party 🚀. This repo is your one-stop shop for leveling up your Docker and Kubernetes game. We've got cool configurations, nifty scripts, and magical Kubernetes manifests – all to make your container journey smoother than butter.

## What's Cookin'?

- **.dockerconfig**: This is where the Docker magic happens! 🪄 Tweak those settings, set up secret handshakes (a.k.a. authentication), and get things running just how you like it.
- **.kubeconfig**: Fancy some Kubernetes action? 🎩 This is where you manage contexts, clusters, and summon your K8s powers.
- **.bashrc**: Customization station! ✨ Load up your shell with aliases, shortcuts, and a bit of extra pizzazz for Docker and Kubernetes commands.
- **bin/**: Utilities to the rescue 🦸‍♂️! Find handy scripts here for Docker and Kubernetes tasks that'll save you time and make you look super pro.
- **k8s-manifests/**: Our magical scrolls 📜. Check out these Kubernetes manifests to conjure deployments, services, and more!
- **go-scripts/**: Enchanted scripts in Go ✨. Delve into the world of Go with utilities for Docker, Kubernetes, and more.

## Getting Started 🚀

1. Copy this repo using the `git clone` spell.
2. Sprinkle your personal touch on the dotfiles, scripts, and Go magic.
3. Master the dark arts of Docker with `.dockerconfig` and K8s wizardry with `.kubeconfig`.
4. Wave your wand over the utility scripts in `bin/` and `go-scripts/` to amaze your friends and coworkers.
5. Unleash Kubernetes resources using the `k8s-manifests/` spells.

### Generating Kubernetes Manifests

To generate Kubernetes manifests for your application, follow these steps:

1. **Save the Script**: Save the `generate-k8s-manifests.lua` script from the root of this repository.

2. **Navigate to Script Directory**: Open a terminal and navigate to the directory containing the script:

   ```sh
   cd /path/to/your/repository
3. **Run the Script**: Execute the script using the Lua interpreter:
   ```sh
   lua generate-k8s-manifests.lua

The script will generate Kubernetes YAML manifests for different deployment environments and print them to the console.

4. **Copy and Save YAML**: Copy the generated YAML content for the desired environment(s) and save it as separate files in the k8s-manifests/ directory of this repository.

5. **Apply Manifests**: Use kubectl to apply the generated manifests to your Kubernetes cluster:
    ```sh
    kubectl apply -f k8s-manifests/

Make sure to customize the YAML files as needed before applying them to your cluster.

Feel free to customize the script's parameters and the environments table to match your application's deployment scenarios.

### Contributing Guidelines

If you're open to contributions from the community, consider adding a CONTRIBUTING.md file that outlines guidelines for submitting pull requests, reporting issues, and contributing to the project.

### License

The magic of this repository is licensed under the MIT License. Do your thing with the code, but remember, with great power comes great responsibility! 🦸‍♂️

