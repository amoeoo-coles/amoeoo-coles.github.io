# Sample data source intersight_adapter_unit_expander — reads ../models/data_intersight_adapter_unit_expander.yml
locals { m016 = yamldecode(file("${path.module}/../models/data_intersight_adapter_unit_expander.yml"))["data_intersight_adapter_unit_expander"] }

data "intersight_adapter_unit_expander" "n016" {
  account_moid = try(local.m016["account_moid"], null)
  additional_properties = try(local.m016["additional_properties"], null)
  class_id = try(local.m016["class_id"], null)
  create_time = try(local.m016["create_time"], null)
  device_mo_id = try(local.m016["device_mo_id"], null)
  dn = try(local.m016["dn"], null)
  domain_group_moid = try(local.m016["domain_group_moid"], null)
  id = try(local.m016["id"], null)
  is_upgraded = try(local.m016["is_upgraded"], null)
  mod_time = try(local.m016["mod_time"], null)
  model = try(local.m016["model"], null)
  moid = try(local.m016["moid"], null)
  object_type = try(local.m016["object_type"], null)
  owners = try(local.m016["owners"], null)
  part_number = try(local.m016["part_number"], null)
  presence = try(local.m016["presence"], null)
  results = try(local.m016["results"], null)
  revision = try(local.m016["revision"], null)
  rn = try(local.m016["rn"], null)
  serial = try(local.m016["serial"], null)
  shared_scope = try(local.m016["shared_scope"], null)
  vendor = try(local.m016["vendor"], null)
  vid = try(local.m016["vid"], null)
  dynamic "adapter_unit" {
    for_each = try(local.m016["adapter_unit"], null) == null ? [] : local.m016["adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m016["ancestors"], null) == null ? [] : local.m016["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m016["parent"], null) == null ? [] : local.m016["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m016["permission_resources"], null) == null ? [] : local.m016["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m016["previous_fru"], null) == null ? [] : local.m016["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m016["registered_device"], null) == null ? [] : local.m016["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m016["tags"], null) == null ? [] : local.m016["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m016["version_context"], null) == null ? [] : local.m016["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
