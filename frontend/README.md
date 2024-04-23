# Azure Resume Project: Frontend Documentation

## Overview

The frontend of the Azure Resume Project is a responsive website built with HTML, CSS, and JavaScript. It serves as a digital resume, displaying user-specific information. The website is hosted on Azure Blob Storage and can be accessed via a custom domain.

The website's functionality includes a visitor counter that triggers an Azure function, interacting with CosmosDB to store the counter data.

## Structure

The frontend is structured as follows:

- **HTML**: Defines the website's structure. The main file is [index.html](index.html).
- **CSS**: Controls the website's visual appearance. All CSS files are located in the [css](css) folder.
- **JavaScript**: Handles the website's functionality, including the visitor counter. All JavaScript files are located in the [js](js) folder. and the main file is [main.js](main.js).
- **Images**: Any images used on the website are stored in the [images](images) folder.
- **Favicon**: The website's favicon is [favicon.png](favicon.png).

All files and folders originate from the [cgc-azure-resume-starter](https://github.com/ACloudGuru-Resources/acg-project-azure-resume-starter) repository.

## Main.js

The `main.js` file contains the visitor counter functionality. It performs two main tasks:

1. **Incrementing the visitor counter**: When the website loads, `main.js` sends a POST request to an Azure Function. This function increments a counter in a CosmosDB database, tracking the number of visits to the website.

2. **Displaying the visitor counter**: After incrementing the counter, `main.js` retrieves the updated counter value from CosmosDB and displays it on the website.

## Getting Started

To use the frontend:

1. Clone the repository.
2. Edit the [index.html](index.html) file to include your resume information.
3. (Optional) Customize the CSS and JavaScript files to alter the website's appearance and functionality.

Remember to test your changes locally before deploying them to Azure Blob Storage.
