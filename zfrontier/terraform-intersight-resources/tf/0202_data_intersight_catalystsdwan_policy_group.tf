# Sample data source intersight_catalystsdwan_policy_group — reads ../models/data_intersight_catalystsdwan_policy_group.yml
locals { m202 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_policy_group.yml"))["data_intersight_catalystsdwan_policy_group"] }

data "intersight_catalystsdwan_policy_group" "n202" {
  account_moid = try(local.m202["account_moid"], null)
  additional_properties = try(local.m202["additional_properties"], null)
  class_id = try(local.m202["class_id"], null)
  create_time = try(local.m202["create_time"], null)
  devices = try(local.m202["devices"], null)
  domain_group_moid = try(local.m202["domain_group_moid"], null)
  id = try(local.m202["id"], null)
  mod_time = try(local.m202["mod_time"], null)
  moid = try(local.m202["moid"], null)
  name = try(local.m202["name"], null)
  nr_version = try(local.m202["nr_version"], null)
  number_of_devices = try(local.m202["number_of_devices"], null)
  number_of_devices_up_to_date = try(local.m202["number_of_devices_up_to_date"], null)
  object_type = try(local.m202["object_type"], null)
  owners = try(local.m202["owners"], null)
  policy_group_id = try(local.m202["policy_group_id"], null)
  results = try(local.m202["results"], null)
  shared_scope = try(local.m202["shared_scope"], null)
  solution = try(local.m202["solution"], null)
  dynamic "ancestors" {
    for_each = try(local.m202["ancestors"], null) == null ? [] : local.m202["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m202["parent"], null) == null ? [] : local.m202["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m202["permission_resources"], null) == null ? [] : local.m202["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m202["registered_device"], null) == null ? [] : local.m202["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m202["tags"], null) == null ? [] : local.m202["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m202["version_context"], null) == null ? [] : local.m202["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
