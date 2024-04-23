# Azure Resume Project: API Documentation

## Overview

This project leverages Azure Functions, a serverless compute service, to host the backend of the Azure Resume project. The backend processes data from the frontend and stores it in a Cosmos DB database.

## Pre-requisites

Ensure you have the following tools installed:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
- [Azure Functions Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=windows%2Ccsharp%2Cbash)
- [.NET Core SDK](https://dotnet.microsoft.com/download)
- [Visual Studio Code](https://code.visualstudio.com/)

## Setup

Azure Functions use bindings to connect to other services. This project uses an HTTP-triggered function that stores data in a Cosmos DB database via an input binding.

### Cosmos DB Setup

Create a Cosmos DB account, database, container, and items by applying the terraform configuration in the [Terraform](../../terraform) folder. Refer to the [Terraform documentation](../../terraform/README.md) for detailed instructions.

### Azure Function Setup

1. Install the .NET Core SDK and Azure Functions Core Tools extension in Visual Studio Code.
2. Use the Azure Functions extension in Visual Studio Code to create a new project in the `backend/api` folder.
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

### Connect the Azure Function to the Frontend

1. Go to the `local.settings.json` file and add the following CORS settings:

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

2. In the [frontend](../../frontend) folder, update the `apiUrl` in the [main.js](../../frontend/main.js) file to point to your Azure Function URL.
