# Sample data source intersight_catalystsdwan_config_group — reads ../models/data_intersight_catalystsdwan_config_group.yml
locals { m199 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_config_group.yml"))["data_intersight_catalystsdwan_config_group"] }

data "intersight_catalystsdwan_config_group" "n199" {
  account_moid = try(local.m199["account_moid"], null)
  additional_properties = try(local.m199["additional_properties"], null)
  class_id = try(local.m199["class_id"], null)
  config_group_id = try(local.m199["config_group_id"], null)
  create_time = try(local.m199["create_time"], null)
  devices = try(local.m199["devices"], null)
  domain_group_moid = try(local.m199["domain_group_moid"], null)
  id = try(local.m199["id"], null)
  mod_time = try(local.m199["mod_time"], null)
  moid = try(local.m199["moid"], null)
  name = try(local.m199["name"], null)
  number_of_devices = try(local.m199["number_of_devices"], null)
  object_type = try(local.m199["object_type"], null)
  owners = try(local.m199["owners"], null)
  results = try(local.m199["results"], null)
  shared_scope = try(local.m199["shared_scope"], null)
  solution = try(local.m199["solution"], null)
  dynamic "ancestors" {
    for_each = try(local.m199["ancestors"], null) == null ? [] : local.m199["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m199["parent"], null) == null ? [] : local.m199["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m199["permission_resources"], null) == null ? [] : local.m199["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m199["registered_device"], null) == null ? [] : local.m199["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m199["tags"], null) == null ? [] : local.m199["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m199["version_context"], null) == null ? [] : local.m199["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
