# Step 6: Setup the Function App and and Develop 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[Cloud2BR OSS - Learning Hub](https://github.com/Cloud2BR-MSFTLearningHub)

Last updated: 2026-04-07

------------------------------------------

<div align="center">
  <img src="https://github.com/user-attachments/assets/60371d79-6266-4dd3-884e-22ec5c90f4be" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px; width: 400px;"/>
</div>

## Creating a Function App via the Azure portal

1. **Sign in to Azure Portal**: Go to the Azure portal and sign in with your Azure account.
2. **Create a Function App**:
   - From the Azure portal menu or the Home page, select `Create a resource`.
   - In the `New` page, search for `Function App`.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/0cafbbfb-dcce-454b-90a0-198a44642bd4" />

3. **Select Hosting Plan**: Under `Hosting`, choose the `Consumption (Serverless)` plan for a pay-per-execution model, or select a different plan based on your needs.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/7e69e7f2-7aea-474a-b7ee-334fac2b8244">

4. **Configure the Function App**:
   - On the `Basics` tab, fill in the required fields:
     - **Subscription**: Select your Azure subscription.
     - **Resource Group**: Create a new resource group or select an existing one.
     - **Function App name**: Enter a globally unique name for your Function App.
     - **Region**: Choose the region closest to you or your users.
     - **Runtime stack**: Select the runtime stack (e.g., .NET, Node.js, Python) you want to use.
     - **Version**: Choose the version of the runtime stack.
     
         <img width="550" alt="image" src="https://github.com/user-attachments/assets/55c46c0d-cb02-42cc-bb25-62615869c534" />

5. **Configure Storage and Networking**:
   - **Storage Account**: Create a new storage account or use an existing one.
   - **Operating System**: Choose between Windows or Linux.
   - **Plan Type**: Select the appropriate plan type for your Function App.
6. **Monitoring**: Enable `Application Insights` to monitor your Function App, which helps in tracking performance and diagnosing issues.
7. **Review and Create**:
   - Review all the configurations you have made.
   - Click `Create` to deploy your Function App.
  

       https://github.com/user-attachments/assets/a1ab969e-35f0-440d-b977-ce349cb69e99


  
## Create a Function

- Once the Function App is created, navigate to it in the Azure portal.
- Select `Functions` from the left-hand menu, then click `+ Add` to create a new function.
- Choose a template (e.g., HTTP trigger) and configure the function settings.



<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1282-limegreen" alt="Total views">
  <p>Refresh Date: 2026-04-07</p>
</div>
<!-- END BADGE -->
