# Sample data source intersight_vnic_fc_network_policy — reads ../models/data_intersight_vnic_fc_network_policy.yml
locals { m1466 = yamldecode(file("${path.module}/../models/data_intersight_vnic_fc_network_policy.yml"))["data_intersight_vnic_fc_network_policy"] }

data "intersight_vnic_fc_network_policy" "n1466" {
  account_moid = try(local.m1466["account_moid"], null)
  additional_properties = try(local.m1466["additional_properties"], null)
  class_id = try(local.m1466["class_id"], null)
  create_time = try(local.m1466["create_time"], null)
  description = try(local.m1466["description"], null)
  domain_group_moid = try(local.m1466["domain_group_moid"], null)
  id = try(local.m1466["id"], null)
  mod_time = try(local.m1466["mod_time"], null)
  moid = try(local.m1466["moid"], null)
  name = try(local.m1466["name"], null)
  object_type = try(local.m1466["object_type"], null)
  owners = try(local.m1466["owners"], null)
  results = try(local.m1466["results"], null)
  shared_scope = try(local.m1466["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1466["ancestors"], null) == null ? [] : local.m1466["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1466["organization"], null) == null ? [] : local.m1466["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1466["parent"], null) == null ? [] : local.m1466["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1466["permission_resources"], null) == null ? [] : local.m1466["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1466["tags"], null) == null ? [] : local.m1466["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1466["version_context"], null) == null ? [] : local.m1466["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vsan_settings" {
    for_each = try(local.m1466["vsan_settings"], null) == null ? [] : local.m1466["vsan_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
