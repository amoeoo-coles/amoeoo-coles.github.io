# Sample data source intersight_niatelemetry_nexus_dashboard_memory_details — reads ../models/data_intersight_niatelemetry_nexus_dashboard_memory_details.yml
locals { m980 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nexus_dashboard_memory_details.yml"))["data_intersight_niatelemetry_nexus_dashboard_memory_details"] }

data "intersight_niatelemetry_nexus_dashboard_memory_details" "n980" {
  account_moid = try(local.m980["account_moid"], null)
  additional_properties = try(local.m980["additional_properties"], null)
  class_id = try(local.m980["class_id"], null)
  create_time = try(local.m980["create_time"], null)
  device_name = try(local.m980["device_name"], null)
  domain_group_moid = try(local.m980["domain_group_moid"], null)
  id = try(local.m980["id"], null)
  memory_capacity = try(local.m980["memory_capacity"], null)
  mod_time = try(local.m980["mod_time"], null)
  moid = try(local.m980["moid"], null)
  object_type = try(local.m980["object_type"], null)
  owners = try(local.m980["owners"], null)
  results = try(local.m980["results"], null)
  shared_scope = try(local.m980["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m980["ancestors"], null) == null ? [] : local.m980["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nexus_dashboard" {
    for_each = try(local.m980["nexus_dashboard"], null) == null ? [] : local.m980["nexus_dashboard"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m980["parent"], null) == null ? [] : local.m980["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m980["permission_resources"], null) == null ? [] : local.m980["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m980["registered_device"], null) == null ? [] : local.m980["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m980["tags"], null) == null ? [] : local.m980["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m980["version_context"], null) == null ? [] : local.m980["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
