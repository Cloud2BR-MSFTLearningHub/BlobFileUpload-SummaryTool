# Step 5: Setup the Key Vault and Store secrets/keys

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-21

------------------------------------------


<div align="center">
  <img src="https://github.com/user-attachments/assets/0f4abd63-dff3-4061-a578-71dd73646a2f" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 400px;"/>
</div>

## Step 1: Create an Azure Key Vault

1. `Sign in to Azure Portal`: Go to the Azure portal and sign in with your Azure account.
2. `Create a Key Vault`:
   - From the Azure portal menu, select `Create a resource`.
   - In the `Search` box, type `Key Vault` and select `Key Vault` from the results.
   - Click `Create`.

<div align="center">
  <img src="https://github.com/user-attachments/assets/4cbbf567-4905-49bc-9c3f-52cbc06e6665" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

   - Fill in the required details:
     - `Name`: A unique name for your Key Vault.
     - `Subscription`: Select your Azure subscription.
     - `Resource Group`: Select an existing resource group or create a new one.
     - `Location`: Choose the Azure region.
   - Click `Review + create` and then `Create`.

<div align="center">
  <img src="https://github.com/user-attachments/assets/dd3c4e3f-659a-454b-806e-83aa25a4add3" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

## Step 2: Store Secrets and Keys

1. `Add a Secret`:
   - Navigate to your Key Vault in the Azure portal.
   - In the left-hand menu, select `Secrets`.
   - Click `+ Generate/Import`.
   - Fill in the details:
     - `Upload options`: Select `Manual`.
     - `Name`: Enter a name for the secret (e.g., `storage-account-key`).
     - `Value`: Enter the value of the secret (e.g., your storage account key).
   - Click `Create`.

<div align="center">
  <img src="https://github.com/user-attachments/assets/8bbf10c3-ea78-4fc0-8a21-ea244b104bb2" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

2. `Add a Key`:
   - In the Key Vault menu, select `Keys`.
   - Click `+ Generate/Import`.
   - Fill in the details:
     - `Options`: Select `Generate`.
     - `Name`: Enter a name for the key (e.g., `encryption-key`).
   - Click `Create`.

<div align="center">
  <img src="https://github.com/user-attachments/assets/4c8ed12c-d1c9-4948-abf3-6646730ea757" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 700px;"/>
</div>

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
