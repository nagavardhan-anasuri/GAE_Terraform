output "web_net_id" {
  value = module.compute.web_net_id
  description = "Id of web interface in the network"
}

output "app_net_id" {
  value = module.compute.app_net_id
  description = "Id of app interface in the network"
}

output "web_subnet_id" {
  value = module.networking.web_subnet_id
  description = "Id of websubnet in the network"
}

output "app_subnet_id" {
  value = module.networking.app_subnet_id
  description = "Id of appsubnet in the network"
}

output "db_subnet_id" {
  value = module.networking.db_subnet_id
  description = "Id of dbsubnet in the network"
}

output "web_vm_id" {
  value = module.monitor.web_vm_id
  description = "Id of web vm"
}

output "app_vm_id" {
  value = module.monitor.app_vm_id
  description = "Id of app vm"
}

output "root_output_variable" {
  value = local.root_cert
}