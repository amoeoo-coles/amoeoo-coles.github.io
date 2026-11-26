# Sample data source intersight_storage_pure_smb_policy_rule — reads ../models/data_intersight_storage_pure_smb_policy_rule.yml
locals { m1340 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_smb_policy_rule.yml"))["data_intersight_storage_pure_smb_policy_rule"] }

data "intersight_storage_pure_smb_policy_rule" "n1340" {
  account_moid = try(local.m1340["account_moid"], null)
  additional_properties = try(local.m1340["additional_properties"], null)
  anonymous_access_allowed = try(local.m1340["anonymous_access_allowed"], null)
  class_id = try(local.m1340["class_id"], null)
  client_name = try(local.m1340["client_name"], null)
  create_time = try(local.m1340["create_time"], null)
  destroyed = try(local.m1340["destroyed"], null)
  domain_group_moid = try(local.m1340["domain_group_moid"], null)
  id = try(local.m1340["id"], null)
  mod_time = try(local.m1340["mod_time"], null)
  moid = try(local.m1340["moid"], null)
  name = try(local.m1340["name"], null)
  object_type = try(local.m1340["object_type"], null)
  owners = try(local.m1340["owners"], null)
  policy_name = try(local.m1340["policy_name"], null)
  results = try(local.m1340["results"], null)
  shared_scope = try(local.m1340["shared_scope"], null)
  smb_encryption_required = try(local.m1340["smb_encryption_required"], null)
  dynamic "ancestors" {
    for_each = try(local.m1340["ancestors"], null) == null ? [] : local.m1340["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1340["array"], null) == null ? [] : local.m1340["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1340["parent"], null) == null ? [] : local.m1340["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1340["permission_resources"], null) == null ? [] : local.m1340["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1340["policy"], null) == null ? [] : local.m1340["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1340["registered_device"], null) == null ? [] : local.m1340["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1340["tags"], null) == null ? [] : local.m1340["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1340["version_context"], null) == null ? [] : local.m1340["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
