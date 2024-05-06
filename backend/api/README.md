# Azure Resume Project: API Documentation

## Table of Contents

- [Overview](#overview)
- [Pre-requisites](#pre-requisites)
- [Setup](#setup)
  - [Cosmos DB Setup](#cosmos-db-setup)
  - [Azure Function Setup](#azure-function-setup)
  - [Connecting Azure Function to Cosmos DB](#connecting-azure-function-to-cosmos-db)
  - [Connect the Azure Function to the Frontend (Local Development)](#connect-the-azure-function-to-the-frontend-local-development)
  - [Deploy function to Azure (Production)](#deploy-function-to-azure-production)
  - [Deploy the Static Website in an Azure Storage Account](#deploy-the-static-website-in-an-azure-storage-account)
  - [Deploy a Custom Domain for the Azure Resume Project using Azure Front Door and CDN Service](#deploy-a-custom-domain-for-the-azure-resume-project-using-azure-front-door-and-cdn-service)

## Overview

This guide provides step-by-step instructions for setting up the backend of the Azure Resume project. The backend is powered by Azure Functions and Cosmos DB. Azure Functions, a serverless compute service, hosts the backend, while Cosmos DB, a globally distributed, multi-model database service, stores the data.

## Pre-requisites

Ensure you have the following tools installed:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
- [Azure Functions Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=windows%2Ccsharp%2Cbash)
- [.NET Core SDK](https://dotnet.microsoft.com/download)
- [Visual Studio Code](https://code.visualstudio.com/)

## Setup

The project uses an HTTP-triggered Azure Function to process data from the frontend and store it in a Cosmos DB database.

### Cosmos DB Setup

1. Use the Terraform configuration in the [Terraform](../../terraform) folder to create a Cosmos DB account, database, container, and items.
2. For detailed instructions, refer to the [Terraform documentation](../../terraform/README.md).

### Azure Function Setup

1. Install the .NET Core SDK and Azure Functions Core Tools extension in Visual Studio Code.
2. Create a new project in the `backend/api` folder using the Azure Functions extension in Visual Studio Code.
3. Select C# as the project language and .NET 6 (LTS) as the runtime version.
4. Choose the HTTP trigger template and name the function `ResumeVisitCounter`.
5. Use `Company.Function` as the namespace and set the access rights to `Function`.
6. Test the function locally by running `func host start` in the terminal and navigating to `http://localhost:7071/api/ResumeVisitCounter` in your browser.
7. Stop the function by pressing `Ctrl + C` in the terminal.

### Connecting Azure Function to Cosmos DB

1. Install the Azure Cosmos DB extension using the command `dotnet add package Microsoft.Azure.WebJobs.Extensions.CosmosDB --version 3.0.10`.
2. Update the `local.settings.json` file with your Cosmos DB connection string.
3. Create a `Counter` class in the `api` folder.
4. Modify the `ResumeVisitCounter.cs` file to increment the `Counter` item in the Cosmos DB database each time the function is triggered.
5. Test the function locally by running `func host start` in the terminal and navigating to `http://localhost:7071/api/ResumeVisitCounter` in your browser.

After completing these steps, you'll have an Azure Function connected to a Cosmos DB database. You can now integrate this function with the Azure Resume project frontend to store frontend data in the database.

### Connect the Azure Function to the Frontend (Local Development)

1. Update the `local.settings.json` file with the following CORS settings:

    ```json
    {
      "IsEncrypted": false,
      "Values": {
        "AzureWebJobsStorage": "",
        "FUNCTIONS_WORKER_RUNTIME": "dotnet",
        "CosmosDBConnection": "<your-cosmos-db-connection-string>"
      },
      "Host": {
        "CORS": "*"
      }
    }
    ```

2. Update the `apiUrl` in the [main.js](../../frontend/main.js) file in the [frontend](../../frontend) folder to point to your Azure Function URL.

**Note:** This setup is for local development. For production, deploy the Azure Function to Azure and update the `apiUrl` in the frontend to point to the Azure Function URL.

### Deploy function to Azure (Production)

1. Open the Azure Functions extension in Visual Studio Code.
2. Right-click on the function project in the workspace pane and select `Create Function App in Azure ... (Advanced)`.
3. Provide a globally unique name for the Function App.
4. Select the runtime stack as `.NET 6 (LTS)` or the version you used for the function project.
5. Choose `Linux` as the OS for the Function App.
6. Select a resource group for the Function App.
7. Choose `Consumption (Serverless)` as the hosting plan for the Function App.
8. Select a storage account for the Function App.
9. Select an Application Insights instance for the Function App.
10. Click `Create` to deploy the function to Azure.
11. Once the deployment is complete, right-click on the function app in the workspace pane and select `Deploy to Function App ...`.
12. Select the subscription, resource group, and function app you created earlier.
13. Click `Deploy` to deploy the function to Azure.

After deploying the function to Azure, you can access the function URL and integrate it with the frontend to store data in the Cosmos DB database. To do this:

1. Go to the Azure portal and search for the function app you created.
2. Click on the function app and go to the `Configuration` section.
3. Copy the `AzureResumeConnectionString` and its values from the `local.settings.json` file and add them to the function app configuration.
4. Go to the `Functions` section and click on the function you created.
5. Click on the `Get function URL` button to copy the function URL.
6. Update the `apiUrl` in the [main.js](../../frontend/main.js) file in the [frontend](../../frontend) folder to point to the Azure Function URL.
7. Enable CORS for the frontend URL in the CORS settings in the Azure Function.

Now, the frontend will send data to the Azure Function, which will store it in the Cosmos DB database.

## Deploy the Static Website in an Azure Storage Account

To deploy the static website in an Azure Storage Account, follow these steps:

**Note:** The Azure Storage Account extension is required to deploy the static website to Azure. This extension is part of the Azure core tools.

1. left-click on the `frontend` folder in the workspace pane.
2. Click on the `Deploy to Static Website via Azure Storage...`.
3. Create a general-purpose v2 storage account, if you don't have one, or select an existing storage account.
4. Choose a unique name for the storage account.
5. Select a resource group for the storage account.
6. Enter the index document name as `index.html`.
7. Enter the error document path as `404.html`.
8. Click `Deploy` to deploy the static website to the Azure Storage Account.

After deploying the static website to the Azure Storage Account, you can access the website URL and view the frontend of the Azure Resume project. Also paste in the website URl in the CORS settings in the Azure Function.

## Deploy a Custom Domain for the Azure Resume Project using Azure Front Door and CDN Service

Azure Front Door is a global, scalable entry-point that uses the Microsoft global edge network to create fast, secure, and widely scalable web applications. Azure Content Delivery Network (CDN) is a distributed network of servers that can efficiently deliver web content to users.

To deploy a custom domain for the Azure Resume project using Azure Front Door and CDN Service, follow these steps:

### For Azure Front Door

1. Go to the Storage Account and select the correct storage account.
2. Select the `Front Door and CDN` option.
3. Select the Service type of `Azure Front Door`.
4. Select the `Create new Front Door` option.
5. Enter a unique name for the Front Door profile name.
6. Enter a unique name for the Endpoint name.
7. Select the Pricing tier as `Azure Front Door Standard`.
8. Enable Caching and WAF as needed.
9. Click `Create` to create the Front Door profile.
10. Go to the Front Door profile and select the `Domains` option.
11. Click on the `+ Add` button.
12. If you have an `Azure pre-validated domain`, select it as Domain Type. Otherwise, select `Non-Azure validated domain` which i used because i am using a custom domain name from [qservers](https://qservers.ng).

    **Note:** Add a CNAME record to your domain registrar with the value provided in the `Front Door` profile.

13. Select `Azure managed DNS` as DNS manager if you have an Azure pre-validated domain. Otherwise, select `All other DNS services` and enter the DNS zone name.
14. For the HTTPs configuration, select the `AFD managed` option, or `Bring Tour OWn Certificate (BYOC)` and select `TLS 1.2` as minimum TLS version.
15. Click `Add` to add the custom domain to the Front Door profile.
16. Associate the Custom domain name with the Front Door profile endpoint.
17. Add a txt record to your domain registrar with the value provided in the `Front Door` profile to approve the domain validation.
18. Once the domain is validated, add the custom domain to the Azure Function CORS settings.

### For Azure CDN

1. Navigate to your Azure Storage Account and select the desired account.
2. From the left-hand menu, select `Networking > Front Door and CDN`.
3. In the `Service type` dropdown, select `Azure CDN`.
4. Click on `Create new CDN`.
5. Provide a unique name for the `CDN profile name`.
6. Provide a unique name for the `Endpoint name`.
7. In the `Pricing tier` dropdown, select `Standard Microsoft`.
8. Configure caching rules as per your requirements.
9. Click `Create` to initiate the creation of the CDN profile.

    Once the CDN profile is created:

10. Navigate to the CDN profile and select the `Custom Domains` option from the left-hand menu.
11. Enter your custom domain name and click `Add`.
    **Note:** You need to add a CNAME record to your domain registrar pointing to the value provided in the `CDN` profile.
12. Add the custom domain to the Azure Function CORS settings.

    To enable HTTPS for your custom domain:

13. On the endpoint page of the CDN profile, click on the custom domain name you added.
14. Toggle the `Custom Domain HTTPS` option to `On`.
15. For the HTTPS configuration, select the `CDN managed` option.
16. Set `TLS 1.2` as the minimum TLS version.
17. Click `Save` to apply the changes.
    Enabling HTTPS for the custom domain involves four steps:
    - Submitting request: Requesting a certificate
    - Domain validation: Verifying domain ownership
    - Certificate provisioning: Issuing the certificate
    - Completion: Applying the certificate and enabling HTTPS

After completing these steps, you'll have a custom domain for the Azure Resume project using Azure Front Door and CDN Service. You can now access the website using the custom domain and view the frontend of the Azure Resume project. For me i use the CDN service, because it is more cheaper and easier to setup.
