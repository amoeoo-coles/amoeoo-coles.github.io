# Sample data source intersight_meraki_network — reads ../models/data_intersight_meraki_network.yml
locals { m835 = yamldecode(file("${path.module}/../models/data_intersight_meraki_network.yml"))["data_intersight_meraki_network"] }

data "intersight_meraki_network" "n835" {
  account_moid = try(local.m835["account_moid"], null)
  additional_properties = try(local.m835["additional_properties"], null)
  class_id = try(local.m835["class_id"], null)
  create_time = try(local.m835["create_time"], null)
  domain_group_moid = try(local.m835["domain_group_moid"], null)
  id = try(local.m835["id"], null)
  mod_time = try(local.m835["mod_time"], null)
  moid = try(local.m835["moid"], null)
  name = try(local.m835["name"], null)
  network_id = try(local.m835["network_id"], null)
  network_tags = try(local.m835["network_tags"], null)
  object_type = try(local.m835["object_type"], null)
  organization_id = try(local.m835["organization_id"], null)
  owners = try(local.m835["owners"], null)
  product_types = try(local.m835["product_types"], null)
  results = try(local.m835["results"], null)
  shared_scope = try(local.m835["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m835["ancestors"], null) == null ? [] : local.m835["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m835["organization"], null) == null ? [] : local.m835["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m835["parent"], null) == null ? [] : local.m835["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m835["permission_resources"], null) == null ? [] : local.m835["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m835["registered_device"], null) == null ? [] : local.m835["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m835["tags"], null) == null ? [] : local.m835["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m835["version_context"], null) == null ? [] : local.m835["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
