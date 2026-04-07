# Azure File Upload and Summary Generator - Accelerator

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[Cloud2BR OSS - Learning Hub](https://github.com/Cloud2BR-MSFTLearningHub)

Last updated: 2026-04-07

----------

> Provides an example of creating an automated file processing and summary generation tool using Microsoft Azure technologies. It demonstrates how to use Azure AI Services, Azure Blob Storage, Azure Functions, and Python to upload files, search for key values, and generate summaries. The tool supports tabular data in xlsx and csv formats, as well as text data from docs and pdf files. Summaries can be generated in few formats, including xlsx, csv, and text files.
> [!IMPORTANT]
> Disclaimer: Please note, this example of solution `it is not an official solution guide`. For official guidance, support, or more detailed information, please refer to Microsoft's official documentation or contact Microsoft directly: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME)

<div align="center">
  <img src="https://github.com/user-attachments/assets/beaa73fb-e677-48d9-a3d9-a4367c3d7974" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

## Prerequisites

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided in this template.
- If you choose to use the Terraform approach, please ensure that:
  -  [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  -  [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.

## Where to start? 

Please follow as described below:

- If you're choosing the deploying the `infrastructure via Azure Portal`:
    1. Go through [each section](#content) `from the start`.
- If you're choosing the [Infrastructure via Terraform](./terraform/) approach:
    1. Please follow the [Terraform guide](./terraform/README.md) to deploy the necessary Azure resources for the workshop.
    2. Then, follow each [each section](#content) but `skip creating any resources that you've already deployed with Terraform.`.

> [!NOTE]
> About [Infrastructure via Terraform](./terraform/), Terraform is an infrastructure as code (IaC) tool that allows you to define and provision your infrastructure using a high-level configuration language. This approach `enables source control of the infrastructure itself, allowing you to manage not only the solution code but also the connections and configurations`. By using Terraform, you can ensure a consistent and reproducible environment for your deployments, automate infrastructure provisioning, and maintain version control over your infrastructure changes. Also, Microsoft provides other IaC tools such as Bicep and ARM templates. Bicep is a domain-specific language that uses declarative syntax to deploy Azure resources, offering a concise and easy-to-read alternative to JSON-based ARM templates. ARM templates are JSON files that define the infrastructure and configuration for your Azure solution. These tools provide flexibility and options to suit different preferences and requirements for managing Azure resources.

<div align="center">
  <img src="https://github.com/user-attachments/assets/51809c83-47b5-44e0-b170-b7f22cd15975" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

## Content 

- [Solution Overview](./instructions/0_Overview/README.md): Understand the core components and capabilities.
- [Step 1: Creating a Resource Group in the Azure Portal](./instructions/1_CreateRG.md)
- [Step 2: Set Up Azure Blob Storage](./instructions/2_CreateBlobStorage.md)
- [Step 3: Set Up AI Services](./instructions/3_SetupAIServices.md)
- [Step 4: Create a Log Analytics workspace in Azure](./instructions/4_CreateLogAnalyticsWS.md)
- [Step 5: Setup the Key Vault and Store secrets/keys](./instructions/5_SetupKeyVault.md)
- [Step 6: Setup the Function App and and Develop](./instructions/6_SetupFunctionApp.md)

## Important Considerations for Production Environment

- **Public Network Site**: This example is based on a public network site and is intended for demonstration purposes only. It showcases how various Azure resources can work together to achieve the desired result.
- **Private Network Configuration**: For enhanced security, consider configuring your Azure resources to operate within a private network. This can be achieved using Azure Virtual Network (VNet) to isolate your resources and control inbound and outbound traffic. Implementing private endpoints for services like Azure Blob Storage and Azure Functions can further secure your data by restricting access to your VNet.
- **Security**: Ensure that you implement appropriate security measures when deploying this solution in a production environment. This includes:
  - **Securing Access**: Use Azure Entra ID (formerly known as Azure Active Directory or Azure AD) for authentication and role-based access control (RBAC) to manage permissions.
  - **Managing Secrets**: Store sensitive information such as connection strings and API keys in Azure Key Vault.
  - **Data Encryption**: Enable encryption for data at rest and in transit to protect sensitive information.
- **Scalability**: While this example provides a basic setup, you may need to scale the resources based on your specific requirements. Azure services offer various scaling options to handle increased workloads. Consider using:
  - **Auto-scaling**: Configure auto-scaling for Azure Functions and other services to automatically adjust based on demand.
  - **Load Balancing**: Use Azure Load Balancer or Application Gateway to distribute traffic and ensure high availability.
- **Cost Management**: Monitor and manage the costs associated with your Azure resources. Use Azure Cost Management and Billing to track usage and optimize resource allocation.
- **Compliance**: Ensure that your deployment complies with relevant regulations and standards. Use Azure Policy to enforce compliance and governance policies across your resources.
- **Disaster Recovery**: Implement a disaster recovery plan to ensure business continuity in case of failures. Use Azure Site Recovery and backup solutions to protect your data and applications.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-0-limegreen" alt="Total views">
  <p>Refresh Date: 2026-04-07</p>
</div>
<!-- END BADGE -->
