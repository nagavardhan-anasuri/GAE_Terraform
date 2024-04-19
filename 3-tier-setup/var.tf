variable "location" {
    description = "Location"
    default = ""
}

variable "resource_group" {
    description = "Resource group name"
    default = ""
}

variable "env" {
    default ="staging"
    type = string
}

variable "win_vm_count" {
  description = "Number of Windows Instances"
  type = number
  default = 3
}

variable "vnetcidr" {
    default ="10.0.0.0/16"
    type = string
}
variable "websubnetcidr" {
    default ="10.0.1.0/24"
    type = string
}
variable "appsubnetcidr" {
    default ="10.0.2.0/24"
    type = string
}
variable "dbsubnetcidr" {
    default ="10.0.3.0/24"
    type = string
}

variable "vnet_name" {
        default ="dojo-vnet"
    type = string
}
variable "web_subnet_name" {
        default ="dojo-web-snet"
    type = string
}
variable "app_subnet_name" {
        default ="dojo-app-snet"
    type = string
}
variable "db_subnet_name" {
        default ="dojo-db-snet"
    type = string
}

variable "web_net_id" {
  description = "Id of web interface in the network"
  type = string
  default = ""
}

variable "app_net_id" {
  description = "Id of app interface in the network"
  type = string
  default = ""
}

variable "web_subnet_id" {}
variable "app_subnet_id" {}
variable "web_host_name"{}
variable "web_username" {}
variable "web_os_password" {}
variable "app_host_name"{}
variable "app_username" {}
variable "app_os_password" {}
variable "web_availibility_set" {}
variable "web_network_interface" {}
variable "web_win_vm" {}
variable "app_availibility_set" {}
variable "app_network_interface" {}
variable "app_win_vm" {}
variable "ipconfig_app_name" {}
variable "ipconfig_web_name" {}
variable "vm_size" {}
variable "os_type" {}

variable "web-nsg-name" {}
variable "app-nsg-name" {}
variable "db-nsg-name" {}


variable "primary_database" {}
variable "primary_database_version" {}
variable "primary_database_admin" {}
variable "primary_database_password" {}
variable "db_name" {}


variable "lb_name" {}
variable "lb_pip_name" {}
variable "backend_addr_pool" {}


variable "web_vm_id" {}
variable "app_vm_id" {}

variable "vpn_pip_name" {}
variable "vir_nw_gw" {}

variable "vpn_client_root_cert_path" {}