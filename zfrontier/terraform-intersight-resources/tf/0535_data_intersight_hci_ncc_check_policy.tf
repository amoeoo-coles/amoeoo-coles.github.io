# Sample data source intersight_hci_ncc_check_policy — reads ../models/data_intersight_hci_ncc_check_policy.yml
locals { m535 = yamldecode(file("${path.module}/../models/data_intersight_hci_ncc_check_policy.yml"))["data_intersight_hci_ncc_check_policy"] }

data "intersight_hci_ncc_check_policy" "n535" {
  account_moid = try(local.m535["account_moid"], null)
  additional_properties = try(local.m535["additional_properties"], null)
  class_id = try(local.m535["class_id"], null)
  classifications = try(local.m535["classifications"], null)
  create_time = try(local.m535["create_time"], null)
  description = try(local.m535["description"], null)
  domain_group_moid = try(local.m535["domain_group_moid"], null)
  entity_type = try(local.m535["entity_type"], null)
  id = try(local.m535["id"], null)
  impact_type = try(local.m535["impact_type"], null)
  kb_articles = try(local.m535["kb_articles"], null)
  mod_time = try(local.m535["mod_time"], null)
  moid = try(local.m535["moid"], null)
  name = try(local.m535["name"], null)
  ncc_policy_ext_id = try(local.m535["ncc_policy_ext_id"], null)
  object_type = try(local.m535["object_type"], null)
  owners = try(local.m535["owners"], null)
  pc_ext_id = try(local.m535["pc_ext_id"], null)
  policy_id = try(local.m535["policy_id"], null)
  publisher = try(local.m535["publisher"], null)
  results = try(local.m535["results"], null)
  scope = try(local.m535["scope"], null)
  shared_scope = try(local.m535["shared_scope"], null)
  sub_type = try(local.m535["sub_type"], null)
  target_clusters = try(local.m535["target_clusters"], null)
  title = try(local.m535["title"], null)
  type = try(local.m535["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m535["ancestors"], null) == null ? [] : local.m535["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_configs" {
    for_each = try(local.m535["cluster_configs"], null) == null ? [] : local.m535["cluster_configs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "domain_manager" {
    for_each = try(local.m535["domain_manager"], null) == null ? [] : local.m535["domain_manager"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m535["parent"], null) == null ? [] : local.m535["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m535["permission_resources"], null) == null ? [] : local.m535["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m535["registered_device"], null) == null ? [] : local.m535["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m535["tags"], null) == null ? [] : local.m535["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m535["version_context"], null) == null ? [] : local.m535["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
