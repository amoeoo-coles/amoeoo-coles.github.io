# Sample data source intersight_power_power_group_member — reads ../models/data_intersight_power_power_group_member.yml
locals { m1082 = yamldecode(file("${path.module}/../models/data_intersight_power_power_group_member.yml"))["data_intersight_power_power_group_member"] }

data "intersight_power_power_group_member" "n1082" {
  account_moid = try(local.m1082["account_moid"], null)
  additional_properties = try(local.m1082["additional_properties"], null)
  allocated_power = try(local.m1082["allocated_power"], null)
  class_id = try(local.m1082["class_id"], null)
  config_state = try(local.m1082["config_state"], null)
  create_time = try(local.m1082["create_time"], null)
  device_registration_moid = try(local.m1082["device_registration_moid"], null)
  domain_group_moid = try(local.m1082["domain_group_moid"], null)
  id = try(local.m1082["id"], null)
  max_required_power = try(local.m1082["max_required_power"], null)
  member_type = try(local.m1082["member_type"], null)
  min_required_power = try(local.m1082["min_required_power"], null)
  mod_time = try(local.m1082["mod_time"], null)
  moid = try(local.m1082["moid"], null)
  object_type = try(local.m1082["object_type"], null)
  oper_state = try(local.m1082["oper_state"], null)
  owners = try(local.m1082["owners"], null)
  results = try(local.m1082["results"], null)
  shared_scope = try(local.m1082["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1082["ancestors"], null) == null ? [] : local.m1082["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device" {
    for_each = try(local.m1082["inventory_device"], null) == null ? [] : local.m1082["inventory_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1082["parent"], null) == null ? [] : local.m1082["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1082["permission_resources"], null) == null ? [] : local.m1082["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "power_group_parent" {
    for_each = try(local.m1082["power_group_parent"], null) == null ? [] : local.m1082["power_group_parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1082["tags"], null) == null ? [] : local.m1082["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1082["version_context"], null) == null ? [] : local.m1082["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
