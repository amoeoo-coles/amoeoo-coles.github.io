# Sample data source intersight_fabric_switch_cluster_profile_template — reads ../models/data_intersight_fabric_switch_cluster_profile_template.yml
locals { m440 = yamldecode(file("${path.module}/../models/data_intersight_fabric_switch_cluster_profile_template.yml"))["data_intersight_fabric_switch_cluster_profile_template"] }

data "intersight_fabric_switch_cluster_profile_template" "n440" {
  account_moid = try(local.m440["account_moid"], null)
  additional_properties = try(local.m440["additional_properties"], null)
  class_id = try(local.m440["class_id"], null)
  create_time = try(local.m440["create_time"], null)
  description = try(local.m440["description"], null)
  domain_group_moid = try(local.m440["domain_group_moid"], null)
  enable_override = try(local.m440["enable_override"], null)
  id = try(local.m440["id"], null)
  mod_time = try(local.m440["mod_time"], null)
  moid = try(local.m440["moid"], null)
  name = try(local.m440["name"], null)
  object_type = try(local.m440["object_type"], null)
  owners = try(local.m440["owners"], null)
  results = try(local.m440["results"], null)
  shared_scope = try(local.m440["shared_scope"], null)
  switch_profiles_count = try(local.m440["switch_profiles_count"], null)
  target_platform = try(local.m440["target_platform"], null)
  type = try(local.m440["type"], null)
  update_status = try(local.m440["update_status"], null)
  usage = try(local.m440["usage"], null)
  usage_count = try(local.m440["usage_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m440["ancestors"], null) == null ? [] : local.m440["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m440["organization"], null) == null ? [] : local.m440["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m440["parent"], null) == null ? [] : local.m440["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m440["permission_resources"], null) == null ? [] : local.m440["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "src_template" {
    for_each = try(local.m440["src_template"], null) == null ? [] : local.m440["src_template"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_profile_templates" {
    for_each = try(local.m440["switch_profile_templates"], null) == null ? [] : local.m440["switch_profile_templates"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m440["tags"], null) == null ? [] : local.m440["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "template_actions" {
    for_each = try(local.m440["template_actions"], null) == null ? [] : local.m440["template_actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m440["version_context"], null) == null ? [] : local.m440["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
