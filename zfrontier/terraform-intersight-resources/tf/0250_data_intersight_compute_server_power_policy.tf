# Sample data source intersight_compute_server_power_policy — reads ../models/data_intersight_compute_server_power_policy.yml
locals { m250 = yamldecode(file("${path.module}/../models/data_intersight_compute_server_power_policy.yml"))["data_intersight_compute_server_power_policy"] }

data "intersight_compute_server_power_policy" "n250" {
  account_moid = try(local.m250["account_moid"], null)
  additional_properties = try(local.m250["additional_properties"], null)
  class_id = try(local.m250["class_id"], null)
  create_time = try(local.m250["create_time"], null)
  description = try(local.m250["description"], null)
  domain_group_moid = try(local.m250["domain_group_moid"], null)
  id = try(local.m250["id"], null)
  mod_time = try(local.m250["mod_time"], null)
  moid = try(local.m250["moid"], null)
  name = try(local.m250["name"], null)
  object_type = try(local.m250["object_type"], null)
  owners = try(local.m250["owners"], null)
  power_state = try(local.m250["power_state"], null)
  results = try(local.m250["results"], null)
  server_name = try(local.m250["server_name"], null)
  shared_scope = try(local.m250["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m250["ancestors"], null) == null ? [] : local.m250["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m250["organization"], null) == null ? [] : local.m250["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m250["parent"], null) == null ? [] : local.m250["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m250["permission_resources"], null) == null ? [] : local.m250["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m250["profiles"], null) == null ? [] : local.m250["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m250["registered_device"], null) == null ? [] : local.m250["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m250["server"], null) == null ? [] : local.m250["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m250["tags"], null) == null ? [] : local.m250["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m250["version_context"], null) == null ? [] : local.m250["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
