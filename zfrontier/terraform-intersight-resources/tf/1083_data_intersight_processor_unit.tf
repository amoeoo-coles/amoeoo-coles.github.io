# Sample data source intersight_processor_unit — reads ../models/data_intersight_processor_unit.yml
locals { m1083 = yamldecode(file("${path.module}/../models/data_intersight_processor_unit.yml"))["data_intersight_processor_unit"] }

data "intersight_processor_unit" "n1083" {
  account_moid = try(local.m1083["account_moid"], null)
  additional_properties = try(local.m1083["additional_properties"], null)
  architecture = try(local.m1083["architecture"], null)
  class_id = try(local.m1083["class_id"], null)
  create_time = try(local.m1083["create_time"], null)
  description = try(local.m1083["description"], null)
  device_mo_id = try(local.m1083["device_mo_id"], null)
  dn = try(local.m1083["dn"], null)
  domain_group_moid = try(local.m1083["domain_group_moid"], null)
  id = try(local.m1083["id"], null)
  is_platform_supported = try(local.m1083["is_platform_supported"], null)
  is_upgraded = try(local.m1083["is_upgraded"], null)
  mod_time = try(local.m1083["mod_time"], null)
  model = try(local.m1083["model"], null)
  moid = try(local.m1083["moid"], null)
  num_cores = try(local.m1083["num_cores"], null)
  num_cores_enabled = try(local.m1083["num_cores_enabled"], null)
  num_threads = try(local.m1083["num_threads"], null)
  object_type = try(local.m1083["object_type"], null)
  oper_power_state = try(local.m1083["oper_power_state"], null)
  oper_reason = try(local.m1083["oper_reason"], null)
  oper_state = try(local.m1083["oper_state"], null)
  operability = try(local.m1083["operability"], null)
  owners = try(local.m1083["owners"], null)
  part_number = try(local.m1083["part_number"], null)
  pid = try(local.m1083["pid"], null)
  presence = try(local.m1083["presence"], null)
  processor_id = try(local.m1083["processor_id"], null)
  results = try(local.m1083["results"], null)
  revision = try(local.m1083["revision"], null)
  rn = try(local.m1083["rn"], null)
  serial = try(local.m1083["serial"], null)
  shared_scope = try(local.m1083["shared_scope"], null)
  socket_designation = try(local.m1083["socket_designation"], null)
  speed = try(local.m1083["speed"], null)
  stepping = try(local.m1083["stepping"], null)
  thermal = try(local.m1083["thermal"], null)
  vendor = try(local.m1083["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1083["ancestors"], null) == null ? [] : local.m1083["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m1083["compute_blade"], null) == null ? [] : local.m1083["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1083["compute_board"], null) == null ? [] : local.m1083["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1083["compute_rack_unit"], null) == null ? [] : local.m1083["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "connected_pcie_devices" {
    for_each = try(local.m1083["connected_pcie_devices"], null) == null ? [] : local.m1083["connected_pcie_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1083["inventory_device_info"], null) == null ? [] : local.m1083["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m1083["network_element"], null) == null ? [] : local.m1083["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1083["parent"], null) == null ? [] : local.m1083["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_endpoint" {
    for_each = try(local.m1083["pci_endpoint"], null) == null ? [] : local.m1083["pci_endpoint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1083["permission_resources"], null) == null ? [] : local.m1083["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1083["previous_fru"], null) == null ? [] : local.m1083["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1083["registered_device"], null) == null ? [] : local.m1083["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1083["tags"], null) == null ? [] : local.m1083["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1083["version_context"], null) == null ? [] : local.m1083["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
