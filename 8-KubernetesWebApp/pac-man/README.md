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

## 🚀 Deployment Process

Follow these steps to deploy the AWS EKS cluster:

1.  **Navigate to the EKS directory:**

    ```bash
    cd eks/
    ```

2.  **Initialize Terraform:**
    This command downloads the necessary AWS provider plugins.

    ```bash
    terraform init
    ```

3.  **Validate the Configuration (Optional but Recommended):**
    Checks the syntax and configuration for errors.

    ```bash
    terraform validate
    ```

4.  **Review the Deployment Plan:**
    This command shows you what resources Terraform will create, modify, or destroy.

    ```bash
    terraform plan
    ```

5.  **Apply the Configuration:**
    This will provision the EKS cluster and associated resources in your AWS account. This step can take approximately 10-20 minutes.

    ```bash
    terraform apply
    ```
    You will be prompted to confirm the action by typing `yes`.

## 👩‍💻 Working with kubectl

After successfully deploying the EKS cluster, you'll configure `kubectl` to interact with your new cluster.

1.  **Configure kubectl and point context to EKS cluster:**
    It's important to add the EKS cluster to your `kubectl` context. Run the following command to set up `kubectl` to connect to your new EKS cluster:

    ```bash
    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name) --no-verify-ssl
    ```
    *Note: The `terraform output -raw` commands assume you have set `region` and `cluster_name` as outputs in your `outputs.tf` for easy retrieval.*

    You can verify the context has been added and switched:

    ```bash
    PS C:\Users\oyaga\Documents\repos\terraform-multicloud\8-KubernetesWebApp\eks> aws eks --region eu-north-1 update-kubeconfig --name my-eks-cluster-cvSYdLAu
    Added new context arn:aws:eks:eu-north-1:727133197439:cluster/my-eks-cluster-cvSYdLAu to C:\Users\oyaga\.kube\config
    PS C:\Users\oyaga\Documents\repos\terraform-multicloud\8-KubernetesWebApp\eks> kubectl config current-context
    arn:aws:eks:eu-north-1:727133197439:cluster/my-eks-cluster-cvSYdLAu
    PS C:\Users\oyaga\Documents\repos\terraform-multicloud\8-KubernetesWebApp\eks> kubectl get all
    NAME          TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
    service/kubernetes ClusterIP   172.20.0.1   <none>        443/TCP   9m53s
    ```

2.  **Deploy the Pac-Man Application:**
    Now that your EKS cluster is up and running and `kubectl` is configured, navigate to the `pac-man` application directory and deploy the application using Terraform.

    ```bash
    cd ../pac-man/
    ```

    Perform the standard Terraform workflow:

    ```bash
    terraform init
    terraform validate
    terraform plan
    terraform apply
    ```
    You will be prompted to confirm the action by typing `yes`.

3.  **Verify Pac-Man Application Deployment:**
    After successful deployment, you can verify that the Pac-Man web application components are running on your EKS cluster. Navigate back to your `pac-man` directory and use `kubectl`:

    ```bash
    PS C:\Users\oyaga\Documents\repos\terraform-multicloud\8-KubernetesWebApp\pac-man> kubectl -n pac-man get all
    NAME                            READY   STATUS    RESTARTS   AGE
    pod/mongo-5b4dd67f59-wmmsq      1/1     Running   0          91s
    pod/pac-man-f7ffcd9dc-xr5z5     1/1     Running   0          75s

    NAME              TYPE           CLUSTER-IP      EXTERNAL-IP                                          PORT(S)           AGE
    service/mongo     LoadBalancer   172.20.51.29    abc2448bb8fc44e738c43af6b9eb1f51-1729430022.eu-north-1.elb.amazonaws.com 27017:30475/TCP   91s
    service/pac-man   LoadBalancer   172.20.56.56    aa18df06353c142c1bb13b2fe4a87c3c-1032585963.eu-north-1.elb.amazonaws.com 80:31764/TCP      75s

    NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/mongo       1/1     1            1           91s
    deployment.apps/pac-man     1/1     1            1           75s

    NAME                                   DESIRED   CURRENT   READY   AGE
    replicaset.apps/mongo-5b4dd67f59       1         1         1       91s
    replicaset.apps/pac-man-f7ffcd9dc      1         1         1       75s
    ```
    This output confirms that the Pac-Man web application and its MongoDB backend have been deployed, showing the two pods, their respective services (MongoDB and Pac-Man), and the associated deployments and replica sets.

