# Sample resource intersight_kvm_tunneled_kvm_policy — reads ../models/intersight_kvm_tunneled_kvm_policy.yml
locals { m782 = yamldecode(file("${path.module}/../models/intersight_kvm_tunneled_kvm_policy.yml"))["intersight_kvm_tunneled_kvm_policy"] }

resource "intersight_kvm_tunneled_kvm_policy" "n782" {
  account = try(local.m782["account"], null)
  account_moid = try(local.m782["account_moid"], null)
  additional_properties = try(local.m782["additional_properties"], null)
  ancestors = try(local.m782["ancestors"], null)
  class_id = try(local.m782["class_id"], null)
  create_time = try(local.m782["create_time"], null)
  domain_group_moid = try(local.m782["domain_group_moid"], null)
  id = try(local.m782["id"], null)
  mod_time = try(local.m782["mod_time"], null)
  moid = try(local.m782["moid"], null)
  object_type = try(local.m782["object_type"], null)
  owners = try(local.m782["owners"], null)
  parent = try(local.m782["parent"], null)
  permission_resources = try(local.m782["permission_resources"], null)
  shared_scope = try(local.m782["shared_scope"], null)
  tags = try(local.m782["tags"], null)
  tunneled_kvm_configuration = try(local.m782["tunneled_kvm_configuration"], null)
  tunneled_kvm_launch = try(local.m782["tunneled_kvm_launch"], null)
  version_context = try(local.m782["version_context"], null)
}
