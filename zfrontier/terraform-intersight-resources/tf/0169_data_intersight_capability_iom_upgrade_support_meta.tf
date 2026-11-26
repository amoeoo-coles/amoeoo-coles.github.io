# Sample data source intersight_capability_iom_upgrade_support_meta — reads ../models/data_intersight_capability_iom_upgrade_support_meta.yml
locals { m169 = yamldecode(file("${path.module}/../models/data_intersight_capability_iom_upgrade_support_meta.yml"))["data_intersight_capability_iom_upgrade_support_meta"] }

data "intersight_capability_iom_upgrade_support_meta" "n169" {
  account_moid = try(local.m169["account_moid"], null)
  additional_properties = try(local.m169["additional_properties"], null)
  class_id = try(local.m169["class_id"], null)
  create_time = try(local.m169["create_time"], null)
  description = try(local.m169["description"], null)
  direct_upgrade = try(local.m169["direct_upgrade"], null)
  domain_group_moid = try(local.m169["domain_group_moid"], null)
  id = try(local.m169["id"], null)
  mod_time = try(local.m169["mod_time"], null)
  moid = try(local.m169["moid"], null)
  name = try(local.m169["name"], null)
  object_type = try(local.m169["object_type"], null)
  owners = try(local.m169["owners"], null)
  results = try(local.m169["results"], null)
  series_id = try(local.m169["series_id"], null)
  shared_scope = try(local.m169["shared_scope"], null)
  supported_models = try(local.m169["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m169["ancestors"], null) == null ? [] : local.m169["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m169["parent"], null) == null ? [] : local.m169["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m169["permission_resources"], null) == null ? [] : local.m169["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m169["tags"], null) == null ? [] : local.m169["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m169["version_context"], null) == null ? [] : local.m169["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
