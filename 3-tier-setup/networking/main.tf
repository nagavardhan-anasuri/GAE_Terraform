resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}

resource "azurerm_subnet" "web-subnet" {
  name                 = var.web_subnet_name
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.websubnetcidr]
}

resource "azurerm_subnet" "app-subnet" {
  name                 = var.app_subnet_name
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.appsubnetcidr]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = var.db_subnet_name
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnetcidr]
  service_endpoints    = ["Microsoft.Sql"]
}

# Create the Public IP for Expose NAT gateway which helps to access the Machine from Private subnet (Application)

resource "azurerm_public_ip" "this" {
  name                = var.pip_name_app
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
}


#Nat Gateway
resource "azurerm_nat_gateway" "this" {
  name                    = var.nat_gw_app
  location                = var.location
  resource_group_name     = var.resource_group
}

# Nat - Public IP Association
resource "azurerm_nat_gateway_public_ip_association" "this" {
 nat_gateway_id       = azurerm_nat_gateway.this.id
 public_ip_address_id = azurerm_public_ip.this.id
}

# NAT - Subnets association
resource "azurerm_subnet_nat_gateway_association" "this" {
 subnet_id      = azurerm_subnet.app-subnet.id
 nat_gateway_id = azurerm_nat_gateway.this.id
}

# Create the Public IP for Expose NAT gateway which helps to access the Machine from Private subnet (Database)

resource "azurerm_public_ip" "this1" {
  name                = var.pip_name_db
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
}


#Nat Gateway
resource "azurerm_nat_gateway" "this1" {
  name                    = var.nat_gw_db
  location                = var.location
  resource_group_name     = var.resource_group
}

# Nat - Public IP Association
resource "azurerm_nat_gateway_public_ip_association" "this1" {
 nat_gateway_id       = azurerm_nat_gateway.this1.id
 public_ip_address_id = azurerm_public_ip.this1.id
}

# NAT - Subnets association
resource "azurerm_subnet_nat_gateway_association" "this1" {
 subnet_id      = azurerm_subnet.db-subnet.id
 nat_gateway_id = azurerm_nat_gateway.this1.id
}