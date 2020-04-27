# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "westeurope"
# }

# module "web_app_container" {
#   source = "innovationnorway/web-app-container/azurerm"

#   name = "hello-world"

#   resource_group_name = azurerm_resource_group.example.name

#   container_type = "docker"

#   container_image = "innovationnorway/go-hello-world:latest"
# }


# Create an App Service Plan with Linux
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "${var.AppServiceName}-Plan"
  location            = var.Location
  resource_group_name = var.ResourceGroupName

  # Define Linux as Host OS
  kind     = "Linux"
  reserved = true

  # Choose size
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Create an Azure Web App for Containers in that App Service Plan
resource "azurerm_app_service" "dockerapp" {
  name                = var.AppServiceName
  location            = var.Location
  resource_group_name = var.ResourceGroupName
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  # Do not attach Storage by default
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    DOCKER_REGISTRY_SERVER_URL          = "https://${azurerm_container_registry.acr.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.acr.admin_password
    DOCKER_CUSTOM_IMAGE_NAME            = ""
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    APPINSIGHTS_INSTRUMENTATIONKEY      = azurerm_application_insights.appInsight.instrumentation_key
  }

  site_config {
    linux_fx_version = "DOCKER|insightdemocontainerregistry.azurecr.io/insightappservice:95"
  }
  lifecycle {
    ignore_changes = [
      site_config.0.linux_fx_version, app_settings.DOCKER_CUSTOM_IMAGE_NAME, # deployments are made outside of Terraform
    ]
  }

  # Configure Docker Image to load on start

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service_slot" "stagingSlot" {
  name                = "staging"
  app_service_name    = azurerm_app_service.dockerapp.name
  location            = var.Location
  resource_group_name = var.ResourceGroupName
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    DOCKER_REGISTRY_SERVER_URL          = "https://${azurerm_container_registry.acr.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.acr.admin_password
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    DOCKER_CUSTOM_IMAGE_NAME            = ""
    APPINSIGHTS_INSTRUMENTATIONKEY      = azurerm_application_insights.appInsight.instrumentation_key
  }

  site_config {
    # ...
    linux_fx_version = "insightdemocontainerregistry.azurecr.io/insightappservice:95"
  }
  lifecycle {
    ignore_changes = [
      site_config.0.linux_fx_version, app_settings.DOCKER_CUSTOM_IMAGE_NAME, # deployments are made outside of Terraform
    ]
  }
}
