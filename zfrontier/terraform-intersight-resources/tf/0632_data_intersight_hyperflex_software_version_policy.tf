# Sample data source intersight_hyperflex_software_version_policy — reads ../models/data_intersight_hyperflex_software_version_policy.yml
locals { m632 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_software_version_policy.yml"))["data_intersight_hyperflex_software_version_policy"] }

data "intersight_hyperflex_software_version_policy" "n632" {
  account_moid = try(local.m632["account_moid"], null)
  additional_properties = try(local.m632["additional_properties"], null)
  class_id = try(local.m632["class_id"], null)
  create_time = try(local.m632["create_time"], null)
  description = try(local.m632["description"], null)
  domain_group_moid = try(local.m632["domain_group_moid"], null)
  hxdp_version = try(local.m632["hxdp_version"], null)
  hypervisor_version = try(local.m632["hypervisor_version"], null)
  id = try(local.m632["id"], null)
  mod_time = try(local.m632["mod_time"], null)
  moid = try(local.m632["moid"], null)
  name = try(local.m632["name"], null)
  object_type = try(local.m632["object_type"], null)
  owners = try(local.m632["owners"], null)
  results = try(local.m632["results"], null)
  server_firmware_version = try(local.m632["server_firmware_version"], null)
  shared_scope = try(local.m632["shared_scope"], null)
  upgrade_types = try(local.m632["upgrade_types"], null)
  dynamic "ancestors" {
    for_each = try(local.m632["ancestors"], null) == null ? [] : local.m632["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m632["cluster_profiles"], null) == null ? [] : local.m632["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hxdp_version_info" {
    for_each = try(local.m632["hxdp_version_info"], null) == null ? [] : local.m632["hxdp_version_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hypervisor_version_info" {
    for_each = try(local.m632["hypervisor_version_info"], null) == null ? [] : local.m632["hypervisor_version_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m632["organization"], null) == null ? [] : local.m632["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m632["parent"], null) == null ? [] : local.m632["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m632["permission_resources"], null) == null ? [] : local.m632["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_firmware_version_info" {
    for_each = try(local.m632["server_firmware_version_info"], null) == null ? [] : local.m632["server_firmware_version_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_firmware_versions" {
    for_each = try(local.m632["server_firmware_versions"], null) == null ? [] : local.m632["server_firmware_versions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m632["tags"], null) == null ? [] : local.m632["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m632["version_context"], null) == null ? [] : local.m632["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
