# Sample data source intersight_capability_domain_policy_requirement — reads ../models/data_intersight_capability_domain_policy_requirement.yml
locals { m154 = yamldecode(file("${path.module}/../models/data_intersight_capability_domain_policy_requirement.yml"))["data_intersight_capability_domain_policy_requirement"] }

data "intersight_capability_domain_policy_requirement" "n154" {
  account_moid = try(local.m154["account_moid"], null)
  additional_properties = try(local.m154["additional_properties"], null)
  class_id = try(local.m154["class_id"], null)
  create_time = try(local.m154["create_time"], null)
  domain_group_moid = try(local.m154["domain_group_moid"], null)
  id = try(local.m154["id"], null)
  min_bundle_version = try(local.m154["min_bundle_version"], null)
  min_version = try(local.m154["min_version"], null)
  mod_time = try(local.m154["mod_time"], null)
  model = try(local.m154["model"], null)
  moid = try(local.m154["moid"], null)
  name = try(local.m154["name"], null)
  object_type = try(local.m154["object_type"], null)
  owners = try(local.m154["owners"], null)
  policy_name = try(local.m154["policy_name"], null)
  results = try(local.m154["results"], null)
  shared_scope = try(local.m154["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m154["ancestors"], null) == null ? [] : local.m154["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate_policy_constraints" {
    for_each = try(local.m154["certificate_policy_constraints"], null) == null ? [] : local.m154["certificate_policy_constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ldap_constraints" {
    for_each = try(local.m154["ldap_constraints"], null) == null ? [] : local.m154["ldap_constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m154["parent"], null) == null ? [] : local.m154["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m154["permission_resources"], null) == null ? [] : local.m154["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "port_policy_constraints" {
    for_each = try(local.m154["port_policy_constraints"], null) == null ? [] : local.m154["port_policy_constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_control_policy_constraints" {
    for_each = try(local.m154["switch_control_policy_constraints"], null) == null ? [] : local.m154["switch_control_policy_constraints"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m154["tags"], null) == null ? [] : local.m154["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m154["version_context"], null) == null ? [] : local.m154["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
