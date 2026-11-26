# Sample data source intersight_appliance_system_status — reads ../models/data_intersight_appliance_system_status.yml
locals { m079 = yamldecode(file("${path.module}/../models/data_intersight_appliance_system_status.yml"))["data_intersight_appliance_system_status"] }

data "intersight_appliance_system_status" "n079" {
  account_moid = try(local.m079["account_moid"], null)
  additional_properties = try(local.m079["additional_properties"], null)
  class_id = try(local.m079["class_id"], null)
  create_time = try(local.m079["create_time"], null)
  domain_group_moid = try(local.m079["domain_group_moid"], null)
  id = try(local.m079["id"], null)
  mod_time = try(local.m079["mod_time"], null)
  moid = try(local.m079["moid"], null)
  object_type = try(local.m079["object_type"], null)
  operational_status = try(local.m079["operational_status"], null)
  owners = try(local.m079["owners"], null)
  results = try(local.m079["results"], null)
  shared_scope = try(local.m079["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m079["ancestors"], null) == null ? [] : local.m079["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_statuses" {
    for_each = try(local.m079["app_statuses"], null) == null ? [] : local.m079["app_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "group_statuses" {
    for_each = try(local.m079["group_statuses"], null) == null ? [] : local.m079["group_statuses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m079["parent"], null) == null ? [] : local.m079["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m079["permission_resources"], null) == null ? [] : local.m079["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m079["registered_device"], null) == null ? [] : local.m079["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "status_checks" {
    for_each = try(local.m079["status_checks"], null) == null ? [] : local.m079["status_checks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_info" {
    for_each = try(local.m079["system_info"], null) == null ? [] : local.m079["system_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m079["tags"], null) == null ? [] : local.m079["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m079["version_context"], null) == null ? [] : local.m079["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
