# E2E (End to End) Workflow: Overview 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-01-29

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

## Overview 

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

- **Upload File to Blob Storage**: Users upload files to the input container in Azure Blob Storage.
- **Azure Function**: The Azure Function is triggered by the file upload.
- **Read Key Table from Blob Storage**: The function reads the key table from the input container.
- **Read Input File from Blob Storage**: The function reads the uploaded input file from the input container.
- **Process Data**: The function processes the data by searching for key values and extracting relevant information.
- **Generate Summary**: The function generates a summary based on the processed data.
- **Save Summary to Output Container**: The function saves the summary to the output container in Azure Blob Storage.
- **Summary Available for Download**: The summary is available for download from the output container.


<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
