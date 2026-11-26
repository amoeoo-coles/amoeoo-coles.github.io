# Sample data source intersight_capability_server_upgrade_support_meta — reads ../models/data_intersight_capability_server_upgrade_support_meta.yml
locals { m182 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_upgrade_support_meta.yml"))["data_intersight_capability_server_upgrade_support_meta"] }

data "intersight_capability_server_upgrade_support_meta" "n182" {
  account_moid = try(local.m182["account_moid"], null)
  additional_properties = try(local.m182["additional_properties"], null)
  class_id = try(local.m182["class_id"], null)
  create_time = try(local.m182["create_time"], null)
  description = try(local.m182["description"], null)
  domain_group_moid = try(local.m182["domain_group_moid"], null)
  id = try(local.m182["id"], null)
  mod_time = try(local.m182["mod_time"], null)
  moid = try(local.m182["moid"], null)
  name = try(local.m182["name"], null)
  object_type = try(local.m182["object_type"], null)
  owners = try(local.m182["owners"], null)
  platform = try(local.m182["platform"], null)
  results = try(local.m182["results"], null)
  server_family = try(local.m182["server_family"], null)
  shared_scope = try(local.m182["shared_scope"], null)
  supported_models = try(local.m182["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m182["ancestors"], null) == null ? [] : local.m182["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m182["parent"], null) == null ? [] : local.m182["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m182["permission_resources"], null) == null ? [] : local.m182["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m182["tags"], null) == null ? [] : local.m182["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m182["version_context"], null) == null ? [] : local.m182["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
