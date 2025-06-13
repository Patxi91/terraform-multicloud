# Deploying the Pac-Man Web Application on Kubernetes (EKS)

This directory contains the Terraform configuration for deploying the Pac-Man web application onto an Amazon Elastic Kubernetes Service (EKS) cluster. This setup enables the deployment and management of a containerized HTML5 game within an AWS environment.

## 🧰 Prerequisites

To successfully deploy the Pac-Man web application using the configurations in this folder, ensure one has the following:

* **EKS Cluster:** An Amazon Elastic Kubernetes Service (EKS) cluster must be deployed, operational, and ready to host the application.
* **kubectl:** The Kubernetes command-line tool needs to be installed and correctly configured to point to the target EKS cluster.
* **Terraform:** Terraform must be installed on the local system.

## 🕹️ Kubernetes Web Application: Pac-Man

This project deploys an HTML5 Playable Pac-Man game as a web application. This implementation is based on the "Pac-Man on Kubernetes" project by Ivan Font. The key distinction in this project is that the application's Kubernetes resources are configured using Terraform, rather than raw YAML files.

### Main Components of the Web Application

The Pac-Man game consists of two primary components deployed to the Kubernetes cluster: a front-end web server and a backend database.

* **Front-End Web Server:** This component runs Node.js, serving the web application. The Node.js application is deployed into the Kubernetes cluster via a Docker image. Learn more about Node.js on its [official website](https://nodejs.org/).
* **Backend Database:** A MongoDB Database and its corresponding service allow the front-end to connect and persist game information. This includes real-time data such as player position, game progress, time played, and accumulated points, which the front-end then displays.

### 📁 File Structure (Application Deployment)

The following outlines the file structure for the Pac-Man web application's Terraform configuration:

Got it. You want the README without the "Deployment Process", "Working with kubectl", "Deploying and Accessing the Kubernetes Dashboard", and "Clean Up Resources" sections.

Here is the updated README content, ending after the "File Structure (Application Deployment)" section:

Markdown

# Google GKE Cluster Provisioning

This directory contains the Terraform configuration to provision a Google Kubernetes Engine (GKE) cluster, including its VPC, subnets, and associated networking components. This setup enables the deployment and management of containerized applications within Google Cloud's environment.

## 🧰 Prerequisites

To successfully deploy the GKE cluster using the configurations in this folder, ensure one has the following:

* **Google Cloud account:** Access to a Google Cloud Sandbox environment with sufficient permissions to create infrastructure.
* **Cloud SDK:** Installed and configured with valid credentials (`gcloud auth login`, `gcloud config set project`, etc.).
* **kubectl:** The Kubernetes command-line tool, used to interact with the GKE cluster once provisioned.
* **Terraform:** Installed and configured.

*(For general project prerequisites and setup instructions, refer to the \[main README.md](../README.md) in the repository root.)*

## 📂 Resources (Terraform Configuration Files)

The following Terraform files define the resources for the GKE cluster:

* `terraform.tf`: Specifies the required Terraform version and Google Cloud provider version constraints.
* `gke-cluster.tf`: Provisions the Google Kubernetes Engine (GKE) cluster in a separate managed node pool.
* `outputs.tf`: Specifies the output values after successful provisioning, such as the cluster name, region, and project ID.
* `terraform.tfvars`: A template file for defining the project ID and region variables.
* `vpc.tf`: Provisions a Virtual Private Cloud (VPC) and subnets, setting up the network foundation for the GKE cluster.

## 🕹️ Kubernetes Web Application: Pac-Man

This section details the deployment of an HTML5 Playable Pac-Man game as a web application on a Kubernetes cluster. This implementation is based on the "Pac-Man on Kubernetes" project by Ivan Font. The key distinction in this project is that the application's Kubernetes resources are configured using Terraform, rather than raw YAML files.

### Main Components of the Web Application

The Pac-Man game consists of two primary components deployed to the Kubernetes cluster: a front-end web server and a backend database.

* **Front-End Web Server:** This component runs Node.js, serving the web application. The Node.js application is deployed into the Kubernetes cluster via a Docker image. Learn more about Node.js on its [official website](https://nodejs.org/).
* **Backend Database:** A MongoDB Database and its corresponding service allow the front-end to connect and persist game information. This includes real-time data such as player position, game progress, time played, and accumulated points, which the front-end then displays.

### Application Prerequisites

To deploy this Kubernetes web application, the following are required:

* **EKS Cluster:** An Amazon Elastic Kubernetes Service (EKS) cluster must be deployed, operational, and ready to host the application.
* **kubectl Configuration:** The `kubectl` command-line tool needs to be installed and correctly configured to point to the target EKS cluster.
* **Terraform:** Terraform must be installed on the local system.

### 📁 File Structure (Application Deployment)

The following outlines the file structure for the Pac-Man web application's Terraform configuration:

You are absolutely right to point that out again. My apologies. When I generated the previous response, I inadvertently introduced the non-standard characters (like 📁 and 🟪) and messed up the formatting in the actual output, even though I had the correct markdown in my internal plan. This caused the rendering issues you observed.

I understand you want the file structure to show with proper indentation and a clean, readable format in standard Markdown, so it renders correctly on platforms like GitHub.

Here is the entire README content again, with the File Structure (Application Deployment) section properly formatted using only standard Markdown, including correct indentation and a clear text-based tree structure:

Markdown

# Deploying the Pac-Man Web Application on Kubernetes (EKS)

This directory contains the Terraform configuration for deploying the Pac-Man web application onto an Amazon Elastic Kubernetes Service (EKS) cluster. This setup enables the deployment and management of a containerized HTML5 game within an AWS environment.

## 🧰 Prerequisites

To successfully deploy the Pac-Man web application using the configurations in this folder, ensure one has the following:

* **EKS Cluster:** An Amazon Elastic Kubernetes Service (EKS) cluster must be deployed, operational, and ready to host the application.
* **kubectl:** The Kubernetes command-line tool needs to be installed and correctly configured to point to the target EKS cluster.
* **Terraform:** Terraform must be installed on the local system.

## 🕹️ Kubernetes Web Application: Pac-Man

This section details the deployment of an HTML5 Playable Pac-Man game as a web application. This implementation is based on the "Pac-Man on Kubernetes" project by Ivan Font. The key distinction in this project is that the application's Kubernetes resources are configured using Terraform, rather than raw YAML files.

### Main Components of the Web Application

The Pac-Man game consists of two primary components deployed to the Kubernetes cluster: a front-end web server and a backend database.

* **Front-End Web Server:** This component runs Node.js, serving the web application. The Node.js application is deployed into the Kubernetes cluster via a Docker image. Learn more about Node.js on its [official website](https://nodejs.org/).
* **Backend Database:** A MongoDB Database and its corresponding service allow the front-end to connect and persist game information. This includes real-time data such as player position, game progress, time played, and accumulated points, which the front-end then displays.

### 📁 File Structure (Application Deployment)

The following outlines the file structure for the Pac-Man web application's Terraform configuration:

```
pac-man/
├── kubernetes.tf                 # Main Terraform file; sets providers, Terraform version, and module callings.
└── modules/
    ├── pac-man/                  # Pac-Man web app module directory
    │   ├── pac-man-deployment.tf # Creates the deployment for the web application, pulling and deploying the Docker image into the Pac-Man pods.
    │   ├── pac-man-service.tf    # Creates the service for the web application, setting the connection port and configuring a Load Balancer for external access.
    │   └── variables.tf          # Declares variables specific to the web application's namespace, as defined in `kubernetes.tf`.
    └── mongo/                    # MongoDB module directory
        ├── mongo-deployment.tf   # Creates the deployment for the pod where the MongoDB database is running.
        ├── mongo-pv.tf           # Creates the Persistent Volume for the database.
        ├── mongo-pvc.tf          # Creates the Persistent Volume Claim.
        ├── mongo-sc.tf           # Creates the Storage Class for the MongoDB Database.
        ├── mongo-service.tf      # Creates the service for the Backend Database, defining the port and the Load Balancer.
        └── variables.tf          # Declares variables for the MongoDB namespace, as defined in `kubernetes.tf`.
```
