# Sample data source intersight_kvm_tunneled_kvm_policy — reads ../models/data_intersight_kvm_tunneled_kvm_policy.yml
locals { m787 = yamldecode(file("${path.module}/../models/data_intersight_kvm_tunneled_kvm_policy.yml"))["data_intersight_kvm_tunneled_kvm_policy"] }

data "intersight_kvm_tunneled_kvm_policy" "n787" {
  account_moid = try(local.m787["account_moid"], null)
  additional_properties = try(local.m787["additional_properties"], null)
  class_id = try(local.m787["class_id"], null)
  create_time = try(local.m787["create_time"], null)
  domain_group_moid = try(local.m787["domain_group_moid"], null)
  id = try(local.m787["id"], null)
  mod_time = try(local.m787["mod_time"], null)
  moid = try(local.m787["moid"], null)
  object_type = try(local.m787["object_type"], null)
  owners = try(local.m787["owners"], null)
  results = try(local.m787["results"], null)
  shared_scope = try(local.m787["shared_scope"], null)
  tunneled_kvm_configuration = try(local.m787["tunneled_kvm_configuration"], null)
  tunneled_kvm_launch = try(local.m787["tunneled_kvm_launch"], null)
  dynamic "account" {
    for_each = try(local.m787["account"], null) == null ? [] : local.m787["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m787["ancestors"], null) == null ? [] : local.m787["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m787["parent"], null) == null ? [] : local.m787["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m787["permission_resources"], null) == null ? [] : local.m787["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m787["tags"], null) == null ? [] : local.m787["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m787["version_context"], null) == null ? [] : local.m787["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
