# Sample data source intersight_access_policy — reads ../models/data_intersight_access_policy.yml
locals { m007 = yamldecode(file("${path.module}/../models/data_intersight_access_policy.yml"))["data_intersight_access_policy"] }

data "intersight_access_policy" "n007" {
  account_moid = try(local.m007["account_moid"], null)
  additional_properties = try(local.m007["additional_properties"], null)
  class_id = try(local.m007["class_id"], null)
  create_time = try(local.m007["create_time"], null)
  description = try(local.m007["description"], null)
  domain_group_moid = try(local.m007["domain_group_moid"], null)
  id = try(local.m007["id"], null)
  inband_vlan = try(local.m007["inband_vlan"], null)
  mod_time = try(local.m007["mod_time"], null)
  moid = try(local.m007["moid"], null)
  name = try(local.m007["name"], null)
  object_type = try(local.m007["object_type"], null)
  owners = try(local.m007["owners"], null)
  results = try(local.m007["results"], null)
  shared_scope = try(local.m007["shared_scope"], null)
  dynamic "address_type" {
    for_each = try(local.m007["address_type"], null) == null ? [] : local.m007["address_type"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m007["ancestors"], null) == null ? [] : local.m007["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "configuration_type" {
    for_each = try(local.m007["configuration_type"], null) == null ? [] : local.m007["configuration_type"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inband_ip_pool" {
    for_each = try(local.m007["inband_ip_pool"], null) == null ? [] : local.m007["inband_ip_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inband_vrf" {
    for_each = try(local.m007["inband_vrf"], null) == null ? [] : local.m007["inband_vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m007["organization"], null) == null ? [] : local.m007["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "out_of_band_ip_pool" {
    for_each = try(local.m007["out_of_band_ip_pool"], null) == null ? [] : local.m007["out_of_band_ip_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "out_of_band_vrf" {
    for_each = try(local.m007["out_of_band_vrf"], null) == null ? [] : local.m007["out_of_band_vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m007["parent"], null) == null ? [] : local.m007["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m007["permission_resources"], null) == null ? [] : local.m007["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m007["profiles"], null) == null ? [] : local.m007["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m007["tags"], null) == null ? [] : local.m007["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m007["version_context"], null) == null ? [] : local.m007["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
