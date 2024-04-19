output "web_subnet_id" {
  value = azurerm_subnet.web-subnet.id
  description = "Id of websubnet in the network"
}

output "app_subnet_id" {
  value = azurerm_subnet.app-subnet.id
  description = "Id of appsubnet in the network"
}

output "db_subnet_id" {
  value = azurerm_subnet.db-subnet.id
  description = "Id of dbsubnet in the network"
}
