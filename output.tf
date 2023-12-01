output "app_service_plan_id" {
  description = "The resource ID of the App Service Plan component"
  value       = azurerm_service_plan.plan_name.name
}

output "app_service_plan_id" {
  description = "The resource ID of the App Service Plan component"
  value       = azurerm_linux_web_app.main.id
}