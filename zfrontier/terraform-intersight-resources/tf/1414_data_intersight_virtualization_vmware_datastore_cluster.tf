# Sample data source intersight_virtualization_vmware_datastore_cluster — reads ../models/data_intersight_virtualization_vmware_datastore_cluster.yml
locals { m1414 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_datastore_cluster.yml"))["data_intersight_virtualization_vmware_datastore_cluster"] }

data "intersight_virtualization_vmware_datastore_cluster" "n1414" {
  account_moid = try(local.m1414["account_moid"], null)
  additional_properties = try(local.m1414["additional_properties"], null)
  automation_level = try(local.m1414["automation_level"], null)
  class_id = try(local.m1414["class_id"], null)
  create_time = try(local.m1414["create_time"], null)
  datastore_count = try(local.m1414["datastore_count"], null)
  domain_group_moid = try(local.m1414["domain_group_moid"], null)
  free_space_threshold = try(local.m1414["free_space_threshold"], null)
  host_count = try(local.m1414["host_count"], null)
  id = try(local.m1414["id"], null)
  identity = try(local.m1414["identity"], null)
  inventory_path = try(local.m1414["inventory_path"], null)
  io_latency_threshold = try(local.m1414["io_latency_threshold"], null)
  io_load_balance_automation_mode = try(local.m1414["io_load_balance_automation_mode"], null)
  io_load_imbalance_threshold = try(local.m1414["io_load_imbalance_threshold"], null)
  io_metrics_enabled = try(local.m1414["io_metrics_enabled"], null)
  min_space_utilization_difference = try(local.m1414["min_space_utilization_difference"], null)
  mod_time = try(local.m1414["mod_time"], null)
  moid = try(local.m1414["moid"], null)
  name = try(local.m1414["name"], null)
  object_type = try(local.m1414["object_type"], null)
  owners = try(local.m1414["owners"], null)
  policy_enforcement_automation_mode = try(local.m1414["policy_enforcement_automation_mode"], null)
  reservable_percent_threshold = try(local.m1414["reservable_percent_threshold"], null)
  results = try(local.m1414["results"], null)
  rule_enforcement_automation_mode = try(local.m1414["rule_enforcement_automation_mode"], null)
  shared_scope = try(local.m1414["shared_scope"], null)
  space_load_balance_automation_mode = try(local.m1414["space_load_balance_automation_mode"], null)
  space_threshold_mode = try(local.m1414["space_threshold_mode"], null)
  status = try(local.m1414["status"], null)
  storage_drs_enabled = try(local.m1414["storage_drs_enabled"], null)
  type = try(local.m1414["type"], null)
  utilized_space_threshold = try(local.m1414["utilized_space_threshold"], null)
  vm_count = try(local.m1414["vm_count"], null)
  vm_evacuation_automation_mode = try(local.m1414["vm_evacuation_automation_mode"], null)
  dynamic "ancestors" {
    for_each = try(local.m1414["ancestors"], null) == null ? [] : local.m1414["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capacity" {
    for_each = try(local.m1414["capacity"], null) == null ? [] : local.m1414["capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1414["datacenter"], null) == null ? [] : local.m1414["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1414["parent"], null) == null ? [] : local.m1414["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1414["permission_resources"], null) == null ? [] : local.m1414["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1414["registered_device"], null) == null ? [] : local.m1414["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1414["tags"], null) == null ? [] : local.m1414["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1414["version_context"], null) == null ? [] : local.m1414["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
