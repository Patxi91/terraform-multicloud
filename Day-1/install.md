
# Installing Terraform

Terraform is a powerful open-source tool for managing infrastructure as code (IaC). This guide will walk you through the steps to install Terraform on Windows, Linux, and macOS.

---

## Windows

You can install Terraform on Windows using two methods: via direct download or by using GitHub Codespaces.

### 1. Install Terraform from the [Downloads Page](https://www.terraform.io/downloads)

Steps to follow:

1. Download the latest version of Terraform for Windows from the [Terraform Downloads page](https://www.terraform.io/downloads).
2. Extract the `terraform.exe` file to a folder of your choice.
3. Add the folder path to your system's environment variables:
   - Search for "Environment Variables" in the Start menu.
   - Under "System variables," find and select `Path`, then click "Edit."
   - Click "New" and paste the path where you extracted the `terraform.exe` file.
   - Click "OK" to save your changes.
4. Open a new terminal and verify the installation:

   ```bash
   terraform -v
   ```

### 2. Use GitHub Codespaces (Free for 120 hours per month)
If you prefer using a virtual machine, GitHub Codespaces offers a free option with Ubuntu and Visual Studio Code. Here's how to get started:

1. Login to your GitHub account.
2. Click on your profile icon in the top right corner.
3. Select "Your Codespaces" from the dropdown.
4. Create a new Codespace. By default, you'll have a virtual machine with Ubuntu and VS Code preinstalled.
5. Follow the installation instructions for Linux.

---

## Linux

To install Terraform on Linux, follow these steps:

### 1. Install Terraform from the Downloads Page

Steps to follow:

1. Download the latest version for Linux from the [Terraform Downloads page](https://www.terraform.io/downloads).

2. Extract the .zip file using the following command:

   ```bash
   unzip terraform_<version>_linux_amd64.zip
   ```

3. Move the terraform binary to `/usr/local/bin` so that it is accessible system-wide:

   ```bash
   sudo mv terraform /usr/local/bin/
   ```

4. Verify the installation:

   ```bash
   terraform -v
   ```

You should see the installed version of Terraform. Now you're ready to use Terraform on Linux.


## macOS

To install Terraform on macOS, you can either download it manually or install it using Homebrew.

### 1. Install Terraform from the Downloads Page

Steps to follow:

1. Download the latest version for macOS from the [Terraform Downloads page](https://www.terraform.io/downloads).
2. Extract the .zip file.
3. Move the terraform binary to `/usr/local/bin`:

   ```bash
   sudo mv terraform /usr/local/bin/
   ```

4. Verify the installation:

   ```bash
   terraform -v
   ```

### 2. Install Terraform using Homebrew

If you have Homebrew installed, you can install Terraform easily with the following steps:

1. Install Homebrew if you haven't already:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install Terraform:

   ```bash
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```

3. Verify the installation:

   ```bash
   terraform -v
   ```

