# Sample data source intersight_memory_unit — reads ../models/data_intersight_memory_unit.yml
locals { m833 = yamldecode(file("${path.module}/../models/data_intersight_memory_unit.yml"))["data_intersight_memory_unit"] }

data "intersight_memory_unit" "n833" {
  account_moid = try(local.m833["account_moid"], null)
  additional_properties = try(local.m833["additional_properties"], null)
  admin_state = try(local.m833["admin_state"], null)
  array_id = try(local.m833["array_id"], null)
  bank = try(local.m833["bank"], null)
  capacity = try(local.m833["capacity"], null)
  class_id = try(local.m833["class_id"], null)
  clock = try(local.m833["clock"], null)
  create_time = try(local.m833["create_time"], null)
  description = try(local.m833["description"], null)
  device_mo_id = try(local.m833["device_mo_id"], null)
  dn = try(local.m833["dn"], null)
  domain_group_moid = try(local.m833["domain_group_moid"], null)
  form_factor = try(local.m833["form_factor"], null)
  id = try(local.m833["id"], null)
  is_platform_supported = try(local.m833["is_platform_supported"], null)
  is_upgraded = try(local.m833["is_upgraded"], null)
  latency = try(local.m833["latency"], null)
  location = try(local.m833["location"], null)
  memory_id = try(local.m833["memory_id"], null)
  mod_time = try(local.m833["mod_time"], null)
  model = try(local.m833["model"], null)
  moid = try(local.m833["moid"], null)
  object_type = try(local.m833["object_type"], null)
  oper_power_state = try(local.m833["oper_power_state"], null)
  oper_reason = try(local.m833["oper_reason"], null)
  oper_state = try(local.m833["oper_state"], null)
  operability = try(local.m833["operability"], null)
  owners = try(local.m833["owners"], null)
  part_number = try(local.m833["part_number"], null)
  pid = try(local.m833["pid"], null)
  presence = try(local.m833["presence"], null)
  results = try(local.m833["results"], null)
  revision = try(local.m833["revision"], null)
  rn = try(local.m833["rn"], null)
  serial = try(local.m833["serial"], null)
  set = try(local.m833["set"], null)
  shared_scope = try(local.m833["shared_scope"], null)
  speed = try(local.m833["speed"], null)
  thermal = try(local.m833["thermal"], null)
  type = try(local.m833["type"], null)
  vendor = try(local.m833["vendor"], null)
  visibility = try(local.m833["visibility"], null)
  width = try(local.m833["width"], null)
  dynamic "ancestors" {
    for_each = try(local.m833["ancestors"], null) == null ? [] : local.m833["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m833["inventory_device_info"], null) == null ? [] : local.m833["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_array" {
    for_each = try(local.m833["memory_array"], null) == null ? [] : local.m833["memory_array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m833["parent"], null) == null ? [] : local.m833["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m833["permission_resources"], null) == null ? [] : local.m833["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m833["previous_fru"], null) == null ? [] : local.m833["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m833["registered_device"], null) == null ? [] : local.m833["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m833["tags"], null) == null ? [] : local.m833["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m833["version_context"], null) == null ? [] : local.m833["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
