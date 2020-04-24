resource "azurerm_application_insights" "appInsight" {
  name                = var.AppInsightName
  location            = azurerm_resource_group.ResourceGroup.location
  resource_group_name = azurerm_resource_group.ResourceGroup.name
  application_type    = "web"
}

output "instrumentation_key" {
  value = azurerm_application_insights.appInsight.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appInsight.app_id
}
