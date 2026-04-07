# Terraform deployment for Azure resources required for this use case

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[Cloud2BR OSS - Learning Hub](https://github.com/Cloud2BR-MSFTLearningHub)

Last updated: 2026-04-07

------------------------------------------

> Terraform templates to deploy an Azure-based automated file processing and summary generation tool. The solution includes:

<div align="center">
  <img src="https://github.com/user-attachments/assets/51809c83-47b5-44e0-b170-b7f22cd15975" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Overview](#overview)
- [Resources](#resources)
- [How to execute it](#how-to-execute-it)

</details>


## Overview 

```text
.
├── README.md
├── src
├────── main.tf
├────── variables.tf
├────── provider.tf
├────── terraform.tfvars
├────── remote-storage.tf 
├────── outputs.tf
```

- **main.tf** `(Main Terraform configuration file)`: This file contains the core infrastructure code. It defines the resources you want to create, such as Azure Blob Storage, Azure Functions, and other necessary services. It's the primary file where you describe your infrastructure in a declarative manner.
- **variables.tf** `(Variable definitions)`: This file is used to define variables that can be used throughout your Terraform configuration. By using variables, you can make your configuration more flexible and reusable. For example, you can define variables for resource names, sizes, and other parameters that might change between environments.
- **provider.tf** `(Provider configurations)`: Providers are plugins that Terraform uses to interact with cloud providers, SaaS providers, and other APIs. This file specifies the Azure provider and any necessary configuration for it, such as authentication details.
- **terraform.tfvars** `(Variable values)`: This file contains the actual values for the variables defined in `variables.tf`. By separating variable definitions and values, you can easily switch between different sets of values for different environments (e.g., development, staging, production) without changing the main configuration files.
- **remote-storage.tf** `(Remote state storage configuration)`: Terraform uses a state file to keep track of the resources it manages. This file configures remote state storage, which allows you to store the state file in a remote location (e.g., Azure Blob Storage). Remote state storage is crucial for collaboration and ensuring that the state file is not lost or corrupted.
- **outputs.tf** `(Output values)`: This file defines the output values that Terraform should return after applying the configuration. Outputs are useful for displaying information about the resources created, such as resource IDs, connection strings, and other important details. They can also be used as inputs for other Terraform configurations or scripts.

## Resources 

| Resource                | Description                                                                                   |
| :---------------------- | :-------------------------------------------------------------------------------------------- |
| Azure Resource Group    | A logical container that organizes and manages all the related Azure resources.               |
| Azure Blob Storage      | Stores input files (xlsx, csv, docs, pdfs) and output summary files.                          |
| Azure Functions         | Executes serverless compute tasks to process the uploaded files and generate summaries.       |
| Azure AI Services       | Provides text analytics and OCR capabilities to handle text data from docs and pdfs.          |
| Azure Storage Account   | Manages Blob Storage and other storage services.                                               |
| Azure Key Vault         | Stores and manages sensitive information such as connection strings and API keys.             |
| Application Insights    | Monitors the performance and usage of the file processing tool.                                |
| Log Analytics Workspace | Collects and analyzes log data from various sources.                                           |

## How to execute it 

```mermaid
graph TD;
    A[az login] --> B(terraform init)
    B --> C{Terraform provisioning stage}
    C -->|Review| D[terraform plan]
    C -->|Order Now| E[terraform apply]
    C -->|Delete Resource if needed| F[terraform destroy]
```

> [!IMPORTANT]
> Please modify `terraform.tfvars` with your information. Then run the following flow:

1. **Login to Azure**: This command logs you into your Azure account. It opens a browser window where you can enter your Azure credentials. Once logged in, you can manage your Azure resources from the command line.

    ```sh
    cd ./terraform/src/
    ```

    ```sh
    az login
    ```

    <div align="center">
      <img src="https://github.com/user-attachments/assets/caed0c96-2a3e-4e1a-a788-b1b43b8d5939" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
    </div>
    

2. **Initialize Terraform**: Initializes the working directory containing the Terraform configuration files. It downloads the necessary provider plugins and sets up the backend for storing the state.

    ```sh
    terraform init
    ```

    <div align="center">
      <img src="https://github.com/user-attachments/assets/8b4c3960-b9f6-44dc-8325-f58ef15eb1dc" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
    </div>


3. **Terraform Provisioning Stage**: 

   - **Review**: Creates an execution plan, showing what actions Terraform will take to achieve the desired state defined in your configuration files. It uses the variable values specified in `terraform.tfvars`.

        ```sh
        terraform plan -var-file terraform.tfvars
        ```

        <div align="center">
          <img src="https://github.com/user-attachments/assets/1cd5e195-9441-4a4e-ba7a-0ef046370834" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
        </div>

   - **Order Now**: Applies the changes required to reach the desired state of the configuration. It prompts for confirmation before making any changes. It also uses the variable values specified in `terraform.tfvars`.

        ```sh
        terraform apply -var-file terraform.tfvars
        ```
  
       <div align="center">
          <img src="https://github.com/user-attachments/assets/81f79658-c35f-465a-98e8-55da2b1561fa" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
        </div>

       <div align="center">
          <img src="https://github.com/user-attachments/assets/7fb56136-a1cf-45dc-b96c-6b0f9312ca19" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
        </div>

   - **Remove**: Destroys the infrastructure managed by Terraform. It prompts for confirmation before deleting any resources. It also uses the variable values specified in `terraform.tfvars`.
    
        ```sh
        terraform destroy -var-file terraform.tfvars
        ```

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1282-limegreen" alt="Total views">
  <p>Refresh Date: 2026-04-07</p>
</div>
<!-- END BADGE -->

