# .bash_aliases

# Docker aliases
alias d="docker"
alias dc="docker-compose"
alias di="docker images"
alias dps="docker ps"
alias dlogs="docker logs"
alias dexec="docker exec -it"
alias dstop="docker stop"
alias drm="docker rm"
alias drmi="docker rmi"

# Kubernetes aliases
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kdp="kubectl describe pods"
alias kds="kubectl describe services"
alias kctx="kubectl config use-context"
alias kns="kubectl config set-context --current --namespace"
alias k=kubectl
alias kdp='kubectl describe pod'
alias ksvc='kubectl get svc'

# Other aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."

# Custom functions
docker-clean() {
    docker system prune -af --volumes
}

k8s-apply-all() {
    for file in k8s-manifests/*.yaml; do
        kubectl apply -f "$file"
    done
}
