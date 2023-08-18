-- generate-k8s-manifests.lua

local function generateDeployment(name, image, port, replicas)
    local yaml = [[
apiVersion: apps/v1
kind: Deployment
metadata:
  name: %s
spec:
  replicas: %d
  selector:
    matchLabels:
      app: %s
  template:
    metadata:
      labels:
        app: %s
    spec:
      containers:
        - name: %s
          image: %s
          ports:
            - containerPort: %d
]]
    return string.format(yaml, name, replicas, name, name, name, image, port)
end

local function generateService(name, port, targetPort)
    local yaml = [[
apiVersion: v1
kind: Service
metadata:
  name: %s
spec:
  selector:
    app: %s
  ports:
    - protocol: TCP
      port: %d
      targetPort: %d
]]
    return string.format(yaml, name, name, port, targetPort)
end

-- Advanced: Generate a deployment and service for multiple environments
local environments = {
    {
        name = "production",
        image = "myregistry.example.com/my-web-app:prod",
        port = 80,
        replicas = 3,
        targetPort = 8080,
    },
    {
        name = "staging",
        image = "myregistry.example.com/my-web-app:stage",
        port = 8081,
        replicas = 2,
        targetPort = 8080,
    },
}

-- Generate and print YAML for each environment
for _, env in ipairs(environments) do
    local deploymentYAML = generateDeployment(env.name, env.image, env.port, env.replicas)
    local serviceYAML = generateService(env.name, env.port, env.targetPort)

    print("###", env.name, "###")
    print(deploymentYAML)
    print(serviceYAML)
    print()
end
