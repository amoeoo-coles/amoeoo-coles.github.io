# Sample data source intersight_appliance_file_system_status — reads ../models/data_intersight_appliance_file_system_status.yml
locals { m057 = yamldecode(file("${path.module}/../models/data_intersight_appliance_file_system_status.yml"))["data_intersight_appliance_file_system_status"] }

data "intersight_appliance_file_system_status" "n057" {
  account_moid = try(local.m057["account_moid"], null)
  additional_properties = try(local.m057["additional_properties"], null)
  capacity = try(local.m057["capacity"], null)
  class_id = try(local.m057["class_id"], null)
  create_time = try(local.m057["create_time"], null)
  domain_group_moid = try(local.m057["domain_group_moid"], null)
  id = try(local.m057["id"], null)
  mod_time = try(local.m057["mod_time"], null)
  moid = try(local.m057["moid"], null)
  mountpoint = try(local.m057["mountpoint"], null)
  object_type = try(local.m057["object_type"], null)
  operational_status = try(local.m057["operational_status"], null)
  owners = try(local.m057["owners"], null)
  results = try(local.m057["results"], null)
  shared_scope = try(local.m057["shared_scope"], null)
  usage = try(local.m057["usage"], null)
  dynamic "ancestors" {
    for_each = try(local.m057["ancestors"], null) == null ? [] : local.m057["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_status" {
    for_each = try(local.m057["node_status"], null) == null ? [] : local.m057["node_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m057["parent"], null) == null ? [] : local.m057["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m057["permission_resources"], null) == null ? [] : local.m057["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "status_checks" {
    for_each = try(local.m057["status_checks"], null) == null ? [] : local.m057["status_checks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m057["tags"], null) == null ? [] : local.m057["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m057["version_context"], null) == null ? [] : local.m057["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
