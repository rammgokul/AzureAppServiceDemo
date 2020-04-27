resource "azurerm_application_insights" "appInsight" {
  name                = var.AppInsightName
  location            = var.Location
  resource_group_name = var.ResourceGroupName
  application_type    = "web"
}

output "instrumentation_key" {
  value = azurerm_application_insights.appInsight.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appInsight.app_id
}
