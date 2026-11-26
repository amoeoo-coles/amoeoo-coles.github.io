# Sample data source intersight_virtualization_vmware_virtual_disk — reads ../models/data_intersight_virtualization_vmware_virtual_disk.yml
locals { m1426 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_virtual_disk.yml"))["data_intersight_virtualization_vmware_virtual_disk"] }

data "intersight_virtualization_vmware_virtual_disk" "n1426" {
  account_moid = try(local.m1426["account_moid"], null)
  additional_properties = try(local.m1426["additional_properties"], null)
  class_id = try(local.m1426["class_id"], null)
  compatibility_mode = try(local.m1426["compatibility_mode"], null)
  controller_key = try(var.secrets["data_intersight_virtualization_vmware_virtual_disk.controller_key"], local.m1426["controller_key"])
  create_time = try(local.m1426["create_time"], null)
  device_name = try(local.m1426["device_name"], null)
  disk_mode = try(local.m1426["disk_mode"], null)
  disk_type = try(local.m1426["disk_type"], null)
  domain_group_moid = try(local.m1426["domain_group_moid"], null)
  id = try(local.m1426["id"], null)
  key = try(var.secrets["data_intersight_virtualization_vmware_virtual_disk.key"], local.m1426["key"])
  limit = try(local.m1426["limit"], null)
  lun_uuid = try(local.m1426["lun_uuid"], null)
  mod_time = try(local.m1426["mod_time"], null)
  moid = try(local.m1426["moid"], null)
  name = try(local.m1426["name"], null)
  object_type = try(local.m1426["object_type"], null)
  owners = try(local.m1426["owners"], null)
  results = try(local.m1426["results"], null)
  serial = try(local.m1426["serial"], null)
  shared_scope = try(local.m1426["shared_scope"], null)
  sharing = try(local.m1426["sharing"], null)
  size = try(local.m1426["size"], null)
  storage_allocation_type = try(local.m1426["storage_allocation_type"], null)
  unit_number = try(local.m1426["unit_number"], null)
  uuid = try(local.m1426["uuid"], null)
  vdisk_id = try(local.m1426["vdisk_id"], null)
  vendor = try(local.m1426["vendor"], null)
  virtual_disk_path = try(local.m1426["virtual_disk_path"], null)
  vm_identity = try(local.m1426["vm_identity"], null)
  dynamic "ancestors" {
    for_each = try(local.m1426["ancestors"], null) == null ? [] : local.m1426["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datastore" {
    for_each = try(local.m1426["datastore"], null) == null ? [] : local.m1426["datastore"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1426["parent"], null) == null ? [] : local.m1426["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1426["permission_resources"], null) == null ? [] : local.m1426["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1426["registered_device"], null) == null ? [] : local.m1426["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shares" {
    for_each = try(local.m1426["shares"], null) == null ? [] : local.m1426["shares"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1426["tags"], null) == null ? [] : local.m1426["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1426["version_context"], null) == null ? [] : local.m1426["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_machine" {
    for_each = try(local.m1426["virtual_machine"], null) == null ? [] : local.m1426["virtual_machine"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
