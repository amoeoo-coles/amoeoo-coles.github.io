# Sample data source intersight_capability_equipment_slot_array — reads ../models/data_intersight_capability_equipment_slot_array.yml
locals { m157 = yamldecode(file("${path.module}/../models/data_intersight_capability_equipment_slot_array.yml"))["data_intersight_capability_equipment_slot_array"] }

data "intersight_capability_equipment_slot_array" "n157" {
  account_moid = try(local.m157["account_moid"], null)
  additional_properties = try(local.m157["additional_properties"], null)
  class_id = try(local.m157["class_id"], null)
  create_time = try(local.m157["create_time"], null)
  domain_group_moid = try(local.m157["domain_group_moid"], null)
  first_index = try(local.m157["first_index"], null)
  height = try(local.m157["height"], null)
  horizontal_start_offset = try(local.m157["horizontal_start_offset"], null)
  id = try(local.m157["id"], null)
  inline_group_separation = try(local.m157["inline_group_separation"], null)
  inline_group_size = try(local.m157["inline_group_size"], null)
  inline_offset = try(local.m157["inline_offset"], null)
  location = try(local.m157["location"], null)
  mod_time = try(local.m157["mod_time"], null)
  moid = try(local.m157["moid"], null)
  name = try(local.m157["name"], null)
  number_of_slots = try(local.m157["number_of_slots"], null)
  object_type = try(local.m157["object_type"], null)
  orientation = try(local.m157["orientation"], null)
  owners = try(local.m157["owners"], null)
  pid = try(local.m157["pid"], null)
  results = try(local.m157["results"], null)
  selector = try(local.m157["selector"], null)
  shared_scope = try(local.m157["shared_scope"], null)
  sku = try(local.m157["sku"], null)
  slots_per_line = try(local.m157["slots_per_line"], null)
  transverse_group_separation = try(local.m157["transverse_group_separation"], null)
  transverse_group_size = try(local.m157["transverse_group_size"], null)
  transverse_offset = try(local.m157["transverse_offset"], null)
  vertical_start_offset = try(local.m157["vertical_start_offset"], null)
  vid = try(local.m157["vid"], null)
  width = try(local.m157["width"], null)
  dynamic "ancestors" {
    for_each = try(local.m157["ancestors"], null) == null ? [] : local.m157["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m157["parent"], null) == null ? [] : local.m157["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m157["permission_resources"], null) == null ? [] : local.m157["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m157["tags"], null) == null ? [] : local.m157["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m157["version_context"], null) == null ? [] : local.m157["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
