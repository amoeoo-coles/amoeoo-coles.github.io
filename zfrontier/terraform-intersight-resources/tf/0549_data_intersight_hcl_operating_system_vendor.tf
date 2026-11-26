# Sample data source intersight_hcl_operating_system_vendor — reads ../models/data_intersight_hcl_operating_system_vendor.yml
locals { m549 = yamldecode(file("${path.module}/../models/data_intersight_hcl_operating_system_vendor.yml"))["data_intersight_hcl_operating_system_vendor"] }

data "intersight_hcl_operating_system_vendor" "n549" {
  account_moid = try(local.m549["account_moid"], null)
  additional_properties = try(local.m549["additional_properties"], null)
  class_id = try(local.m549["class_id"], null)
  create_time = try(local.m549["create_time"], null)
  domain_group_moid = try(local.m549["domain_group_moid"], null)
  id = try(local.m549["id"], null)
  mod_time = try(local.m549["mod_time"], null)
  moid = try(local.m549["moid"], null)
  name = try(local.m549["name"], null)
  object_type = try(local.m549["object_type"], null)
  owners = try(local.m549["owners"], null)
  results = try(local.m549["results"], null)
  shared_scope = try(local.m549["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m549["ancestors"], null) == null ? [] : local.m549["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m549["parent"], null) == null ? [] : local.m549["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m549["permission_resources"], null) == null ? [] : local.m549["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m549["tags"], null) == null ? [] : local.m549["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m549["version_context"], null) == null ? [] : local.m549["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
