# Sample data source intersight_hcl_hyperflex_software_compatibility_info — reads ../models/data_intersight_hcl_hyperflex_software_compatibility_info.yml
locals { m547 = yamldecode(file("${path.module}/../models/data_intersight_hcl_hyperflex_software_compatibility_info.yml"))["data_intersight_hcl_hyperflex_software_compatibility_info"] }

data "intersight_hcl_hyperflex_software_compatibility_info" "n547" {
  account_moid = try(local.m547["account_moid"], null)
  additional_properties = try(local.m547["additional_properties"], null)
  class_id = try(local.m547["class_id"], null)
  create_time = try(local.m547["create_time"], null)
  domain_group_moid = try(local.m547["domain_group_moid"], null)
  hxdp_version = try(local.m547["hxdp_version"], null)
  hypervisor_type = try(local.m547["hypervisor_type"], null)
  hypervisor_version = try(local.m547["hypervisor_version"], null)
  id = try(local.m547["id"], null)
  is_mgmt_build = try(local.m547["is_mgmt_build"], null)
  max_mgmt_version = try(local.m547["max_mgmt_version"], null)
  min_mgmt_version = try(local.m547["min_mgmt_version"], null)
  mod_time = try(local.m547["mod_time"], null)
  moid = try(local.m547["moid"], null)
  object_type = try(local.m547["object_type"], null)
  owners = try(local.m547["owners"], null)
  results = try(local.m547["results"], null)
  server_fw_version = try(local.m547["server_fw_version"], null)
  shared_scope = try(local.m547["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m547["ancestors"], null) == null ? [] : local.m547["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m547["app_catalog"], null) == null ? [] : local.m547["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraints" {
    for_each = try(local.m547["constraints"], null) == null ? [] : local.m547["constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m547["parent"], null) == null ? [] : local.m547["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m547["permission_resources"], null) == null ? [] : local.m547["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m547["tags"], null) == null ? [] : local.m547["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m547["version_context"], null) == null ? [] : local.m547["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
