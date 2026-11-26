# Sample data source intersight_capability_chassis_upgrade_support_meta — reads ../models/data_intersight_capability_chassis_upgrade_support_meta.yml
locals { m150 = yamldecode(file("${path.module}/../models/data_intersight_capability_chassis_upgrade_support_meta.yml"))["data_intersight_capability_chassis_upgrade_support_meta"] }

data "intersight_capability_chassis_upgrade_support_meta" "n150" {
  account_moid = try(local.m150["account_moid"], null)
  adapters_upgraded_via_hsu = try(local.m150["adapters_upgraded_via_hsu"], null)
  additional_properties = try(local.m150["additional_properties"], null)
  class_id = try(local.m150["class_id"], null)
  create_time = try(local.m150["create_time"], null)
  description = try(local.m150["description"], null)
  domain_group_moid = try(local.m150["domain_group_moid"], null)
  id = try(local.m150["id"], null)
  mod_time = try(local.m150["mod_time"], null)
  moid = try(local.m150["moid"], null)
  name = try(local.m150["name"], null)
  object_type = try(local.m150["object_type"], null)
  owners = try(local.m150["owners"], null)
  results = try(local.m150["results"], null)
  series_id = try(local.m150["series_id"], null)
  shared_scope = try(local.m150["shared_scope"], null)
  supported_models = try(local.m150["supported_models"], null)
  supported_psu_models = try(local.m150["supported_psu_models"], null)
  supported_xfm_models = try(local.m150["supported_xfm_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m150["ancestors"], null) == null ? [] : local.m150["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m150["parent"], null) == null ? [] : local.m150["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m150["permission_resources"], null) == null ? [] : local.m150["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m150["tags"], null) == null ? [] : local.m150["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m150["version_context"], null) == null ? [] : local.m150["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
