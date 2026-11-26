# Sample data source intersight_hyperflex_local_credential_policy — reads ../models/data_intersight_hyperflex_local_credential_policy.yml
locals { m617 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_local_credential_policy.yml"))["data_intersight_hyperflex_local_credential_policy"] }

data "intersight_hyperflex_local_credential_policy" "n617" {
  account_moid = try(local.m617["account_moid"], null)
  additional_properties = try(local.m617["additional_properties"], null)
  class_id = try(local.m617["class_id"], null)
  create_time = try(local.m617["create_time"], null)
  description = try(local.m617["description"], null)
  domain_group_moid = try(local.m617["domain_group_moid"], null)
  factory_hypervisor_password = try(var.secrets["data_intersight_hyperflex_local_credential_policy.factory_hypervisor_password"], local.m617["factory_hypervisor_password"])
  hxdp_root_pwd = try(local.m617["hxdp_root_pwd"], null)
  hypervisor_admin = try(local.m617["hypervisor_admin"], null)
  hypervisor_admin_pwd = try(local.m617["hypervisor_admin_pwd"], null)
  id = try(local.m617["id"], null)
  is_deployment_private_key_set = try(var.secrets["data_intersight_hyperflex_local_credential_policy.is_deployment_private_key_set"], local.m617["is_deployment_private_key_set"])
  is_hxdp_root_pwd_set = try(local.m617["is_hxdp_root_pwd_set"], null)
  is_hypervisor_admin_pwd_set = try(local.m617["is_hypervisor_admin_pwd_set"], null)
  mod_time = try(local.m617["mod_time"], null)
  moid = try(local.m617["moid"], null)
  name = try(local.m617["name"], null)
  object_type = try(local.m617["object_type"], null)
  owners = try(local.m617["owners"], null)
  results = try(local.m617["results"], null)
  shared_scope = try(local.m617["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m617["ancestors"], null) == null ? [] : local.m617["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m617["cluster_profiles"], null) == null ? [] : local.m617["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m617["organization"], null) == null ? [] : local.m617["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m617["parent"], null) == null ? [] : local.m617["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m617["permission_resources"], null) == null ? [] : local.m617["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m617["tags"], null) == null ? [] : local.m617["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m617["version_context"], null) == null ? [] : local.m617["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
