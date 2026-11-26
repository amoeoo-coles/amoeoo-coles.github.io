# Sample data source intersight_virtualization_vmware_physical_network_interface — reads ../models/data_intersight_virtualization_vmware_physical_network_interface.yml
locals { m1422 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_physical_network_interface.yml"))["data_intersight_virtualization_vmware_physical_network_interface"] }

data "intersight_virtualization_vmware_physical_network_interface" "n1422" {
  account_moid = try(local.m1422["account_moid"], null)
  additional_properties = try(local.m1422["additional_properties"], null)
  class_id = try(local.m1422["class_id"], null)
  create_time = try(local.m1422["create_time"], null)
  domain_group_moid = try(local.m1422["domain_group_moid"], null)
  driver = try(local.m1422["driver"], null)
  id = try(local.m1422["id"], null)
  identity = try(local.m1422["identity"], null)
  link_speed = try(local.m1422["link_speed"], null)
  mac_address = try(local.m1422["mac_address"], null)
  mod_time = try(local.m1422["mod_time"], null)
  moid = try(local.m1422["moid"], null)
  name = try(local.m1422["name"], null)
  object_type = try(local.m1422["object_type"], null)
  owners = try(local.m1422["owners"], null)
  pci = try(local.m1422["pci"], null)
  results = try(local.m1422["results"], null)
  shared_scope = try(local.m1422["shared_scope"], null)
  switch_name = try(local.m1422["switch_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1422["ancestors"], null) == null ? [] : local.m1422["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1422["host"], null) == null ? [] : local.m1422["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1422["parent"], null) == null ? [] : local.m1422["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1422["permission_resources"], null) == null ? [] : local.m1422["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1422["registered_device"], null) == null ? [] : local.m1422["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1422["tags"], null) == null ? [] : local.m1422["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1422["version_context"], null) == null ? [] : local.m1422["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
