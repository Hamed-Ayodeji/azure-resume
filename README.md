# Azure Resume Project

## Overview

Welcome to the Azure Resume Project, a digital platform that encapsulates my professional journey. This project, part of my learning path with A Cloud Guru (ACG), is a testament to my skills and experiences in the tech industry.

The resume is organized into several sections, each highlighting a different facet of my professional profile:

- **About**: A brief introduction about me and my professional journey.
- **Experience**: A detailed overview of my work history and roles.
- **Education**: Information about my academic background and qualifications.
- **Skills**: A display of my technical and soft skills.
- **Projects**: Links to projects I've completed or contributed to, demonstrating my practical skills.
- **Contact**: Details on how to reach me for professional inquiries.

The web application, hosted on Microsoft Azure, demonstrates my proficiency in cloud services and deployment. Visit my Azure-hosted resume [here](https://resume.qurtana.com.ng/).

The web application resides in a storage account and is served as a static website. It's built using HTML, CSS, and JavaScript. JavaScript is used to implement a visitor counter stored in a Cosmos DB database. The visitor counter is implemented using Azure Functions, triggered by the web application. Azure Front Door and CDN are used for features like custom domain, SSL, and caching. GitHub Actions automate the deployment process for CI/CD.

## Architecture

(Add a diagram or description of the architecture here)

## Prerequisites

To get started, you'll need:

1. **Azure Account**: An active Azure account to deploy the web application and Azure Functions. Create a free one [here](https://azure.microsoft.com/en-us/free/).
2. **.NET Core SDK**: Install the .NET Core SDK to build and run the Azure Functions locally. Download the SDK [here](https://dotnet.microsoft.com/download).
3. **Azure Functions Core Tools**: Install the Azure Functions Core Tools extension on VScode to run the Azure Functions locally.
4. **Azure CLI**: Install the Azure CLI to deploy the Azure Functions to Azure. Download the CLI [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
5. **Visual Studio Code**: A code editor to write and edit the code. Download Visual Studio Code [here](https://code.visualstudio.com/).
6. **GitHub Account**: A GitHub account to store the source code and automate the deployment process using GitHub Actions. Create an account [here](https://github.com/).
7. **Terraform**: Install Terraform to automate the infrastructure deployment. Download Terraform [here](https://www.terraform.io/downloads.html).
8. **C# Extension**: Install the C# extension on VScode to write and debug the Azure Functions code.

## Deployment

Follow these steps to deploy the project:

### Step 1: Building the front-end

Refer to the front-end documentation [here](./frontend/README.md)

### Step 2: Building the Azure Functions and Cosmos DB

Refer to the Azure Functions documentation [here](./backend/api/README.md)

### Step 3: Deploying the Azure Functions and Front-end to Azure

Refer to the GitHub Actions documentation [here](./backend/api/README.md)

### Step 4: Configuring Azure Front Door and CDN

Refer to the Azure Front Door and CDN documentation [here](./backend/api/README.md)
