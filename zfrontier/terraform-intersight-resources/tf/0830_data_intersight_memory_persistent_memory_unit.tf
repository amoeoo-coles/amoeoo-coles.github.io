# Sample data source intersight_memory_persistent_memory_unit — reads ../models/data_intersight_memory_persistent_memory_unit.yml
locals { m830 = yamldecode(file("${path.module}/../models/data_intersight_memory_persistent_memory_unit.yml"))["data_intersight_memory_persistent_memory_unit"] }

data "intersight_memory_persistent_memory_unit" "n830" {
  account_moid = try(local.m830["account_moid"], null)
  additional_properties = try(local.m830["additional_properties"], null)
  admin_state = try(local.m830["admin_state"], null)
  app_direct_capacity = try(local.m830["app_direct_capacity"], null)
  array_id = try(local.m830["array_id"], null)
  bank = try(local.m830["bank"], null)
  capacity = try(local.m830["capacity"], null)
  class_id = try(local.m830["class_id"], null)
  clock = try(local.m830["clock"], null)
  count_status = try(local.m830["count_status"], null)
  create_time = try(local.m830["create_time"], null)
  device_mo_id = try(local.m830["device_mo_id"], null)
  dn = try(local.m830["dn"], null)
  domain_group_moid = try(local.m830["domain_group_moid"], null)
  firmware_version = try(local.m830["firmware_version"], null)
  form_factor = try(local.m830["form_factor"], null)
  frozen_status = try(local.m830["frozen_status"], null)
  health_state = try(local.m830["health_state"], null)
  id = try(local.m830["id"], null)
  is_upgraded = try(local.m830["is_upgraded"], null)
  latency = try(local.m830["latency"], null)
  location = try(local.m830["location"], null)
  lock_status = try(local.m830["lock_status"], null)
  memory_capacity = try(local.m830["memory_capacity"], null)
  memory_id = try(local.m830["memory_id"], null)
  mod_time = try(local.m830["mod_time"], null)
  model = try(local.m830["model"], null)
  moid = try(local.m830["moid"], null)
  object_type = try(local.m830["object_type"], null)
  oper_power_state = try(local.m830["oper_power_state"], null)
  oper_reason = try(local.m830["oper_reason"], null)
  oper_state = try(local.m830["oper_state"], null)
  operability = try(local.m830["operability"], null)
  owners = try(local.m830["owners"], null)
  persistent_memory_capacity = try(local.m830["persistent_memory_capacity"], null)
  presence = try(local.m830["presence"], null)
  reserved_capacity = try(local.m830["reserved_capacity"], null)
  results = try(local.m830["results"], null)
  revision = try(local.m830["revision"], null)
  rn = try(local.m830["rn"], null)
  security_status = try(local.m830["security_status"], null)
  serial = try(local.m830["serial"], null)
  set = try(local.m830["set"], null)
  shared_scope = try(local.m830["shared_scope"], null)
  socket_id = try(local.m830["socket_id"], null)
  socket_memory_id = try(local.m830["socket_memory_id"], null)
  speed = try(local.m830["speed"], null)
  thermal = try(local.m830["thermal"], null)
  total_capacity = try(local.m830["total_capacity"], null)
  type = try(local.m830["type"], null)
  uid = try(local.m830["uid"], null)
  vendor = try(local.m830["vendor"], null)
  visibility = try(local.m830["visibility"], null)
  width = try(local.m830["width"], null)
  dynamic "ancestors" {
    for_each = try(local.m830["ancestors"], null) == null ? [] : local.m830["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m830["inventory_device_info"], null) == null ? [] : local.m830["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_array" {
    for_each = try(local.m830["memory_array"], null) == null ? [] : local.m830["memory_array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m830["parent"], null) == null ? [] : local.m830["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m830["permission_resources"], null) == null ? [] : local.m830["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m830["previous_fru"], null) == null ? [] : local.m830["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m830["registered_device"], null) == null ? [] : local.m830["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m830["tags"], null) == null ? [] : local.m830["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m830["version_context"], null) == null ? [] : local.m830["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
