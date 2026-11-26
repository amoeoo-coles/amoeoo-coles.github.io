# Sample data source intersight_capability_equipment_physical_def — reads ../models/data_intersight_capability_equipment_physical_def.yml
locals { m156 = yamldecode(file("${path.module}/../models/data_intersight_capability_equipment_physical_def.yml"))["data_intersight_capability_equipment_physical_def"] }

data "intersight_capability_equipment_physical_def" "n156" {
  account_moid = try(local.m156["account_moid"], null)
  additional_properties = try(local.m156["additional_properties"], null)
  class_id = try(local.m156["class_id"], null)
  create_time = try(local.m156["create_time"], null)
  depth = try(local.m156["depth"], null)
  domain_group_moid = try(local.m156["domain_group_moid"], null)
  height = try(local.m156["height"], null)
  id = try(local.m156["id"], null)
  max_power = try(local.m156["max_power"], null)
  min_power = try(local.m156["min_power"], null)
  mod_time = try(local.m156["mod_time"], null)
  moid = try(local.m156["moid"], null)
  name = try(local.m156["name"], null)
  nominal_power = try(local.m156["nominal_power"], null)
  object_type = try(local.m156["object_type"], null)
  owners = try(local.m156["owners"], null)
  pid = try(local.m156["pid"], null)
  results = try(local.m156["results"], null)
  shared_scope = try(local.m156["shared_scope"], null)
  sku = try(local.m156["sku"], null)
  vid = try(local.m156["vid"], null)
  weight = try(local.m156["weight"], null)
  width = try(local.m156["width"], null)
  dynamic "ancestors" {
    for_each = try(local.m156["ancestors"], null) == null ? [] : local.m156["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m156["parent"], null) == null ? [] : local.m156["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m156["permission_resources"], null) == null ? [] : local.m156["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m156["tags"], null) == null ? [] : local.m156["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m156["version_context"], null) == null ? [] : local.m156["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
