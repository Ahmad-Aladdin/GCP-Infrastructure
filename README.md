
# Google Cloud Infrastructure project

A brief description of what this project does and who it's for


### Project Details:

 - Infrastructure as code using Terraform that builds an environment on the google cloud platform
 - Dockerizing a Simple Python app
 - Deploy the app with Kubernetes 

### Getting Started

- Download The Code

```bash
  git clone git@github.com:Ahmad-Aladdin/GCP-Infrastructure.git
```
- Setup your GCP account, create new project and change the value of "project_name" variable in terraform/default.tfvars with your PROJECT-ID.
- Build the Infrastructure
```bash
  cd Terraform
```
```bash
  terraform init
```
```bash
  terraform apply --var-file finaltask.tfvars
```
Now you can check your GCP account, you can see this resources has been created:
- VPC named "vpc-network".
- 2 Subnets "management-subnet", "restricted-subnet".
- Service Account used by the K8S cluster and the management VM.
- Nat in "management-subnet".
- Private Virtual Machine in "management-subnet" subnet to manage the cluster.
- Private Kubernetes cluster in "restricted-subnet" with 3 worker nodes.

```bash
        # NOTE
        Only VMs in "management-sub" subnet can access the Kubernetes cluster.
```

## Build and push the Python Docker Image to GCR (Google Cloud Registry):
- Build the Python app Docker Image.
```bash
    docker build -t eu.gcr.io/<PROJECT-ID>/my-app:1.0 app/
```
- Setup and configure Docker to Push to GCR.
```bash
    gcloud services enable containerregistry.googleapis.com
```  
```bash
    gcloud auth configure-docker 
``` 
- Push the Image to GCR.
```bash
    docker push eu.gcr.io/<PROJECT-ID>/my-app:1.0
```

## Deploying to Kubernetes
- first, SSH to the management "management-VM"
- Install the Kubectl tool to manage the Kubernetes cluster.
- go to K8S Folder and copy the content of each YML file to the management-VM
- Run 
```bash
    kubectl apply -f <yourfile>.YML
```
That will deploy:
- Config Map for environment variables used by demo app
- Redis Pod and Exopse the pod with ClusterIP service
- Python App Deployment and Exopse it with NodePort service
- Ingress to create HTTP loadbalancer

Now, you can access the Python App by hitting the Ingress IP 