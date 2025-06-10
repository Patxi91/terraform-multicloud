# Deploying and Managing a Web Application in Kubernetes with Terraform

This repo contains code and modules to deploy a web application in Kubernetes using Terraform—covering AWS EKS, GKE, and AKS.

## 🎯 Overview


1. Provision a Kubernetes cluster in AWS, GCP, or Azure using Terraform.
2. Use Terraform’s Kubernetes provider to deploy resources like namespaces, deployments, and services.
3. Deploy a web application (a sample “Pac‑Man” html app), with a node.js front-end and a MongoDB backend, into Kubernetes via Terraform.
4. Scale the app up/down and observe live updates managed through Terraform.
5. Best practices for infrastructure-as-code in a cloud-native environment.

## 🧰 Prerequisites

- Familiarity with Kubernetes concepts (Pods, Deployments, Services)
- Basic Terraform skills
- Access to one of the cloud providers (AWS/GCP/Azure)

## 📂 Repository Layout

```
.
├── aks/           # Terraform files for Azure AKS
├── eks/           # Terraform files for AWS EKS
├── gke/           # Terraform files for GCP GKE
├── pac-man/       # Terraform modules to deploy the Pac‑Man web app
├── eks.zip        # zipped EKS configuration
└── pac-man.zip    # zipped Pac‑Man app config
```

## 🚀 Step-by-Step Guide

### 1. Install Prerequisites: Package Managers

To ensure you have the necessary tools installed, begin by installing a package manager relevant to your operating system.

**Install Homebrew on macOS or Linux:**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Install Chocolatey on Windows:**

Note: With PowerShell, you must ensure Get-ExecutionPolicy is not Restricted. Use Bypass or AllSigned instead.

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = 
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### 2. Install Prerequisites: AKS

**Install Azure CLI & Kubectl on macOS or Linux:**

```bash
brew install azure-cli
brew install kubernetes-cli
az login
```

**Install Azure CLI & Kubectl on Windows:**

```bash
choco install azure-cli
choco install kubernetes-cli
az login
```

### 3. Install Prerequisites: EKS

**Install AWS CLI & Kubectl on macOS or Linux:**

```bash
brew install aws-cli
brew install kubernetes-cli
aws configure
```

**Install AWS CLI & Kubectl on Windows:**

```bash
choco install aws-cli
choco install kubernetes-cli
aws configure
```

### 4. Install Prerequisites: GKE

**Install Google Cloud SDK, Kubectl and ADC on macOS or Linux:**

```bash
brew install --cask google-cloud-sdk
brew install kubernetes-cli
gcloud init
gcloud auth application-default login
```

**Install Google Cloud SDK, Kubectl and ADC on Windows:**

```bash
choco install gcloudsdk
choco install kubernetes-cli
gcloud init
gcloud auth application-default login
```
