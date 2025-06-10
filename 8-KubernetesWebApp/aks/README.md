# Azure AKS Cluster Provisioning

This directory contains the Terraform configuration to provision an Azure Kubernetes Service (AKS) cluster, including its virtual network, subnets, and identity components. This setup enables the deployment and management of containerized applications within Azure's cloud environment.

## 🧰 Prerequisites

To successfully deploy the AKS cluster using the configurations in this folder, ensure you have the following:

* **Azure Account:** An active Azure subscription (an Azure sandbox environment is sufficient for testing).
* **Azure CLI:** Installed and configured on your local machine. Ensure you are logged in to your Azure account (`az login`).
* **kubectl:** The Kubernetes command-line tool installed, used for interacting with the cluster once provisioned.
* **Terraform:** Installed and configured. This version is built with Terraform v1.0.0 or higher.

*(For general project prerequisites and setup instructions, refer to the [main README.md](../README.md) in the repository root.)*

## 📂 Resources (Terraform Configuration Files)

The following Terraform files define the resources for the AKS cluster:

* `aks-cluster.tf`: Contains the main configuration for the Azure Kubernetes Service (AKS) cluster itself.
* `variables.tf`: Defines the input variables that are used to customize the creation of the AKS cluster.
* `terraform.tfvars`: This file will hold specific values for your variables, including sensitive information like service principal credentials, which will be called by `variables.tf`.
* `outputs.tf`: Specifies the values that will be output to your terminal after the Terraform deployment is complete, such as connection details.
* `versions.tf`: Sets the required AzureRM provider and the minimum compatible Terraform versions for this configuration.

## 🚀 Deployment Process

Follow these steps to deploy the Azure AKS cluster:

1.  **Navigate to the AKS directory:**

    ```bash
    cd aks/
    ```

2.  **Initialize Terraform:**
    This command downloads the necessary Azure provider plugins.

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
    This will provision the AKS cluster and associated resources in your Azure account. This step can take approximately 10-15 minutes.

    ```bash
    terraform apply
    ```
    You will be prompted to confirm the action by typing `yes`.

## 👩‍💻 Working with kubectl

After successfully deploying the AKS cluster, you'll configure `kubectl` to interact with your new cluster.

1.  **Configure kubectl:**
    Run the following command to set up `kubectl` to connect to your new AKS cluster:

    ```bash
    az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw aks_cluster_name)
    ```
    *Note: The `terraform output -raw` commands assume you have set `resource_group_name` and `aks_cluster_name` as outputs in your `outputs.tf` for easy retrieval.*

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

**Browse the AKS Cluster Dashboard**

You can also open the Azure portal's Kubernetes dashboard view for your cluster directly using the Azure CLI:

```bash
az aks browse --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)

```
## 🧹 Clean Up Resources (Optional)

To avoid incurring ongoing costs, you can remove all the resources provisioned by this Terraform configuration when you are finished.

```bash
terraform destroy
```
You will be prompted to confirm the action by typing `yes`.
