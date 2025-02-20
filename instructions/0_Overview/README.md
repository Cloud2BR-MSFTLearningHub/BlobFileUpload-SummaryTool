# E2E (End to End) Workflow: Overview 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-20

------------------------------------------

<details>
<summary><b>List of references</b> (Click to expand)</summary>

- [Quickstart: Azure AI Vision v3.2 GA Read](https://learn.microsoft.com/en-us/azure/ai-services/computer-vision/quickstarts-sdk/client-library?tabs=windows%2Cvisual-studio&pivots=programming-language-python)
- [Quickstart: Azure Blob Storage client library for Python](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-python?tabs=managed-identity%2Croles-azure-portal%2Csign-in-azure-cli&pivots=blob-storage-quickstart-scratch)
- [Create a function in Azure that's triggered by Blob storage](https://learn.microsoft.com/en-us/azure/azure-functions/functions-create-storage-blob-triggered-function)
- [Quickstart: Azure Key Vault secret client library for Python](https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-python?tabs=azure-cli)
- [Azure Application Insights SDK for Python](https://learn.microsoft.com/en-us/python/api/overview/azure/application-insights?view=azure-python)
- [Create a Log Analytics workspace](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/quick-create-workspace?tabs=azure-portal)
- [Quickstart: Use the Azure portal to create a virtual network](https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-portal)

</details>

<details>
<summary><b>List of Contents</b> (Click to expand)</summary>

- [Workflow](#workflow)
- [Architecture: Components and Interactions](#architecture-components-and-interactions)

</details>

## Workflow

```mermaid
graph TD
    A[Upload File to Blob Storage] -->|Trigger| B[Azure Function]
    B --> C[Read Key Table from Blob Storage]
    B --> D[Read Input File from Blob Storage]
    C --> E[Process Data]
    D --> E[Process Data]
    E --> F[Generate Summary]
    F --> G[Save Summary to Output Container]
    G --> H[Summary Available for Download]

    subgraph Azure Resources
        A
        B
        C
        D
        G
    end

    subgraph Processing Steps
        E
        F
        H
    end
```


1. **Upload File to Blob Storage**: Users upload files to the input container in Azure Blob Storage.
2. **Azure Function**: The Azure Function is triggered by the file upload.
3. **Read Key Table from Blob Storage**: The function reads the key table from the input container.
4. **Read Input File from Blob Storage**: The function reads the uploaded input file from the input container.
5. **Process Data**: The function processes the data by searching for key values and extracting relevant information.
6. **Generate Summary**: The function generates a summary based on the processed data.
7. **Save Summary to Output Container**: The function saves the summary to the output container in Azure Blob Storage.
8. **Summary Available for Download**: The summary is available for download from the output container.

## Architecture: Components and Interactions 

<div align="center">
  <img src="https://github.com/user-attachments/assets/beaa73fb-e677-48d9-a3d9-a4367c3d7974" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
