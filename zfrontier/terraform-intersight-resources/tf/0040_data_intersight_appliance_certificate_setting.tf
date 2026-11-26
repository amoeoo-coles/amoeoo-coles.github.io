# Sample data source intersight_appliance_certificate_setting — reads ../models/data_intersight_appliance_certificate_setting.yml
locals { m040 = yamldecode(file("${path.module}/../models/data_intersight_appliance_certificate_setting.yml"))["data_intersight_appliance_certificate_setting"] }

data "intersight_appliance_certificate_setting" "n040" {
  account_moid = try(local.m040["account_moid"], null)
  additional_properties = try(local.m040["additional_properties"], null)
  class_id = try(local.m040["class_id"], null)
  create_time = try(local.m040["create_time"], null)
  domain_group_moid = try(local.m040["domain_group_moid"], null)
  id = try(local.m040["id"], null)
  mod_time = try(local.m040["mod_time"], null)
  moid = try(local.m040["moid"], null)
  object_type = try(local.m040["object_type"], null)
  owners = try(local.m040["owners"], null)
  results = try(local.m040["results"], null)
  shared_scope = try(local.m040["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m040["account"], null) == null ? [] : local.m040["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m040["ancestors"], null) == null ? [] : local.m040["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m040["certificate"], null) == null ? [] : local.m040["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m040["parent"], null) == null ? [] : local.m040["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m040["permission_resources"], null) == null ? [] : local.m040["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m040["tags"], null) == null ? [] : local.m040["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m040["version_context"], null) == null ? [] : local.m040["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
