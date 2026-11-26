# Sample data source intersight_fabric_fc_zone_policy — reads ../models/data_intersight_fabric_fc_zone_policy.yml
locals { m410 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fc_zone_policy.yml"))["data_intersight_fabric_fc_zone_policy"] }

data "intersight_fabric_fc_zone_policy" "n410" {
  account_moid = try(local.m410["account_moid"], null)
  additional_properties = try(local.m410["additional_properties"], null)
  class_id = try(local.m410["class_id"], null)
  create_time = try(local.m410["create_time"], null)
  description = try(local.m410["description"], null)
  domain_group_moid = try(local.m410["domain_group_moid"], null)
  fc_target_zoning_type = try(local.m410["fc_target_zoning_type"], null)
  id = try(local.m410["id"], null)
  mod_time = try(local.m410["mod_time"], null)
  moid = try(local.m410["moid"], null)
  name = try(local.m410["name"], null)
  object_type = try(local.m410["object_type"], null)
  owners = try(local.m410["owners"], null)
  results = try(local.m410["results"], null)
  shared_scope = try(local.m410["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m410["ancestors"], null) == null ? [] : local.m410["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_target_members" {
    for_each = try(local.m410["fc_target_members"], null) == null ? [] : local.m410["fc_target_members"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m410["organization"], null) == null ? [] : local.m410["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m410["parent"], null) == null ? [] : local.m410["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m410["permission_resources"], null) == null ? [] : local.m410["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m410["tags"], null) == null ? [] : local.m410["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m410["version_context"], null) == null ? [] : local.m410["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
