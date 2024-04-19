resource "azurerm_mssql_server" "primary" {
    name = var.primary_database
    resource_group_name = var.resource_group
    location = var.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password
    public_network_access_enabled = false # Requires for After Scanning
    minimum_tls_version          = "1.2"  # Requires for After Scanning
}

resource "azurerm_mssql_database" "db" {
  name              = var.db_name
  server_id         = azurerm_mssql_server.primary.id
  zone_redundant    = true                # Requires for After Scanning

    lifecycle {                           # Requires for After Scanning
    prevent_destroy = true
  }
}
