# Step 2: Set Up Azure Blob Storage

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[Cloud2BR OSS - Learning Hub](https://github.com/Cloud2BR-MSFTLearningHub)

Last updated: 2025-02-21

------------------------------------------

<div align="center">
  <img src="https://github.com/user-attachments/assets/a03041f5-ddde-4315-b2ce-3a4048e368bc" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 400px;"/>
</div>

## Create a Storage Account:

> An `Azure Storage Account` provides a `unique namespace in Azure for your data, allowing you to store and manage various types of data such as blobs, files, queues, and tables`. It serves as the foundation for all Azure Storage services, ensuring high availability, scalability, and security for your data. <br/> <br/>

- In the Azure portal, navigate to your **Resource Group**.
- Click **+ Create**.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/5cc5fe05-dfef-46fc-a5d3-2f05bf523239">

- Search for `Storage Account`.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/5806faf5-c074-4f2b-8e8f-998a544bd590" />

- Select the Resource Group you created.
- Enter a Storage Account name (e.g., `storagefileautomationsum`).
- Choose the region and performance options, and click `Next` to continue.
     
     <img width="550" alt="image" src="https://github.com/user-attachments/assets/e3bdc4eb-70b6-4200-ae25-df078be25ca8" />

- If you need to modify anything related to `Security, Access protocols, Blob Storage Tier`, you can do that in the `Advanced` tab.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/4b1df18d-cd89-4886-b692-d573f17eedb1">

- Regarding `Networking`, this example will cover `Public access` configuration. However, please ensure you review your privacy requirements and adjust network and access settings as necessary for your specific case.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0273e197-6e5b-4a1c-93cc-7597730c384b">

- Click **Review + create** and then **Create**. Once is done, you'll be able to see it in your Resource Group.
     
     <img width="550" alt="image" src="https://github.com/user-attachments/assets/02a326b0-08d2-4967-9f97-826c2269e135" />

### Create a Blob Container

> A `Blob Container` is a `logical grouping of blobs within an Azure Storage Account, similar to a directory in a file system`. Containers help organize and manage blobs, which can be any type of unstructured data like text or binary data. Each container can store an unlimited number of blobs, and you must create a container before uploading any blobs.

Within the Storage Account, create a Blob Container to store your PDFs.

- Go to your Storage Account.
- Under **Data storage**, select **Containers**.
- Click **+ Container**.
- Enter a name for the container (`input`, `output`) and set the public access level to **Private**.
- Click **Create**.
       
     <img width="550" alt="image" src="https://github.com/user-attachments/assets/fb7e34af-2f49-47d0-9e57-47d8e6d78d3b" />

### Allow storage account key access

> If you plan to use access keys, please ensure that the setting "Allow storage account key access" is enabled. When this setting is disabled, any requests to the account authorized with Shared Key, including shared access signatures (SAS), will be denied. Click [here to learn more](https://learn.microsoft.com/en-us/azure/storage/common/shared-key-authorization-prevent?tabs=portal)

<img width="550" alt="image" src="https://github.com/user-attachments/assets/b375dca8-9abf-4555-975b-b888dcc68988" />

<!-- START BADGE -->
<div align="center">
     <img src="https://img.shields.io/badge/Total%20views-0-limegreen" alt="Total views">
     <p>Refresh Date: 2026-04-07</p>
</div>
<!-- END BADGE -->
