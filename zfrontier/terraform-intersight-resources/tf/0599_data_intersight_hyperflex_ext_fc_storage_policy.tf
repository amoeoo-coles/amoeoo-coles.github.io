# Sample data source intersight_hyperflex_ext_fc_storage_policy — reads ../models/data_intersight_hyperflex_ext_fc_storage_policy.yml
locals { m599 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_ext_fc_storage_policy.yml"))["data_intersight_hyperflex_ext_fc_storage_policy"] }

data "intersight_hyperflex_ext_fc_storage_policy" "n599" {
  account_moid = try(local.m599["account_moid"], null)
  additional_properties = try(local.m599["additional_properties"], null)
  admin_state = try(local.m599["admin_state"], null)
  class_id = try(local.m599["class_id"], null)
  create_time = try(local.m599["create_time"], null)
  description = try(local.m599["description"], null)
  domain_group_moid = try(local.m599["domain_group_moid"], null)
  id = try(local.m599["id"], null)
  mod_time = try(local.m599["mod_time"], null)
  moid = try(local.m599["moid"], null)
  name = try(local.m599["name"], null)
  object_type = try(local.m599["object_type"], null)
  owners = try(local.m599["owners"], null)
  results = try(local.m599["results"], null)
  shared_scope = try(local.m599["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m599["ancestors"], null) == null ? [] : local.m599["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m599["cluster_profiles"], null) == null ? [] : local.m599["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exta_traffic" {
    for_each = try(local.m599["exta_traffic"], null) == null ? [] : local.m599["exta_traffic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "extb_traffic" {
    for_each = try(local.m599["extb_traffic"], null) == null ? [] : local.m599["extb_traffic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m599["organization"], null) == null ? [] : local.m599["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m599["parent"], null) == null ? [] : local.m599["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m599["permission_resources"], null) == null ? [] : local.m599["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m599["tags"], null) == null ? [] : local.m599["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m599["version_context"], null) == null ? [] : local.m599["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwxn_prefix_range" {
    for_each = try(local.m599["wwxn_prefix_range"], null) == null ? [] : local.m599["wwxn_prefix_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
