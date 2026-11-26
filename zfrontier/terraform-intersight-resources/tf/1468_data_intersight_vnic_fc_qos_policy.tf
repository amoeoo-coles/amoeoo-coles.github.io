# Sample data source intersight_vnic_fc_qos_policy — reads ../models/data_intersight_vnic_fc_qos_policy.yml
locals { m1468 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_qos_policy.yml"))["data_intersight_vnic_fc_qos_policy"] }

data "intersight_vnic_fc_qos_policy" "n1468" {
  account_moid = try(local.m1468["account_moid"], null)
  additional_properties = try(local.m1468["additional_properties"], null)
  burst = try(local.m1468["burst"], null)
  class_id = try(local.m1468["class_id"], null)
  cos = try(local.m1468["cos"], null)
  create_time = try(local.m1468["create_time"], null)
  description = try(local.m1468["description"], null)
  domain_group_moid = try(local.m1468["domain_group_moid"], null)
  id = try(local.m1468["id"], null)
  max_data_field_size = try(local.m1468["max_data_field_size"], null)
  mod_time = try(local.m1468["mod_time"], null)
  moid = try(local.m1468["moid"], null)
  name = try(local.m1468["name"], null)
  object_type = try(local.m1468["object_type"], null)
  owners = try(local.m1468["owners"], null)
  priority = try(local.m1468["priority"], null)
  rate_limit = try(local.m1468["rate_limit"], null)
  results = try(local.m1468["results"], null)
  shared_scope = try(local.m1468["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1468["ancestors"], null) == null ? [] : local.m1468["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1468["organization"], null) == null ? [] : local.m1468["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1468["parent"], null) == null ? [] : local.m1468["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1468["permission_resources"], null) == null ? [] : local.m1468["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1468["tags"], null) == null ? [] : local.m1468["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1468["version_context"], null) == null ? [] : local.m1468["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
