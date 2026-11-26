# Sample data source intersight_niatelemetry_lc — reads ../models/data_intersight_niatelemetry_lc.yml
locals { m965 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_lc.yml"))["data_intersight_niatelemetry_lc"] }

data "intersight_niatelemetry_lc" "n965" {
  account_moid = try(local.m965["account_moid"], null)
  additional_properties = try(local.m965["additional_properties"], null)
  class_id = try(local.m965["class_id"], null)
  create_time = try(local.m965["create_time"], null)
  description = try(local.m965["description"], null)
  dn = try(local.m965["dn"], null)
  domain_group_moid = try(local.m965["domain_group_moid"], null)
  hardware_version = try(local.m965["hardware_version"], null)
  id = try(local.m965["id"], null)
  mod_time = try(local.m965["mod_time"], null)
  model = try(local.m965["model"], null)
  moid = try(local.m965["moid"], null)
  node_id = try(local.m965["node_id"], null)
  object_type = try(local.m965["object_type"], null)
  operational_state = try(local.m965["operational_state"], null)
  owners = try(local.m965["owners"], null)
  power_state = try(local.m965["power_state"], null)
  record_type = try(local.m965["record_type"], null)
  record_version = try(local.m965["record_version"], null)
  redundancy_state = try(local.m965["redundancy_state"], null)
  results = try(local.m965["results"], null)
  serial_number = try(local.m965["serial_number"], null)
  shared_scope = try(local.m965["shared_scope"], null)
  site_name = try(local.m965["site_name"], null)
  vid = try(local.m965["vid"], null)
  dynamic "ancestors" {
    for_each = try(local.m965["ancestors"], null) == null ? [] : local.m965["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m965["parent"], null) == null ? [] : local.m965["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m965["permission_resources"], null) == null ? [] : local.m965["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m965["registered_device"], null) == null ? [] : local.m965["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m965["tags"], null) == null ? [] : local.m965["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m965["version_context"], null) == null ? [] : local.m965["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
