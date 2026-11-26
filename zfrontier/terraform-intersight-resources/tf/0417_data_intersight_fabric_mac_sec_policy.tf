# Sample data source intersight_fabric_mac_sec_policy — reads ../models/data_intersight_fabric_mac_sec_policy.yml
locals { m417 = yamldecode(file("${path.module}/../models/data_intersight_fabric_mac_sec_policy.yml"))["data_intersight_fabric_mac_sec_policy"] }

data "intersight_fabric_mac_sec_policy" "n417" {
  account_moid = try(local.m417["account_moid"], null)
  additional_properties = try(local.m417["additional_properties"], null)
  cipher_suite = try(local.m417["cipher_suite"], null)
  class_id = try(local.m417["class_id"], null)
  confidentiality_offset = try(local.m417["confidentiality_offset"], null)
  create_time = try(local.m417["create_time"], null)
  description = try(local.m417["description"], null)
  domain_group_moid = try(local.m417["domain_group_moid"], null)
  id = try(local.m417["id"], null)
  include_icv_indicator = try(local.m417["include_icv_indicator"], null)
  key_server_priority = try(local.m417["key_server_priority"], null)
  mod_time = try(local.m417["mod_time"], null)
  moid = try(local.m417["moid"], null)
  name = try(local.m417["name"], null)
  object_type = try(local.m417["object_type"], null)
  owners = try(local.m417["owners"], null)
  replay_window_size = try(local.m417["replay_window_size"], null)
  results = try(local.m417["results"], null)
  sak_expiry_time = try(local.m417["sak_expiry_time"], null)
  security_policy = try(local.m417["security_policy"], null)
  shared_scope = try(local.m417["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m417["ancestors"], null) == null ? [] : local.m417["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fallback_key_chain" {
    for_each = try(local.m417["fallback_key_chain"], null) == null ? [] : local.m417["fallback_key_chain"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_sec_ea_pol" {
    for_each = try(local.m417["mac_sec_ea_pol"], null) == null ? [] : local.m417["mac_sec_ea_pol"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m417["organization"], null) == null ? [] : local.m417["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m417["parent"], null) == null ? [] : local.m417["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m417["permission_resources"], null) == null ? [] : local.m417["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "primary_key_chain" {
    for_each = try(local.m417["primary_key_chain"], null) == null ? [] : local.m417["primary_key_chain"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m417["tags"], null) == null ? [] : local.m417["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m417["version_context"], null) == null ? [] : local.m417["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
