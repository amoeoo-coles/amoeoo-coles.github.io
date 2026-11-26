# Sample data source intersight_capability_fex_capability_def — reads ../models/data_intersight_capability_fex_capability_def.yml
locals { m160 = yamldecode(file("${path.module}/../models/data_intersight_capability_fex_capability_def.yml"))["data_intersight_capability_fex_capability_def"] }

data "intersight_capability_fex_capability_def" "n160" {
  account_moid = try(local.m160["account_moid"], null)
  additional_properties = try(local.m160["additional_properties"], null)
  class_id = try(local.m160["class_id"], null)
  create_time = try(local.m160["create_time"], null)
  domain_group_moid = try(local.m160["domain_group_moid"], null)
  fec_config_on_hif_port_supported = try(local.m160["fec_config_on_hif_port_supported"], null)
  id = try(local.m160["id"], null)
  mod_time = try(local.m160["mod_time"], null)
  moid = try(local.m160["moid"], null)
  name = try(local.m160["name"], null)
  object_type = try(local.m160["object_type"], null)
  owners = try(local.m160["owners"], null)
  results = try(local.m160["results"], null)
  shared_scope = try(local.m160["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m160["ancestors"], null) == null ? [] : local.m160["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m160["parent"], null) == null ? [] : local.m160["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m160["permission_resources"], null) == null ? [] : local.m160["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m160["tags"], null) == null ? [] : local.m160["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m160["version_context"], null) == null ? [] : local.m160["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
