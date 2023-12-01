# Azurerm Provider configuration
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "resource_group_name" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "plan_name" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.resource_group_name.name
  location            = azurerm_resource_group.resource_group_name.location
  os_type             = "Linux"
  sku_name            = "B3"
}

resource "azurerm_linux_web_app" "example" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.resource_group_name.name
  location            = azurerm_service_plan.plan_name.location
  service_plan_id     = azurerm_service_plan.plan_name.id

  site_config {
    http2_enabled       = true
    always_on           = true
    linux_fx_version    ="NODE|18-lts"          
  }
}

