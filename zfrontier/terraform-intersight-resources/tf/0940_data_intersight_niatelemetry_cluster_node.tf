# Sample data source intersight_niatelemetry_cluster_node — reads ../models/data_intersight_niatelemetry_cluster_node.yml
locals { m940 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_cluster_node.yml"))["data_intersight_niatelemetry_cluster_node"] }

data "intersight_niatelemetry_cluster_node" "n940" {
  account_moid = try(local.m940["account_moid"], null)
  additional_properties = try(local.m940["additional_properties"], null)
  boot_time = try(local.m940["boot_time"], null)
  class_id = try(local.m940["class_id"], null)
  cluster_name = try(local.m940["cluster_name"], null)
  cpu_utilization = try(local.m940["cpu_utilization"], null)
  create_time = try(local.m940["create_time"], null)
  domain_group_moid = try(local.m940["domain_group_moid"], null)
  firmware_version = try(local.m940["firmware_version"], null)
  id = try(local.m940["id"], null)
  management_ip = try(local.m940["management_ip"], null)
  memory_utilization = try(local.m940["memory_utilization"], null)
  mod_time = try(local.m940["mod_time"], null)
  model = try(local.m940["model"], null)
  moid = try(local.m940["moid"], null)
  name = try(local.m940["name"], null)
  object_type = try(local.m940["object_type"], null)
  owners = try(local.m940["owners"], null)
  platform_type = try(local.m940["platform_type"], null)
  results = try(local.m940["results"], null)
  role = try(local.m940["role"], null)
  serial_number = try(local.m940["serial_number"], null)
  shared_scope = try(local.m940["shared_scope"], null)
  status = try(local.m940["status"], null)
  storage_utilization = try(local.m940["storage_utilization"], null)
  dynamic "ancestors" {
    for_each = try(local.m940["ancestors"], null) == null ? [] : local.m940["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m940["cluster"], null) == null ? [] : local.m940["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m940["parent"], null) == null ? [] : local.m940["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m940["permission_resources"], null) == null ? [] : local.m940["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m940["tags"], null) == null ? [] : local.m940["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m940["version_context"], null) == null ? [] : local.m940["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