4.  **Access the Pac-Man Application:**
    To access your deployed Pac-Man application, take the `EXTERNAL-IP` from the `pac-man` service (e.g., `aa18df06353c142c1bb13b2fe4a87c3c-1032585963.eu-north-1.elb.amazonaws.com`) and paste it into your web browser. You should now be able to play Pac-Man!

## 📈 Scaling the Pac-Man Application

To support increased load or ensure higher availability for the Pac-Man application, you can easily scale the number of running pods for both the front-end and backend components.

1.  **Check Current Pod Status:**
    First, verify the current number of running pods for your application:

    ```bash
    kubectl -n pac-man get all
    ```
    You will observe that currently, there is typically 1 pod configured for both the MongoDB backend and the Pac-Man front-end, similar to:

    ```
    pod/mongo-5b4dd67f59-wmmsq      1/1
    pod/pac-man-f7ffcd9dc-xr5z5     1/1
    ```

2.  **Modify Deployment Replicas:**
    To scale the application, you need to modify the `replicas` count in the respective Terraform deployment files within the `pac-man` module:

    * **Front-end (`modules/pac-man/pac-man-deployment.tf`):**
        To scale the front-end to 3 pods, change the `replicas` value:

        ```terraform
        resource "kubernetes_deployment" "pac-man" {
          metadata {
            name      = "pac-man"
            namespace = var.kubernetes_namespace

            labels = {
              name = "pac-man"
            }
          }

          spec {
            replicas = 3 # Scaled to 3
            # ... rest of the spec ...
          }
        }
        ```

    * **Backend (`modules/mongo/mongo-deployment.tf`):**
        To scale the backend to 2 pods, change the `replicas` value:

        ```terraform
        resource "kubernetes_deployment" "mongo" {
          metadata {
            name      = "mongo"
            namespace = var.kubernetes_namespace

            labels = {
              name = "mongo"
            }
          }

          spec {
            replicas = 2 # Scaled to 2
            # ... rest of the spec ...
          }
        }
        ```

3.  **Apply Changes:**
    After modifying the `replicas` counts, apply the changes using Terraform from the `pac-man` directory:

    ```bash
    terraform apply
    ```
    You will be prompted to confirm the action by typing `yes`.

4.  **Verify Scaled Pods:**
    Double-check the changes by listing all resources again:

    ```bash
    kubectl -n pac-man get all
    ```
    You should now see the increased number of pods for both the MongoDB and Pac-Man deployments:

    ```
    NAME                                  READY   STATUS    RESTARTS   AGE
    pod/mongo-695f6597f4-9dlqm            1/1     Running   0          31m
    pod/mongo-695f6597f4-bv5ds            1/1     Running   0          77s
    pod/pac-man-57955c9b46-6g8pr          1/1     Running   0          61s
    pod/pac-man-57955c9b46-c6wlf          1/1     Running   0          30m
    pod/pac-man-57955c9b46-nj7xq          1/1     Running   0          61s
    # ... (other service, deployment, replicaset output)
    ```

To scale down, you can simply revert the `replicas` values in the deployment files to their original counts (e.g., `1` for both), and then run `terraform apply` again.

## 🧹 Clean Up Resources (Optional)

To avoid incurring ongoing costs, you can remove all the resources provisioned by this Terraform configuration when you are finished. Ensure you are in the correct directory for each `terraform destroy` command (first `pac-man`, then `eks` or parent).

1.  **Destroy Pac-Man application resources:**

    ```bash
    cd pac-man/ # Ensure you are in the pac-man directory
    terraform destroy
    ```

2.  **Destroy EKS cluster resources:**

    ```bash
    cd ../eks/ # Navigate back to the eks directory
    terraform destroy
    ```
