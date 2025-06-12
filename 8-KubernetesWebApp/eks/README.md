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
