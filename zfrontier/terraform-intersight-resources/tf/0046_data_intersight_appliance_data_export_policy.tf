# Sample data source intersight_appliance_data_export_policy — reads ../models/data_intersight_appliance_data_export_policy.yml
locals { m046 = yamldecode(file("${path.module}/../models/data_intersight_appliance_data_export_policy.yml"))["data_intersight_appliance_data_export_policy"] }

data "intersight_appliance_data_export_policy" "n046" {
  account_moid = try(local.m046["account_moid"], null)
  additional_properties = try(local.m046["additional_properties"], null)
  class_id = try(local.m046["class_id"], null)
  create_time = try(local.m046["create_time"], null)
  domain_group_moid = try(local.m046["domain_group_moid"], null)
  enable = try(local.m046["enable"], null)
  id = try(local.m046["id"], null)
  mod_time = try(local.m046["mod_time"], null)
  moid = try(local.m046["moid"], null)
  name = try(local.m046["name"], null)
  object_type = try(local.m046["object_type"], null)
  owners = try(local.m046["owners"], null)
  results = try(local.m046["results"], null)
  shared_scope = try(local.m046["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m046["account"], null) == null ? [] : local.m046["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m046["ancestors"], null) == null ? [] : local.m046["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m046["parent"], null) == null ? [] : local.m046["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_config" {
    for_each = try(local.m046["parent_config"], null) == null ? [] : local.m046["parent_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m046["permission_resources"], null) == null ? [] : local.m046["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sub_configs" {
    for_each = try(local.m046["sub_configs"], null) == null ? [] : local.m046["sub_configs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m046["tags"], null) == null ? [] : local.m046["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m046["version_context"], null) == null ? [] : local.m046["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
