# Sample data source intersight_hyperflex_key_encryption_key — reads ../models/data_intersight_hyperflex_key_encryption_key.yml
locals { m615 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_key_encryption_key.yml"))["data_intersight_hyperflex_key_encryption_key"] }

data "intersight_hyperflex_key_encryption_key" "n615" {
  account_moid = try(local.m615["account_moid"], null)
  additional_properties = try(local.m615["additional_properties"], null)
  class_id = try(local.m615["class_id"], null)
  create_time = try(local.m615["create_time"], null)
  domain_group_moid = try(local.m615["domain_group_moid"], null)
  id = try(local.m615["id"], null)
  is_account_recovery = try(local.m615["is_account_recovery"], null)
  is_kek_set = try(local.m615["is_kek_set"], null)
  is_passphrase_set = try(var.secrets["data_intersight_hyperflex_key_encryption_key.is_passphrase_set"], local.m615["is_passphrase_set"])
  iteration = try(local.m615["iteration"], null)
  kek = try(local.m615["kek"], null)
  key_id = try(local.m615["key_id"], null)
  key_state = try(local.m615["key_state"], null)
  mod_time = try(local.m615["mod_time"], null)
  moid = try(local.m615["moid"], null)
  object_type = try(local.m615["object_type"], null)
  owners = try(local.m615["owners"], null)
  passphrase = try(var.secrets["data_intersight_hyperflex_key_encryption_key.passphrase"], local.m615["passphrase"])
  resource_type = try(local.m615["resource_type"], null)
  results = try(local.m615["results"], null)
  shared_scope = try(local.m615["shared_scope"], null)
  transit_kek = try(local.m615["transit_kek"], null)
  dynamic "ancestors" {
    for_each = try(local.m615["ancestors"], null) == null ? [] : local.m615["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profile" {
    for_each = try(local.m615["cluster_profile"], null) == null ? [] : local.m615["cluster_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m615["parent"], null) == null ? [] : local.m615["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m615["permission_resources"], null) == null ? [] : local.m615["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_mo" {
    for_each = try(local.m615["resource_mo"], null) == null ? [] : local.m615["resource_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m615["tags"], null) == null ? [] : local.m615["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m615["version_context"], null) == null ? [] : local.m615["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
