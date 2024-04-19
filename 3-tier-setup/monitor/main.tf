resource "azurerm_monitor_action_group" "email-alert" {
  name                = "email-alert"
  resource_group_name = var.resource_group
  short_name          = "email"

  email_receiver {
    name                    = "sendtocloudops"
    email_address           = "vinoth.ramesh@valuemomentum.com"
    use_common_alert_schema = true
  }

}

resource "azurerm_monitor_metric_alert" "cpu-alert-web-vms" {
  name                = "cpu-metricalert-webvms"
  resource_group_name = var.resource_group
  scopes              = [var.web_vm_id]
  description         = "Action will be triggered when CPU Threshold is greater than 90."

  criteria {
    metric_namespace = "Microsoft.Storage/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90

  }
  action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }

}

resource "azurerm_monitor_metric_alert" "cpu-alert-app-vms" {
  name                = "cpu-metricalert-appvms"
  resource_group_name = var.resource_group
  scopes              = [var.app_vm_id]
  description         = "Action will be triggered when CPU Threshold is greater than 90."

  criteria {
    metric_namespace = "Microsoft.Storage/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90

  }

    action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }

}

resource "azurerm_monitor_metric_alert" "memory-alert-web-vms" {
  name                = "memory-metricalert-webvms"
  resource_group_name = var.resource_group
  scopes              = [var.web_vm_id]
  description         = "Action will be triggered when Memory Threshold is greater than 80."

  criteria {
    metric_namespace = "Microsoft.Storage/virtualMachines"
    metric_name      = "Percentage Memory"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80

  }
   action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }


}

resource "azurerm_monitor_metric_alert" "memory-alert-app-vms" {
  name                = "memory-metricalert-appvms"
  resource_group_name = var.resource_group
  scopes              = [var.app_vm_id]
  description         = "Action will be triggered when Memory Threshold is greater than 80."

  criteria {
    metric_namespace = "Microsoft.Storage/virtualMachines"
    metric_name      = "Percentage Memory"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80

  }
 
   action {
    action_group_id = azurerm_monitor_action_group.email-alert.id
  }

}