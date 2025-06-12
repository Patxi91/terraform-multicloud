# AWS EKS Cluster Provisioning

This directory contains the Terraform configuration to provision an Amazon Elastic Kubernetes Service (EKS) cluster, including its VPC, subnets, and associated IAM components. This setup enables the deployment and management of containerized applications within AWS's cloud environment.

## 🧰 Prerequisites

To successfully deploy the EKS cluster using the configurations in this folder, ensure you have the following:

* **AWS Account:** Access to an AWS sandbox environment with sufficient permissions to create infrastructure.
* **AWS CLI:** Installed and configured with valid credentials (`aws configure`).
* **kubectl:** The Kubernetes command-line tool, used to interact with the EKS cluster once provisioned.
* **Terraform:** Installed and configured. This configuration requires Terraform v1.0.0 or higher.

*(For general project prerequisites and setup instructions, refer to the [main README.md](../README.md) in the repository root.)*

## 📂 Resources (Terraform Configuration Files)

The following Terraform files define the resources for the EKS cluster:

* `main.tf`: Configures the AWS provider.
* `terraform.tf`: Specifies the required Terraform version and AWS provider version constraints.
* `variables.tf`: Contains the `region` variable and other input parameters that determine where the EKS cluster is created.
* `vpc.tf`: Provisions a Virtual Private Cloud (VPC) using the official AWS VPC module, including public and private subnets across multiple availability zones.
* `eks-cluster.tf`: Defines the Amazon EKS cluster and supporting infrastructure, including managed node groups, security groups, IAM roles, and autoscaling settings.
* `outputs.tf`: Specifies the output values after successful provisioning, such as the cluster name and kubeconfig data.

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

1.  **Configure kubectl:**
    Run the following command to set up `kubectl` to connect to your new EKS cluster:

    ```bash
    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name) --no-verify-ssl
    ```
    *Note: The `terraform output -raw` commands assume you have set `region` and `cluster_name` as outputs in your `outputs.tf` for easy retrieval.*

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
```
