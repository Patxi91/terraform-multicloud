# Google GKE Cluster Provisioning

This directory contains the Terraform configuration to provision a Google Kubernetes Engine (GKE) cluster, including its VPC, subnets, and associated networking components. This setup enables the deployment and management of containerized applications within Google Cloud's environment.

## 🧰 Prerequisites

To successfully deploy the GKE cluster using the configurations in this folder, ensure you have the following:

* **Google Cloud account:** Access to a Google Cloud Sandbox environment with sufficient permissions to create infrastructure.
* **Cloud SDK:** Installed and configured with valid credentials (`gcloud auth login`, `gcloud config set project`, etc.).
* **kubectl:** The Kubernetes command-line tool, used to interact with the GKE cluster once provisioned.
* **Terraform:** Installed and configured.

*(For general project prerequisites and setup instructions, refer to the [main README.md](../README.md) in the repository root.)*

## 📂 Resources (Terraform Configuration Files)

The following Terraform files define the resources for the GKE cluster:

* `terraform.tf`: Specifies the required Terraform version and Google Cloud provider version constraints.
* `gke-cluster.tf`: Provisions the Google Kubernetes Engine (GKE) cluster in a separate managed node pool.
* `outputs.tf`: Specifies the output values after successful provisioning, such as the cluster name, region, and project ID.
* `terraform.tfvars`: A template file for defining your project ID and region variables.
* `vpc.tf`: Provisions a Virtual Private Cloud (VPC) and subnets, setting up the network foundation for your GKE cluster.

## 🚀 Deployment Process

Follow these steps to deploy the Google GKE cluster:

1.  **Navigate to the GKE directory:**

    ```bash
    cd gke/
    ```

2.  **Initialize Terraform:**
    This command downloads the necessary Google Cloud provider plugins.

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
    This will provision the GKE cluster and associated resources in your Google Cloud account. This step can take approximately 10-20 minutes.

    ```bash
    terraform apply
    ```
    You will be prompted to confirm the action by typing `yes`.

## 👩‍💻 Working with kubectl

After successfully deploying the GKE cluster, you'll configure `kubectl` to interact with your new cluster.

1.  **Configure kubectl:**
    Run the following command to set up `kubectl` to connect to your new GKE cluster:

    ```bash
    gcloud container clusters get-credentials $(terraform output -raw cluster_name) --region $(terraform output -raw region) --project $(terraform output -raw project_id)
    ```
    *Note: The `terraform output -raw` commands assume you have set `cluster_name`, `region`, and `project_id` as outputs in your `outputs.tf` for easy retrieval.*

2.  **Verify Cluster Connection:**
    Check your cluster information to confirm `kubectl` is properly configured. You should see details about your cluster's control plane:

    ```bash
    kubectl cluster-info
    ```

3.  **Example: Listing all resources in the default namespace:**
    Once connected, you can start interacting with your Kubernetes cluster. You should see output similar to this, indicating that your cluster is operational:

    ```bash
    kubectl get all
    ```

## 🧹 Clean Up Resources (Optional)

To avoid incurring ongoing costs, you can remove all the resources provisioned by this Terraform configuration when you are finished.

```bash
terraform destroy