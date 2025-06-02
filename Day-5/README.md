# 📝 Terraform Deployment Comments – Flask on AWS EC2

This file contains annotated explanations of the Terraform resources used to deploy a simple Flask app on AWS.

---

## ✅ Provider and Variables

- **AWS Provider**: Configures Terraform to use AWS, specifying the region (`eu-north-1`).
- **Variable `cidr`**: Declares the CIDR block for the custom VPC (`10.0.0.0/16`).

---

## 🔑 Key Pair

- **`aws_key_pair`**: Uploads your local SSH public key so you can securely SSH into the EC2 instance.
- Ensure `~/.ssh/id_rsa.pub` exists. Generate with `ssh-keygen` if needed.

---

## 🌐 VPC and Networking

- **VPC (`aws_vpc`)**: Creates a private network for AWS resources.
- **Subnet**: Public subnet inside the VPC, allows assigning public IPs.
- **Internet Gateway**: Enables internet connectivity for instances in the subnet.
- **Route Table**: Defines how traffic flows out via the internet gateway.
- **Route Table Association**: Binds the route table to the subnet.

---

## 🔒 Security Group

- **Inbound Rules**:
  - Allow HTTP (port 80) from anywhere for web traffic.
  - Allow SSH (port 22) for remote access.
- **Outbound Rule**: Allow all outbound traffic (default behavior).
- **Tag**: Named for easier identification in AWS Console.

---

## 💻 EC2 Instance

- **AMI**: Ubuntu-based image (`ami-0c1ac8a41498c1a9c`).
- **Instance Type**: `t3.micro`, free tier eligible.
- **Key Name**: Uses the uploaded SSH key.
- **Security Group**: Attaches the group allowing HTTP and SSH.
- **Connection Block**: Allows Terraform to SSH for provisioning.

---

## 🚀 App Deployment (null_resource)

- **Trigger**: Redeploys if `app.py` changes (via file hash).
- **Connection**: Uses SSH to connect to the EC2 instance.
- **File Provisioner**: Copies `app.py` to the instance.
- **Remote Exec Provisioner**:
  - Updates package list.
  - Installs `python3-venv`.
  - Creates a virtual environment (`app_venv`).
  - Installs Flask via `pip`.
  - Kills any existing app instance.
  - Starts `app.py` in the background using `setsid`.

---

## 🐍 Flask App (`app.py`)

- Basic Flask app that returns `"Hello, Meme!"` on root path.
- Runs on `0.0.0.0:80` so it's accessible from any IP.

---

## 🌍 Access Your App

Visit [http://16.171.113.48/](http://16.171.113.48/) to view the running Flask application.

![Running Flask App](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMDU3aGtsOHg4cDMxNzN5Yzh4cHc5NmcycjU2Y2RpZGloN2ZyMm51YyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/2snL26Wsqbiec/giphy.gif)
