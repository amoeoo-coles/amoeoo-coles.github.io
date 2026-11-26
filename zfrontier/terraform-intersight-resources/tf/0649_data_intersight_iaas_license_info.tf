# Sample data source intersight_iaas_license_info — reads ../models/data_intersight_iaas_license_info.yml
locals { m649 = yamldecode(file("${path.module}/../models/data_intersight_iaas_license_info.yml"))["data_intersight_iaas_license_info"] }

data "intersight_iaas_license_info" "n649" {
  account_moid = try(local.m649["account_moid"], null)
  additional_properties = try(local.m649["additional_properties"], null)
  class_id = try(local.m649["class_id"], null)
  create_time = try(local.m649["create_time"], null)
  domain_group_moid = try(local.m649["domain_group_moid"], null)
  id = try(local.m649["id"], null)
  license_expiration_date = try(local.m649["license_expiration_date"], null)
  license_type = try(local.m649["license_type"], null)
  mod_time = try(local.m649["mod_time"], null)
  moid = try(local.m649["moid"], null)
  object_type = try(local.m649["object_type"], null)
  owners = try(local.m649["owners"], null)
  results = try(local.m649["results"], null)
  shared_scope = try(local.m649["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m649["ancestors"], null) == null ? [] : local.m649["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m649["guid"], null) == null ? [] : local.m649["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_keys_info" {
    for_each = try(local.m649["license_keys_info"], null) == null ? [] : local.m649["license_keys_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_utilization_info" {
    for_each = try(local.m649["license_utilization_info"], null) == null ? [] : local.m649["license_utilization_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m649["parent"], null) == null ? [] : local.m649["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m649["permission_resources"], null) == null ? [] : local.m649["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m649["tags"], null) == null ? [] : local.m649["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m649["version_context"], null) == null ? [] : local.m649["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
