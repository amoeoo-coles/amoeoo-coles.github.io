# Sample data source intersight_capability_adapter_upgrade_support_meta — reads ../models/data_intersight_capability_adapter_upgrade_support_meta.yml
locals { m145 = yamldecode(file("${path.module}/../models/data_intersight_capability_adapter_upgrade_support_meta.yml"))["data_intersight_capability_adapter_upgrade_support_meta"] }

data "intersight_capability_adapter_upgrade_support_meta" "n145" {
  account_moid = try(local.m145["account_moid"], null)
  additional_properties = try(local.m145["additional_properties"], null)
  class_id = try(local.m145["class_id"], null)
  create_time = try(local.m145["create_time"], null)
  description = try(local.m145["description"], null)
  domain_group_moid = try(local.m145["domain_group_moid"], null)
  id = try(local.m145["id"], null)
  mod_time = try(local.m145["mod_time"], null)
  moid = try(local.m145["moid"], null)
  name = try(local.m145["name"], null)
  object_type = try(local.m145["object_type"], null)
  owners = try(local.m145["owners"], null)
  results = try(local.m145["results"], null)
  series_id = try(local.m145["series_id"], null)
  shared_scope = try(local.m145["shared_scope"], null)
  supported_models = try(local.m145["supported_models"], null)
  dynamic "ancestors" {
    for_each = try(local.m145["ancestors"], null) == null ? [] : local.m145["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m145["parent"], null) == null ? [] : local.m145["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m145["permission_resources"], null) == null ? [] : local.m145["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m145["tags"], null) == null ? [] : local.m145["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m145["version_context"], null) == null ? [] : local.m145["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
