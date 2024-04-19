output "web_net_id" {
  value = azurerm_network_interface.web-net-interface.id
  description = "Id of web interface in the network"
}

output "app_net_id" {
  value = azurerm_network_interface.app-net-interface.id
  description = "Id of app interface in the network"
}

output "web_vm_id" {
  value = azurerm_windows_virtual_machine.web-vm.id
  description = "Id of web vm"
}

output "app_vm_id" {
  value = azurerm_windows_virtual_machine.app-vm.id
  description = "Id of app vm"
}


