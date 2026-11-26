# Sample data source intersight_iam_idp — reads ../models/data_intersight_iam_idp.yml
locals { m707 = yamldecode(file("${path.module}/../models/data_intersight_iam_idp.yml"))["data_intersight_iam_idp"] }

data "intersight_iam_idp" "n707" {
  account_moid = try(local.m707["account_moid"], null)
  additional_properties = try(local.m707["additional_properties"], null)
  certificate_expiry_time = try(local.m707["certificate_expiry_time"], null)
  class_id = try(local.m707["class_id"], null)
  create_time = try(local.m707["create_time"], null)
  domain_group_moid = try(local.m707["domain_group_moid"], null)
  domain_name = try(local.m707["domain_name"], null)
  domain_names = try(local.m707["domain_names"], null)
  enable_single_logout = try(local.m707["enable_single_logout"], null)
  id = try(local.m707["id"], null)
  idp_entity_id = try(local.m707["idp_entity_id"], null)
  idp_metadata_expiry_state = try(local.m707["idp_metadata_expiry_state"], null)
  metadata = try(local.m707["metadata"], null)
  mod_time = try(local.m707["mod_time"], null)
  moid = try(local.m707["moid"], null)
  name = try(local.m707["name"], null)
  object_type = try(local.m707["object_type"], null)
  owners = try(local.m707["owners"], null)
  results = try(local.m707["results"], null)
  shared_scope = try(local.m707["shared_scope"], null)
  skip_warning = try(local.m707["skip_warning"], null)
  sp_cert_rotated = try(local.m707["sp_cert_rotated"], null)
  sp_metadata_expiry_state = try(local.m707["sp_metadata_expiry_state"], null)
  sp_metadata_hash_method = try(local.m707["sp_metadata_hash_method"], null)
  sp_metadata_hash_method_configured = try(local.m707["sp_metadata_hash_method_configured"], null)
  type = try(local.m707["type"], null)
  dynamic "account" {
    for_each = try(local.m707["account"], null) == null ? [] : local.m707["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m707["ancestors"], null) == null ? [] : local.m707["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_meta" {
    for_each = try(local.m707["ldap_meta"], null) == null ? [] : local.m707["ldap_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_policy" {
    for_each = try(local.m707["ldap_policy"], null) == null ? [] : local.m707["ldap_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m707["parent"], null) == null ? [] : local.m707["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m707["permission_resources"], null) == null ? [] : local.m707["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m707["system"], null) == null ? [] : local.m707["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m707["tags"], null) == null ? [] : local.m707["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "test_idp" {
    for_each = try(local.m707["test_idp"], null) == null ? [] : local.m707["test_idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_preferences" {
    for_each = try(local.m707["user_preferences"], null) == null ? [] : local.m707["user_preferences"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_settings" {
    for_each = try(local.m707["user_settings"], null) == null ? [] : local.m707["user_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usergroups" {
    for_each = try(local.m707["usergroups"], null) == null ? [] : local.m707["usergroups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "users" {
    for_each = try(local.m707["users"], null) == null ? [] : local.m707["users"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m707["version_context"], null) == null ? [] : local.m707["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
