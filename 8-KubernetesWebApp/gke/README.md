# Google GKE Cluster Provisioning

This directory contains the Terraform configuration to provision a Google Kubernetes Engine (GKE) cluster, including its VPC, subnets, and associated networking components. This setup enables the deployment and management of containerized applications within Google Cloud's environment.

## 🧰 Prerequisites

To successfully deploy the GKE cluster using the configurations in this folder, ensure you have the following:

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
* `terraform.tfvars`: A template file for defining your project ID and region variables.
* `vpc.tf`: Provisions a Virtual Private Cloud (VPC) and subnets, setting up the network foundation for your GKE cluster.

## 🚀 Deployment Process

Follow these steps to deploy the Google GKE cluster:

1.  **Configure Project ID and Region:**
    Before initializing Terraform, you need to provide your Google Cloud Project ID and confirm the region in the `terraform.tfvars` file.

    * Open the `terraform.tfvars` file located in this directory.
    * Retrieve your current Google Cloud Project ID by running the following command in your terminal:

        ```bash
        gcloud config get-value project
        ```
    * Replace `<PROJECT_ID>` in `terraform.tfvars` with the actual Project ID you obtained from the command above. The `region` should already be set to `europe-north1` (Stockholm).

        ```terraform
        # terraform.tfvars content example:
        project_id = "your-actual-project-id" # Replace with the output of gcloud command
        region     = "europe-north1"          # Stockholm region
        ```

2.  **Enable Required APIs:**
    Before you can create a GKE cluster, you need to enable the Compute Engine and Kubernetes Engine APIs. Run the following commands:

    ```bash
    gcloud services enable compute.googleapis.com
    gcloud services enable container.googleapis.com
    ```

3.  **Navigate to the GKE directory:**

    ```bash
    cd gke/
    ```

4.  **Initialize Terraform:**
    This command downloads the necessary Google Cloud provider plugins.

    ```bash
    terraform init
    ```

5.  **Validate the Configuration (Optional but Recommended):**
    Checks the syntax and configuration for errors.

    ```bash
    terraform validate
    ```

6.  **Review the Deployment Plan:**
    This command shows you what resources Terraform will create, modify, or destroy.

    ```bash
    terraform plan
    ```

7.  **Apply the Configuration:**
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
    gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
    ```

    *Note: The `terraform output -raw` commands assume you have set `kubernetes_cluster_name` and `region` as outputs in your `outputs.tf` for easy retrieval. If your cluster output is named `cluster_name` instead of `kubernetes_cluster_name`, please adjust the command accordingly.*

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

### Deploying and Accessing the Kubernetes Dashboard

To deploy and access the Kubernetes Dashboard, follow these steps:

1.  **Create Dashboard Admin Service Account:**
    To enable administrative access to the dashboard, apply a YAML manifest that creates a service account and binds it to the `cluster-admin` role. Ensure you have the `kubernetes-dashboard-admin.rbac.yaml` file.

    ```bash
    kubectl apply -f kubernetes-dashboard-admin.rbac.yaml
    ```

2.  **Get Authentication Token:**
    After creating the admin service account, retrieve its bearer token. You will use this token to log in to the Kubernetes Dashboard.

    ```bash
    kubectl -n kubernetes-dashboard create token admin-user
    ```
    Copy the generated token. You will paste this token into the dashboard login screen.

3.  **Deploy the Dashboard:**
    Next, apply the Kubernetes Dashboard YAML manifest to your cluster. Make sure you have the `kubernetes-dashboard.yaml` file available in your current directory or provide its correct path.

    ```bash
    kubectl apply -f kubernetes-dashboard.yaml
    ```

4.  **Start the kubectl Proxy:**
    Run the `kubectl proxy` command in your terminal. This will create a secure proxy to your Kubernetes API server. Keep this command running in the background or in a separate terminal window.

    ```bash
    kubectl proxy
    ```

5.  **Access the Dashboard:**
    Once the proxy is running, you can access the Kubernetes Dashboard in your web browser using the following address:

    **[http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)**

    When prompted by the Kubernetes Dashboard, paste the authentication token you obtained in step 2 to gain access to your cluster's dashboard.

## 🧹 Clean Up Resources (Optional)

To avoid incurring ongoing costs, you can remove all the resources provisioned by this Terraform configuration when you are finished.

```bash
terraform destroy
```
