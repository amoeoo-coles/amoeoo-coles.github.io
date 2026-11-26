# Sample data source intersight_appliance_cpu_utilization — reads ../models/data_intersight_appliance_cpu_utilization.yml
locals { m045 = yamldecode(file("${path.module}/../models/data_intersight_appliance_cpu_utilization.yml"))["data_intersight_appliance_cpu_utilization"] }

data "intersight_appliance_cpu_utilization" "n045" {
  account_moid = try(local.m045["account_moid"], null)
  additional_properties = try(local.m045["additional_properties"], null)
  class_id = try(local.m045["class_id"], null)
  create_time = try(local.m045["create_time"], null)
  domain_group_moid = try(local.m045["domain_group_moid"], null)
  end_time = try(local.m045["end_time"], null)
  id = try(local.m045["id"], null)
  meta_field = try(local.m045["meta_field"], null)
  mod_time = try(local.m045["mod_time"], null)
  moid = try(local.m045["moid"], null)
  node_hostname = try(local.m045["node_hostname"], null)
  node_id = try(local.m045["node_id"], null)
  object_type = try(local.m045["object_type"], null)
  owners = try(local.m045["owners"], null)
  results = try(local.m045["results"], null)
  shared_scope = try(local.m045["shared_scope"], null)
  time = try(local.m045["time"], null)
  utilization = try(local.m045["utilization"], null)
  dynamic "ancestors" {
    for_each = try(local.m045["ancestors"], null) == null ? [] : local.m045["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attributes" {
    for_each = try(local.m045["attributes"], null) == null ? [] : local.m045["attributes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m045["parent"], null) == null ? [] : local.m045["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m045["permission_resources"], null) == null ? [] : local.m045["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m045["tags"], null) == null ? [] : local.m045["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m045["version_context"], null) == null ? [] : local.m045["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
