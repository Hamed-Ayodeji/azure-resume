# Azure Resume Project: Terraform Documentation

## Overview

This directory contains the Infrastructure as Code (IaC) for the Azure Resume Project, written in HashiCorp's Terraform. The IaC provisions the necessary Azure resources for the project, including a Cosmos DB account, a database, and a container.

## Prerequisites

Before you begin, ensure you have installed the following:

- [Terraform](https://www.terraform.io/downloads.html): Used to automate the creation and management of your Azure resources.
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli): Used to interact with Azure services from the command line.

## Usage

Follow these steps to deploy your Azure resources:

1. **Clone the repository**: Use `git clone` to copy the project to your local machine.

2. **Navigate to the terraform directory**: Use `cd` to move into the directory containing the Terraform files.

3. **Configure your variables**: Open the `terraform.tfvars` file and replace the placeholders with your actual values. These variables include settings like your Azure location and resource group name.

4. **Initialize Terraform**: Run `terraform init` in your terminal. This command downloads the necessary provider plugins.

5. **Review the execution plan**: Run `terraform plan`. This command shows you what changes Terraform will make to your infrastructure.

6. **Apply the changes**: Run `terraform apply`. This command creates the Azure resources. You'll need to confirm the action by typing `yes`.

7. **Destroy the resources**: When you no longer need the resources, you can remove them by running `terraform destroy`. This command deletes all resources that Terraform has managed. You'll need to confirm the action by typing `yes`.

Remember to replace any placeholder values in the `terraform.tfvars` file with your actual values before running `terraform apply`. This ensures that your Azure resources are provisioned correctly.

## After Deployment

After Terraform has created your Azure resources, you can go to the Azure portal and add a new item to your Cosmos DB database container. This item is to monitor the visitor count on the resume website.

1. **Navigate to the Azure portal**: Go to the [Azure portal](https://portal.azure.com/).
2. **Find your Cosmos DB account**: Search for your Cosmos DB account in the search bar.
3. **Open the Data Explorer**: Click on the `Data Explorer` tab in the left-hand menu.
4. **Select your database and container**: Click on the database and container that Terraform created.
5. **Add a new item**: Click on the `Items` tab and then click `New Item`.
6. **Enter the item details**: Enter the following JSON object into the text box:

    ```JSON
    {
      "id": "1",
      "count": 0
    }
    ```

    This JSON object represents the initial visitor count of 0. You can update the `count` value as visitors view your resume.

7. **Save the item**: Click `Save` to add the item to your container.
