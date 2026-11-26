# Sample data source intersight_techsupportmanagement_tech_support_bundle — reads ../models/data_intersight_techsupportmanagement_tech_support_bundle.yml
locals { m1385 = yamldecode(file("${path.module}/../models/data_intersight_techsupportmanagement_tech_support_bundle.yml"))["data_intersight_techsupportmanagement_tech_support_bundle"] }

data "intersight_techsupportmanagement_tech_support_bundle" "n1385" {
  account_moid = try(local.m1385["account_moid"], null)
  additional_properties = try(local.m1385["additional_properties"], null)
  class_id = try(local.m1385["class_id"], null)
  create_time = try(local.m1385["create_time"], null)
  device_identifier = try(local.m1385["device_identifier"], null)
  device_type = try(local.m1385["device_type"], null)
  domain_group_moid = try(local.m1385["domain_group_moid"], null)
  id = try(local.m1385["id"], null)
  mod_time = try(local.m1385["mod_time"], null)
  moid = try(local.m1385["moid"], null)
  object_type = try(local.m1385["object_type"], null)
  owners = try(local.m1385["owners"], null)
  pid = try(local.m1385["pid"], null)
  platform_type = try(local.m1385["platform_type"], null)
  results = try(local.m1385["results"], null)
  serial = try(local.m1385["serial"], null)
  shared_scope = try(local.m1385["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1385["ancestors"], null) == null ? [] : local.m1385["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m1385["device_registration"], null) == null ? [] : local.m1385["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1385["parent"], null) == null ? [] : local.m1385["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1385["permission_resources"], null) == null ? [] : local.m1385["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "platform_param" {
    for_each = try(local.m1385["platform_param"], null) == null ? [] : local.m1385["platform_param"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1385["tags"], null) == null ? [] : local.m1385["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_resource" {
    for_each = try(local.m1385["target_resource"], null) == null ? [] : local.m1385["target_resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tech_support_status" {
    for_each = try(local.m1385["tech_support_status"], null) == null ? [] : local.m1385["tech_support_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1385["version_context"], null) == null ? [] : local.m1385["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
