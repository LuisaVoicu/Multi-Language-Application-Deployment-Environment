# Task Description
- Setup K8s Cluster with RBAC enabled.
- Deploy Services:
  - Service A: WebServer written in C#, Go, or Python, exposing:
    - Current value of Bitcoin in USD (updated every 10 seconds from an API).
    - Average value over the last 10 minutes.
  - Service B: REST API service, responding with a 200 status code on GET requests.
- Deploy NGINX Ingress Controller with corresponding ingress rules for Service A and Service B.

## General Guidelines
- The cluster buildout should be secure, repeatable, and automated.
- Share the source code and related artifacts in a BitBucket repo with a detailed "How-To" guide.

## Deployment
## Infrastructure as Code: Terraform
- Resources:
  - Azure Kubernetes Service (AKS)
  - Azure Container Registry (ACR)
  - Role Assignment

## Deployment Steps
1. Connect to ACR:
   - az acr login --name
   - TOKEN=$(az acr login --name $ACR_NAME --expose-token --output tsv --query accessToken)
   - sudo docker login $ACR_NAME.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password-stdin <<< $TOKEN
2. Deploy:
   - terraform plan -out main.tfplan
   - terraform apply main.tfplan

## Services
- Web Server:
  - Code: Python
  - Dockerfile
  - Deployment & Service (ClusterIP)
- RestapiService:
  - Code: Python
  - Dockerfile
  - Deployment & Service (ClusterIP)

## Dockerfile
- sudo docker build --tag <NAME>:<VERSION> $ACR_NAME.azurecr.io/IMAGE:VERSION
- sudo docker tag IMAGE:VERSION $ACR_NAME.azurecr.io/IMAGE:VERSION

## Upload Image to ACR
- Test Image: sudo docker run -d <NAME>:<VERSION>
- Tag Image: sudo docker tag IMAGE:VERSION $ACR_NAME.azurecr.io/IMAGE:VERSION
- Push Image to ACR: sudo docker push $ACR_NAME.azurecr.io/IMAGE:VERSION

## Pull Images to AKS with kubectl
- kubectl apply => for deployment and services

## Nginx Ingress Controller
- An Ingress controller is a specialized load balancer for Kubernetes.
- It abstracts away the complexity of Kubernetes application traffic routing.
- Deployment and service (ClusterIP) must be in the same namespace with the ingress controller.
- Ingress rules specify routing paths and ports.
- [Resource](https://ammarsuhail155.medium.com/ingress-controller-nginx-deployment-on-azure-kubernetes-services-29ca0a668083)


## Network Policies
- Used to secure traffic between pods.
- Important: Pods must have corresponding labels specified in the configurations.

### Steps
- [Deny all traffic](https://github.com/ahmetb/kubernetes-network-policy-recipes/blob/master/01-deny-all-traffic-to-an-application.md)
- [Allow ingress traffic to RestApi service.](https://github.com/ahmetb/kubernetes-network-policy-recipes/blob/master/02-limit-traffic-to-an-application.md)
- Allow ingress traffic to a specific port and all egress traffic : WebServer Network Policy
  

### More Resources
- [Documentation: Network Policies | Kubernetes](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Examples: kubernetes-network-policy-recipes | GitHub](https://github.com/ahmetb/kubernetes-network-policy-recipes)
- [Tutorial: Secure pod traffic with network policies - Azure Kubernetes Service | Microsoft Learn](https://learn.microsoft.com/en-us/azure/aks/use-network-policies)