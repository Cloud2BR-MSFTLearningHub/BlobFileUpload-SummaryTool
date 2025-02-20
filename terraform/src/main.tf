# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  # Output the resource group name
  provisioner "local-exec" {
    command = "echo Resource Group: ${self.name}"
  }
}

# Azure Form Recognizer (Document Intelligence)
resource "azurerm_cognitive_account" "form_recognizer" {
  name                = var.form_recognizer_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FormRecognizer"
  sku_name            = "S0"

  depends_on = [azurerm_resource_group.rg]

  # Output the Form Recognizer name
  provisioner "local-exec" {
    command = "echo Form Recognizer: ${self.name}"
  }
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [azurerm_resource_group.rg]

  # Output the storage account name
  provisioner "local-exec" {
    command = "echo Storage Account: ${self.name}"
  }
}

# Blob Container for Input Files
resource "azurerm_storage_container" "input_container" {
  name                  = "input"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"

  depends_on = [azurerm_storage_account.storage]

  # Output the container name
  provisioner "local-exec" {
    command = "echo Input Container: ${self.name}"
  }
}

# Blob Container for Output Files
resource "azurerm_storage_container" "output_container" {
  name                  = "output"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"

  depends_on = [azurerm_storage_account.storage]

  # Output the container name
  provisioner "local-exec" {
    command = "echo Output Container: ${self.name}"
  }
}

# Azure Function App
resource "azurerm_function_app" "function_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  app_service_plan_id        = azurerm_service_plan.asp.id
  os_type                    = "linux"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }

  depends_on = [azurerm_service_plan.asp]

  # Output the function app name
  provisioner "local-exec" {
    command = "echo Function App: ${self.name}"
  }
}

# Service Plan
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1"  # Consumption plan

  depends_on = [azurerm_resource_group.rg]

  # Output the service plan name
  provisioner "local-exec" {
    command = "echo Service Plan: ${self.name}"
  }
}

# Application Insights
resource "azurerm_application_insights" "appinsights" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"

  depends_on = [azurerm_resource_group.rg]

  # Output the application insights name
  provisioner "local-exec" {
    command = "echo Application Insights: ${self.name}"
  }
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"

  depends_on = [azurerm_resource_group.rg]

  # Output the log analytics workspace name
  provisioner "local-exec" {
    command = "echo Log Analytics Workspace: ${self.name}"
  }
}

# Key Vault
resource "azurerm_key_vault" "keyvault" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  depends_on = [azurerm_resource_group.rg]

  # Output the key vault name
  provisioner "local-exec" {
    command = "echo Key Vault: ${self.name}"
  }
}

# Data source to get tenant ID
data "azurerm_client_config" "current" {}
